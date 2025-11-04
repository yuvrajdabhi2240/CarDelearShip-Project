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

namespace Database_Connectivity
{
    public partial class login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        String fnm;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void getCon() // Connection with database
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void clear() // After submit the form clear the data
        {
            email.Text = "";
            password.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (email.Text != "" && password.Text != "")
            {
                    getCon();
                    cmd = new SqlCommand("SELECT count(*) from Register where Email = '" + email.Text + "' and Password = '" + password.Text + "'", con);
                    i = Convert.ToInt32(cmd.ExecuteScalar());

                    if (i > 0)
                    {
                        Session["user"] = email.Text;
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.Text = "incorrect Email And Password ... ";
                    }
                
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Please Enter Email and Password ... ";
            }
            clear();
        }
    }
}
