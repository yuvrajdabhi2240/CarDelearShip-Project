using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;
using System.IO;
using System.Drawing;
using System.Reflection;

namespace CarDelearShip_Project.photo
{
    public partial class car_sell : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        // For Register User Store values : 
        int userid;
        string holdername;
        string holderemail;
        string holderphone;
        string holdercountry;
        string holderstate;
        string holdercity;
        string userroll;
        //store images ...
        string img1, img2, img3, img4, img5;
        int carid;

        bool isimage1 = false;
        bool isimage2 = false;
        bool isimage3 = false;
        bool isimage4 = false;
        bool isimage5 = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCon();
                if (Session["user"] == null)  // not logged in
                {

                    Response.Write("<script>alert('Please login than you able to see all pages');window.location='Login.aspx';</script>");
                    login.Visible = true;
                    register.Visible = true;
                    profile.Visible = false;
                }
                else // Logged in
                {
                    login.Visible = false;
                    register.Visible = false;
                    profile.Visible = true;

                    BindProducts();
                    getprofile();
                    if (userroll == "admin")
                    {
                        lnkadmin.Visible = true;
                    }
                }
            }
        }

        void getprofile()
        {
            da = new SqlDataAdapter("select Id,ProfileImage,UserRoll from register where Email = '" + Session["user"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            imgProfile.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();

            userroll = ds.Tables[0].Rows[0]["UserRoll"].ToString();

            if (userroll == "admin")
            {
                lnkadmin.Visible = true;
            }
        }
        // user added car show
        void BindProducts()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT Id, Brand, Image1, Price, Year, Mileage, FuelType, Transmission FROM SellCar where HolderEmail = '" + Session["user"] + "'", con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            da = new SqlDataAdapter("select * from Brand", con);
            ds = new DataSet();
            da.Fill(ds);
            brand.Items.Insert(0, new ListItem("--- Select Brand ---", ""));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                brand.Items.Add(ds.Tables[0].Rows[i]["Brand_Name"].ToString());
            }
        }
        void getCon() // Connection with database
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // select data for edit car
        void select()
        {
            getCon();
            da = new SqlDataAdapter("select Brand,Model,Year,Mileage,FuelType,Transmission,Price,Description from SellCar where Id = '" + ViewState["carid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);


            brand.SelectedValue = ds.Tables[0].Rows[0]["Brand"].ToString();
            model.Text = ds.Tables[0].Rows[0]["Model"].ToString();
            year.SelectedValue = ds.Tables[0].Rows[0]["Year"].ToString();
            mileage.Text = ds.Tables[0].Rows[0]["Mileage"].ToString();
            fueltype.SelectedValue = ds.Tables[0].Rows[0]["FuelType"].ToString();
            transmission.SelectedValue = ds.Tables[0].Rows[0]["Transmission"].ToString();
            price.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            Description.Text = ds.Tables[0].Rows[0]["Description"].ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewMore")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int CarId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                Response.Redirect("CarDetails.aspx?Id=" + CarId);
            }
            else if (e.CommandName == "edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                carid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                ViewState["carid"] = carid;   // store in ViewState
                select();
                Button1.Text = "Save Edit Data";
            }
            else if (e.CommandName == "delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                carid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                ViewState["carid"] = carid;   // store in ViewState
                deletecar();
                Response.Write("<script>alert('Delete Car Successfully');</script>");
                BindProducts();
            }

        }
        void deletecar()
        {
            getCon();
            cmd = new SqlCommand("DELETE FROM SellCar where Id = '" + ViewState["carid"] + "'", con);
            cmd.ExecuteNonQuery();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();  // Clear session
            Response.Write("<script>alert('LogOut Successfully');window.location='Login.aspx';</script>");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        void clear() // After submit the form clear the data
        {
            model.Text = "";
            mileage.Text = "";
            price.Text = "";
            Description.Text = "";
        }
        void imageupload()
        {
            if (photo1.HasFile)
            {
                string ext = Path.GetExtension(photo1.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    img1 = "photo/SellCar/" + photo1.FileName;
                    photo1.SaveAs(Server.MapPath(img1));
                    isimage1 = true;
                }
                else
                {
                    isimage1 = false;
                    Response.Write("<script>alert('Only JPG, JPEG, PNG, GIF files are allowed!');</script>");
                }
            }

            if (photo2.HasFile)
            {
                string ext = Path.GetExtension(photo2.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    img2 = "photo/SellCar/" + photo2.FileName;
                    photo2.SaveAs(Server.MapPath(img2));
                    isimage2 = true;
                }
                else
                {
                    isimage2 = false;
                    Response.Write("<script>alert('Only JPG, JPEG, PNG, GIF files are allowed!');</script>");
                }
            }

            if (photo3.HasFile)
            {
                string ext = Path.GetExtension(photo3.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    img3 = "photo/SellCar/" + photo3.FileName;
                    photo3.SaveAs(Server.MapPath(img3));
                    isimage3 = true;
                }
                else
                {
                    isimage3 = false;
                    Response.Write("<script>alert('Only JPG, JPEG, PNG, GIF files are allowed!');</script>");
                }
            }

            if (photo4.HasFile)
            {
                string ext = Path.GetExtension(photo4.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    img4 = "photo/SellCar/" + photo4.FileName;
                    photo4.SaveAs(Server.MapPath(img4));
                    isimage4 = true;
                }
                else
                {
                    isimage4 = false;
                    Response.Write("<script>alert('Only JPG, JPEG, PNG, GIF files are allowed!');</script>");
                }
            }

            if (photo5.HasFile)
            {
                string ext = Path.GetExtension(photo5.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    img5 = "photo/SellCar/" + photo5.FileName;
                    photo5.SaveAs(Server.MapPath(img5));
                    isimage5 = true;
                }
                else
                {
                    isimage5 = false;
                    Response.Write("<script>alert('Only JPG, JPEG, PNG, GIF files are allowed!');</script>");
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (isimage1 == true && isimage2 == true && isimage3 == true && isimage4 == true && isimage5 == true)
            {
                if (Button1.Text == "Submit Listing")
                {

                    if (Session["user"] != null)
                    {
                        getCon();

                        da = new SqlDataAdapter("select * from register where Email = '" + Session["user"] + "'", con);
                        ds = new DataSet();
                        da.Fill(ds);

                        userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
                        holdername = ds.Tables[0].Rows[0]["Username"].ToString();
                        holderemail = ds.Tables[0].Rows[0]["Email"].ToString();
                        holderphone = ds.Tables[0].Rows[0]["Phone"].ToString();
                        holdercountry = ds.Tables[0].Rows[0]["Country"].ToString();
                        holderstate = ds.Tables[0].Rows[0]["State"].ToString();
                        holdercity = ds.Tables[0].Rows[0]["City"].ToString();
                        imageupload();

                        if (brand.SelectedIndex != 0 && model.Text != "" && year.SelectedIndex != 0 && mileage.Text != "" && fueltype.SelectedIndex != 0 && transmission.SelectedIndex != 0 && price.Text != "")
                        {
                            getCon();
                            string queary = "insert into SellCar (Userid,Brand,Model,Year,Mileage,FuelType,Transmission,Price,Description,HolderName,HolderEmail,HolderPhone,HolderCountry,HolderState,HolderCity,image1,image2,image3,image4,image5) values('" + userid + "','" + brand.Text + "','" + model.Text + "','" + year.Text + "','" + mileage.Text + "','" + fueltype.Text + "','" + transmission.Text + "','" + price.Text + "','" + Description.Text + "','" + holdername + "','" + holderemail + "','" + holderphone + "','" + holdercountry + "','" + holderstate + "','" + holdercity + "','" + img1 + "','" + img2 + "','" + img3 + "','" + img4 + "','" + img5 + "')";
                            //insert Car queary
                            cmd = new SqlCommand(queary, con);
                            cmd.ExecuteNonQuery();
                            clear();
                            Response.Write("<script>alert('Car Add Successfully...');window.location='car-sell.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Something Went Wrong !!!');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Something Went Wrong !!!');</script>");
                    }
                }
                else
                {
                    getCon();

                    cmd = new SqlCommand("update SellCar SET Brand = '" + brand.SelectedValue + "',Model='" + model.Text + "',Year = '" + year.SelectedValue + "',Mileage='" + mileage.Text + "',FuelType = '" + fueltype.SelectedValue + "',Transmission = '" + transmission.SelectedValue + "',Price = '" + price.Text + "',Description='" + Description.Text + "' WHERE Id = '" + ViewState["carid"] + "'", con);
                    cmd.ExecuteNonQuery();
                    clear();
                    Response.Write("<script>alert('Car updated successfully!');</script>");
                }

            }
        }
    }
}
