using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
            string query = "SELECT Id, Brand, Image1, Price, Year, Mileage, FuelType, Transmission FROM SellCar WHERE 1=1";

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


            if (Transmission.SelectedIndex != 0)
            {
                query += " AND Transmission = '" + Transmission.SelectedValue + "'";
            }

            getCon();
            da = new SqlDataAdapter(query, con);
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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "ViewMore")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int CarId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                Response.Redirect("CarDetails.aspx?Id=" + CarId);
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
    }
}