using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CarDelearShip_Project
{
    public partial class Profile : System.Web.UI.Page
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
               
                fillcountry();
                if (Session["user"] == null)
                {
                    Response.Write("<script>alert('Please login than you able to see all pages');window.location='Login.aspx';</script>");
                    login.Visible = true;
                    register.Visible = true;
                }
                else
                {

                    login.Visible = false;
                    register.Visible = false;

                    // fetch image
                    da = new SqlDataAdapter("select Id,Username,Email,Phone,(Select CountryName from Country where Country.Id = Register.Country) AS Country,(Select StateName from State where State.Id = Register.State) AS State,(Select CityName from City where City.Id = Register.City) AS City,ProfileImage,UserRoll from register where Email = '" + Session["user"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    imgProfile.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();

                    // fetch data to user profile
                    profileAvatar.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();
                    name.Text = ds.Tables[0].Rows[0]["Username"].ToString();
                    email.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    phonenumber.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                    countryes.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                    states.Text = ds.Tables[0].Rows[0]["State"].ToString();
                    citys.Text = ds.Tables[0].Rows[0]["City"].ToString();

                    userroll = ds.Tables[0].Rows[0]["UserRoll"].ToString();

                    if (userroll == "admin")
                    {
                        lnkadmin.Visible = true;
                    }


                }
            }
        }
        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Session.Abandon();  // Clear session
            Response.Write("<script>alert('LogOut Successfully');window.location='Login.aspx';</script>");
        }

        protected void lnkProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void edit_Click(object sender, EventArgs e)
        {

            //show text box and all 
            username.Visible = true;
            emailProfile.Visible = true;
            phone.Visible = true;
            country.Visible = true;
            state.Visible = true;
            city.Visible = true;

            //remove labels or visiable false
            name.Visible = false;
            email.Visible = false;
            phonenumber.Visible = false;
            countryes.Visible = false;
            states.Visible = false;
            citys.Visible = false;

            getCon();
            da = new SqlDataAdapter("select Id,Username,Email,Phone,(select CountryName from Country where Country.Id = register.Country)as CountryName,(Select StateName from State where State.Id = Register.State) AS StateName,(Select CityName from City where City.Id = Register.City) AS CityName,ProfileImage,UserRoll from register where Email = '" + Session["user"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            imgProfile.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();

            // fetch data to user profile
            profileAvatar.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();
            username.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            emailProfile.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            phone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
            country.SelectedValue = ds.Tables[0].Rows[0]["CountryName"].ToString();
            state.SelectedValue = ds.Tables[0].Rows[0]["StateName"].ToString();
            city.SelectedValue = ds.Tables[0].Rows[0]["CityName"].ToString();
            

        }
        //fetch Country
        void fillcountry()
        {
            getCon();
            da = new SqlDataAdapter("SELECT * from Country", con);
            ds = new DataSet();
            da.Fill(ds);
            country.Items.Insert(0, new ListItem("--- Select Country ---", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                country.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }
        void fillstate()
        {
            getCon();
            
            da = new SqlDataAdapter("SELECT * from State where Country_id = '(SELECT Id FROM Country where CountryName = '" + country.SelectedValue +"')'", con);
            ds = new DataSet();
            da.Fill(ds);
            state.Items.Insert(0, new ListItem("--- Select Country ---", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                state.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }
        protected void country_SelectedIndexChanged(object sender, EventArgs e)
        {

            state.Items.Clear();
            city.Items.Clear();
            getCon();
            da = new SqlDataAdapter("SELECT * FROM Country where CountryName = '" + country.SelectedValue + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["countryid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());


           fillstate();

        }

        protected void state_SelectedIndexChanged(object sender, EventArgs e)
        {
            city.Items.Clear();
            getCon();

            da = new SqlDataAdapter("select * from State where StateName = '" + state.SelectedValue + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["stateid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());

            da = new SqlDataAdapter("select * from city where StateId = '" + ViewState["stateid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            city.Items.Insert(0, new ListItem("--- Select City ---", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                city.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }

        protected void city_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from City where CityName = '" + city.SelectedValue + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["cityid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
        }
    }
}