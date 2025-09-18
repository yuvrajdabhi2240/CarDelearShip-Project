using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarDelearShip_Project
{
    public partial class CarDetails : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int Carid;
        string userroll;
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

                }
                else // Logged in
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        int Carid = Convert.ToInt32(Request.QueryString["Id"]);
                        getCon();
                        select(Carid);
                    }
                    else
                    {
                        Response.Write("<script>alert('SomeThing is Wrong... Try Again');window.location='all-cars.aspx';</script>");
                    }
                    login.Visible = false;
                    register.Visible = false;

                    // fetch image and userroll to show adminpage
                    da = new SqlDataAdapter("select Id,ProfileImage,UserRoll from register where Email = '" + Session["user"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    imgProfile.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();

                    userroll = ds.Tables[0].Rows[0]["UserRoll"].ToString();

                    if (userroll == "admin")
                    {
                        lnkadmin.Visible = true;
                    } // fetch image
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

            }
        }
        void select(int id)
        {
            da = new SqlDataAdapter("Select image1,image2,image3,image4,image5,Brand,Model,Year,Mileage,FuelType,Transmission,Price,Description,HolderName,HolderEmail,HolderPhone,(SELECT CountryName FROM Country WHERE Country.Id = SellCar.HolderCountry) AS HolderCountry,(SELECT StateName FROM State WHERE State.Id = SellCar.HolderState) AS HolderState,(SELECT CityName FROM City WHERE City.Id = SellCar.HolderCity) AS HolderCity from SellCar where Id = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);


            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        void getCon() // Connection with database
        {
            con = new SqlConnection(s);
            con.Open();
        }


        protected void lnkProfile_Click(object sender, EventArgs e)
        {
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();  
            Response.Write("<script>alert('Logout Successfully');window.location='Login.aspx';</script>");

        }

        // fill dropdown with cars 
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            compairdrop.Visible = true;
           

            getCon();
            da = new SqlDataAdapter("select Id,Brand,Model from SellCar",con);
            ds = new DataSet();
            da.Fill(ds);
            compairdrop.Items.Clear();
            compairdrop.Items.Insert(0, new ListItem("--- Select Car To Compair ---", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string text = ds.Tables[0].Rows[i]["Brand"].ToString() + " - " + ds.Tables[0].Rows[i]["Model"].ToString();
                string value = ds.Tables[0].Rows[i]["Id"].ToString(); 
                compairdrop.Items.Add(new ListItem(text, value));
            }

            ViewState["SelectedCarId"] = Request.QueryString["Id"];
        }

        // fetch car detils and fill in panels details
        protected void compairdrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Car1Id = Convert.ToInt32(ViewState["SelectedCarId"]);
            int Car2Id = Convert.ToInt32(compairdrop.SelectedValue.ToString());

            getCon();
            da = new SqlDataAdapter("SELECT Id,Brand,Model,Year,Mileage,FuelType,Transmission,Price,image1 from SellCar where Id in ('"+Car1Id+"','"+Car2Id+"')",con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 2)
            {
                //First Car(Row 0)
                
                lblCar1Model.Text = ds.Tables[0].Rows[0]["Model"].ToString();
                lblCar1Price.Text = ds.Tables[0].Rows[0]["Price"].ToString();
                imgcar1.ImageUrl = ds.Tables[0].Rows[0]["image1"].ToString();
                lblCar1Brand.Text = ds.Tables[0].Rows[0]["Brand"].ToString();
                lblCar1Model.Text = ds.Tables[0].Rows[0]["Model"].ToString();
                lblCar1Mileage.Text = ds.Tables[0].Rows[0]["Mileage"].ToString();
                lblCar1Year.Text = ds.Tables[0].Rows[0]["Year"].ToString();
                lblCar1Fuel.Text = ds.Tables[0].Rows[0]["FuelType"].ToString();
                lblCar1Trans.Text = ds.Tables[0].Rows[0]["Transmission"].ToString();
                
                // Second Car (Row 1)

                lblCar2Model.Text = ds.Tables[0].Rows[1]["Model"].ToString();
                lblCar2Price.Text = ds.Tables[0].Rows[1]["Price"].ToString();
                imgcar2.ImageUrl = ds.Tables[0].Rows[1]["image1"].ToString();
                lblCar2Brand.Text = ds.Tables[0].Rows[1]["Brand"].ToString();
                lblCar2Model.Text = ds.Tables[0].Rows[1]["Model"].ToString();
                lblCar2Mileage.Text = ds.Tables[0].Rows[1]["Mileage"].ToString();
                lblCar2Year.Text = ds.Tables[0].Rows[1]["Year"].ToString();
                lblCar2Fuel.Text = ds.Tables[0].Rows[1]["FuelType"].ToString();
                lblCar2Trans.Text = ds.Tables[0].Rows[1]["Transmission"].ToString();

            }

            pnlCompare.Visible = true;
        }
    }
}