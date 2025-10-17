using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarDelearShip_Project
{
    public partial class all_cars : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string userroll;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCon();
                if (Session["user"] == null)
                {
                    Response.Write("<script>alert('Please login than you able to see all pages');window.location='Login.aspx';</script>");
                    login.Visible = true;
                    register.Visible = true;

                    
                }
                else
                {
                    da = new SqlDataAdapter("select Id from register where Email = '" + Session["user"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    ViewState["userid"] = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());

                    BindProducts();
                    login.Visible = false;
                    register.Visible = false;

                    // fetch image
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
        void BindProducts()
        {
            getCon();
            
            // add brand
            if (!IsPostBack)
            {
                da = new SqlDataAdapter("select * from Brand", con);
                ds = new DataSet();
                da.Fill(ds);

                brand.Items.Insert(0, new ListItem(" Select Brand ", ""));
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    brand.Items.Add(ds.Tables[0].Rows[i]["Brand_Name"].ToString());
                }
            }
            // for filter
            string query = "SELECT Id, Brand, Image1, Price, Year, Mileage, FuelType, Transmission,CASE WHEN EXISTS (SELECT 1 FROM favorite WHERE favorite.carid = SellCar.Id AND favorite.userid = '" + ViewState["userid"] + "') THEN 1 ELSE 0 END AS IsFavorite FROM SellCar WHERE 1=1";

            if (Price.SelectedIndex != 0)
            {
                string[] range = Price.SelectedValue.Split('-');
                int minPrice = int.Parse(range[0].Trim());
                int maxPrice = int.Parse(range[1].Trim());

                query += $" AND Price BETWEEN {minPrice} AND {maxPrice}";
            }

            if (fueltype.SelectedIndex != 0)
            {
                query += " AND FuelType = '" + fueltype.SelectedValue + "'";
            }

            if (brand.SelectedIndex != 0)
            {
                query += " AND Brand = '" + brand.SelectedValue + "'";
            }

            if (Transmission.SelectedIndex != 0)
            {
                query += " AND Transmission = '" + Transmission.SelectedValue + "'";
            }

            if (favorite.SelectedIndex == 1)
            {
                query += " AND EXISTS (SELECT 1 FROM favorite f WHERE f.carid = SellCar.Id AND f.userid = '" + ViewState["userid"] + "')";
            }

            //  for filter dataset
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);    

            // check there ds is empty or not 
            if (ds.Tables[0].Rows.Count <= 0)
            {
                Label1.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label1.Visible = false;
                GridView1.Visible = true;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        void getCon() // Connection with database
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "ViewMore")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int CarId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                Response.Redirect("CarDetails.aspx?Id=" + CarId);
            }
            else if (e.CommandName == "favorite")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int CarId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                ViewState["favoritecarid"] = CarId;

                GridViewRow row = GridView1.Rows[rowIndex];
                Button btnFavorite = (Button)row.FindControl("favorite");

                if (btnFavorite != null)
                {
                    if (btnFavorite.Text == "Add To ♡")
                    {
                        btnFavorite.Text = "Remove ♥";
                        btnFavorite.ForeColor = System.Drawing.Color.Red;
                        favoriteadd(); // Call your method to add favorite
                    }
                    else 
                    {
                        btnFavorite.Text = "Add To ♡";
                        btnFavorite.ForeColor = System.Drawing.Color.Black;
                        favoriteremove(); // Call your method to add favorite
                    }
                }
            }
        }

        void favoriteadd()
        {
            getCon();
            if (Session["user"] != null)
            {
                string queary = "insert into favorite (userid,carid) values ('" + ViewState["userid"] + "','" + ViewState["favoritecarid"] + "')";
                cmd = new SqlCommand(queary, con);
                cmd.ExecuteNonQuery();

            }
        }
        void favoriteremove()
        {
            getCon();
            if (Session["user"] != null)
            {
                string queary = "delete from favorite where userid = '" + ViewState["userid"] + "' and carid = '" + ViewState["favoritecarid"] + "' ";
                cmd = new SqlCommand(queary, con);
                cmd.ExecuteNonQuery();
            }
        }
        protected void lnkProfile_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();  // Clear session
            Response.Write("<script>alert('LogOut Successfully');window.location='Login.aspx';</script>");
        }

        protected void Price_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void Transmission_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void fueltype_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void brand_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();

        }

        protected void favorite_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }
    }
}
