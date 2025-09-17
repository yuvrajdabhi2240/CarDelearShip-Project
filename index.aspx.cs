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
    public partial class index : System.Web.UI.Page
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
                da = new SqlDataAdapter("select Id,ProfileImage,UserRoll from register where Email = '" + Session["user"] +"'",con);
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


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Save")
            {
                getCon();
                imageupload();
                cmd = new SqlCommand("insert into student_tbl (Name,Gender,Email,City,Image) values('" + name.Text + "','" + gender.Text + "','" + email.Text + "','" + city.Text + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clear();
            }
        }
        void clear()
        {
            name.Text = "";
            email.Text = "";
        }
        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imageupload()
        {
            if (file.HasFile)
            {
                fnm = "photo/" + file.FileName;
                file.SaveAs(Server.MapPath(fnm));
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

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