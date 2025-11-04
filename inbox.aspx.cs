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
    public partial class inbox : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        String fnm;
        string userroll;

        protected void Page_Load(object sender, EventArgs e)
        {
            getCon();
            if (Session["user"] == null)  // not logged in
            {
                login.Visible = true;
                register.Visible = true;
                profile.Visible = false;
            }
            else // Logged in
            {
                login.Visible = false;
                register.Visible = false;
                profile.Visible = true;

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
        void getCon()
        {
            SqlConnection con = new SqlConnection(s);
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
    }
}