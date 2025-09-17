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
            Session.Abandon();  // Clear session
            Response.Write("<script>alert('LogOut Successfully');window.location='Login.aspx';</script>");

        }
    }
}