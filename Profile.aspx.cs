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
            da = new SqlDataAdapter("select r.Id, r.Username, r.Email, r.Phone, r.Country as CountryId, (select CountryName from Country where Country.Id = r.Country) as CountryName,r.State as StateId, (select StateName from State where State.Id = r.State) as StateName,\r\n       r.City as CityId,(select CityName from City where City.Id = r.City) as CityName,r.ProfileImage, r.UserRoll from Register r where r.Email = '" + Session["user"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            imgProfile.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();

            // fetch data to user profile
            profileAvatar.ImageUrl = ds.Tables[0].Rows[0]["ProfileImage"].ToString();
            username.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            emailProfile.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            phone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
            //country.SelectedValue = ds.Tables[0].Rows[0]["CountryId"].ToString();
            country.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
            ViewState["countryid"] = country.SelectedValue;
            fillstate();

            state.SelectedValue = ds.Tables[0].Rows[0]["State"].ToString();
            ViewState["stateid"] = state.SelectedValue;
            fillcity();

            //city.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            edit.Text = "Save Changes";

            if (edit.Text == "Save Changes")
            {
                updateprofile();
            }
        }
        void updateprofile()
        {
            getCon();
            cmd = new SqlCommand("UPDATE register SET Username = '" + username.Text + "',Email = '" + emailProfile.Text + "',Phone = '" + phone.Text + "',Country = '" + country.SelectedValue + "',State = '" + state.SelectedValue + "',City = '" + city.SelectedValue + "' WHERE Email = '" + Session["user"] + "'", con);
            cmd.ExecuteNonQuery();

            //show text box and all 
            username.Visible = false;
            emailProfile.Visible = false;
            phone.Visible = false;
            country.Visible = false;
            state.Visible = false;
            city.Visible = false;

            //remove labels or visiable false
            name.Visible = true;
            email.Visible = true;
            phonenumber.Visible = true;
            countryes.Visible = true;
            states.Visible = true;
            citys.Visible = true;

            edit.Text = "Edit Profile";
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
                country.Items.Add(new ListItem(ds.Tables[0].Rows[i]["CountryName"].ToString(), ds.Tables[0].Rows[i]["Id"].ToString()));
            }
            state.Items.Clear();
            state.Items.Insert(0, new ListItem("--- Select State ---", "0"));
            city.Items.Clear();
            city.Items.Insert(0, new ListItem("--- Select City ---", "0"));
        }
        void fillstate()
        {
            if (ViewState["countryid"] != null)
            {
                getCon();
                da = new SqlDataAdapter("SELECT * from State where Country_id = '" + ViewState["countryid"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                state.Items.Clear();
                state.Items.Insert(0, new ListItem("--- Select State ---", "0"));

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    state.Items.Add(new ListItem(ds.Tables[0].Rows[i]["StateName"].ToString(),
                                                 ds.Tables[0].Rows[i]["Id"].ToString()));
                }

                city.Items.Clear();
                city.Items.Insert(0, new ListItem("--- Select City ---", "0"));
            }
        }
        void fillcity()
        {
            if (ViewState["stateid"] != null)
            {
                getCon();
                da = new SqlDataAdapter("SELECT * from City where StateId = '" + ViewState["stateid"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                city.Items.Clear();
                city.Items.Insert(0, new ListItem("--- Select City ---", "0"));

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    city.Items.Add(new ListItem(ds.Tables[0].Rows[i]["CityName"].ToString(),
                                                ds.Tables[0].Rows[i]["Id"].ToString()));
                }
            }
        }
        protected void country_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["countryid"] = country.SelectedValue;
            fillstate();
        }

        protected void state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["stateid"] = state.SelectedValue;
            fillcity();
        }

        protected void city_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["cityid"] = city.SelectedValue;
        }
    }
}