using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CarDelearShip_Project
{

    public partial class register : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int i;
        bool Isemail = false;
        string pf;
        bool imagevalid = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            getCon();
            if (!IsPostBack)
            {
                fillcountry();
            }
        }

        // insert register table
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Create")
            {
                profileimage();
                if (imagevalid == true)
                {
                    emailcheck();
                    if (Isemail == true)
                    {
                        getCon();
                        cmd = new SqlCommand("insert into register (Username,Email,Password,Phone,ProfileImage,Country,State,City) values('" + fullName.Text + "','" + email.Text + "','" + password.Text + "','" + phone.Text + "','" + pf + "','" + ViewState["countryid"] + "','" + ViewState["stateid"] + "','" + ViewState["cityid"] + "')", con);
                        cmd.ExecuteNonQuery();
                        clear();
                        Response.Write("<script>alert('Register Successfully,Now you can Login');window.location='Login.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Email is already registered');</script>");
                    }
                }
            }
        }
        void emailcheck()
        {
            getCon();
            cmd = new SqlCommand("SELECT count(*) from Register where Email = '" + email.Text + "'", con);
            i = Convert.ToInt32(cmd.ExecuteScalar());

            if (i > 0)
            {
                Isemail = false;
            }
            else
            {
                Isemail = true;
            }
        }

        //profile image add
        void profileimage()
        {
            if (ProfileImage.HasFile)
            {
                string ext = Path.GetExtension(ProfileImage.FileName);
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    pf = "photo/profileimage/" + ProfileImage.FileName;
                    ProfileImage.SaveAs(Server.MapPath(pf));
                    imagevalid = true;
                }
                else
                {
                    Response.Write("<script>alert('Only JPG, JPEG, PNG, GIF files are allowed!');</script>");
                }
            }
        }
        void getCon() // Connection with database
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void clear() // After submit the form clear the data
        {
            fullName.Text = "";
            email.Text = "";
            phone.Text = "";
            password.Text = "";
            confirmPassword.Text = "";
        }

        //select Country
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

        //select contry to add in dropdown and select state accoding to the state
        protected void country_SelectedIndexChanged(object sender, EventArgs e)
        {
            state.Items.Clear();
            city.Items.Clear();
            getCon();
            da = new SqlDataAdapter("SELECT * FROM Country where CountryName = '" + country.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["countryid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());


            da = new SqlDataAdapter("select * from State where Country_id = '" + ViewState["countryid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            state.Items.Insert(0, new ListItem("--- Select State ---", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                state.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }

        //select state to add in dropdown and select state accoding to the city
        protected void state_SelectedIndexChanged(object sender, EventArgs e)
        {
            city.Items.Clear();
            getCon();

            da = new SqlDataAdapter("select * from State where StateName = '" + state.Text + "'", con);
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

        // add city to dropdown
        protected void city_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from City where CityName = '" + city.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["cityid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());

        }
    }
}