using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Runtime.ConstrainedExecution;
using System.Data.SqlTypes;

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
                    da = new SqlDataAdapter("select Id from register where Email = '" + Session["user"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    ViewState["userid"] = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());

                    if (Request.QueryString["Id"] != null)
                    {
                        int Carid = Convert.ToInt32(Request.QueryString["Id"]);
                        getCon();
                        select(Carid);
                        BridData(Carid);
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
        void BridData(int carid)
        {
            getCon();
            da = new SqlDataAdapter("Select Brand from SellCar Where Id = '" + carid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            string brand = ds.Tables[0].Rows[0]["Brand"].ToString();
            da = new SqlDataAdapter("Select *,CASE WHEN EXISTS (SELECT 1 FROM favorite WHERE favorite.carid = SellCar.Id AND favorite.userid = '" + ViewState["userid"] + "') THEN 1 ELSE 0 END AS IsFavorite from SellCar where Brand = '" + brand + "' and Id != '" + carid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        void select(int carid)
        {
            da = new SqlDataAdapter("Select image1,image2,image3,image4,image5,Brand,Model,Year,Mileage,FuelType,Transmission,Price,Description,HolderName,HolderEmail,HolderPhone,(SELECT CountryName FROM Country WHERE Country.Id = SellCar.HolderCountry) AS HolderCountry,(SELECT StateName FROM State WHERE State.Id = SellCar.HolderState) AS HolderState,(SELECT CityName FROM City WHERE City.Id = SellCar.HolderCity) AS HolderCity,CASE WHEN EXISTS (SELECT 1 FROM favorite WHERE favorite.carid = SellCar.Id AND favorite.userid = '" + ViewState["userid"] + "') THEN 1 ELSE 0 END AS IsFavorite from SellCar where Id = '" + carid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            string queary = "SELECT Id From SellCar where Id = '" + carid + "' AND Userid = '" + ViewState["userid"] + "'";
            da = new SqlDataAdapter(queary, con);
            ds = new DataSet();
            da.Fill(ds);

            GridViewRow row = GridView1.Rows[0];
            Label lbl = (Label)row.FindControl("checkbook");
            Button btn = (Button)row.FindControl("book");

            if (ds.Tables[0].Rows.Count == 1)
            {
                lbl.Visible = true;
                btn.Visible = false;
            }
            else
            {
                lbl.Visible = false;
                btn.Visible = true;
            }
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

            Button clickedButton = (Button)sender;

            if (clickedButton.Text == "Compare")
            {
                compairdrop.Visible = true;
                clickedButton.Text = "Remove Compare";
            }
            else
            {

                compairdrop.Visible = false;
                pnlCompare.Visible = false;
                clickedButton.Text = "Compare";
            }

            getCon();
            da = new SqlDataAdapter("select Id,Brand,Model from SellCar", con);
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

            string excludedCarId = Request.QueryString["Id"];

            ListItem itemToRemove = compairdrop.Items.FindByValue(excludedCarId);
            compairdrop.Items.Remove(itemToRemove);

            ViewState["SelectedCarId"] = Convert.ToInt32(Request.QueryString["Id"].ToString());
        }

        // fetch car detils and fill in panels details
        protected void compairdrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Car1Id = Convert.ToInt32(ViewState["SelectedCarId"]);
            int Car2Id = Convert.ToInt32(compairdrop.SelectedValue.ToString());

            getCon();
            da = new SqlDataAdapter("SELECT Id,Brand,Model,Year,Mileage,FuelType,Transmission,Price,image1 from SellCar where Id in ('" + Car1Id + "','" + Car2Id + "')", con);
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



        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "favorite")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                Button btnFavorite = (Button)row.FindControl("favorite");

                int CarId = Convert.ToInt32(Request.QueryString["Id"].ToString());

                if (btnFavorite != null)
                {
                    if (btnFavorite.Text == "Add To ♡")
                    {
                        btnFavorite.Text = "Remove ♥";
                        btnFavorite.ForeColor = System.Drawing.Color.Red;
                        favoriteadd(CarId); // Call your method to add favorite
                    }
                    else
                    {
                        btnFavorite.Text = "Add To ♡";
                        btnFavorite.ForeColor = System.Drawing.Color.Black;
                        favoriteremove(CarId); // Call your method to add favorite
                    }
                }
            }

            if (e.CommandName == "BookSchedual")
            {
                int rowIndex = 0;
                GridViewRow row = GridView1.Rows[rowIndex];

                Label datetxt = (Label)row.FindControl("datelab");
                TextBox cal = (TextBox)row.FindControl("date");
                TextBox time = (TextBox)row.FindControl("time");
                Button book = (Button)row.FindControl("book");
                if (book.Text == "Test Car Schedual")
                {
                    book.Text = "Book Schedual";
                    cal.Visible = true;
                    time.Visible = true;
                    datetxt.Visible = true;
                    compairdrop.Visible = false;
                    pnlCompare.Visible = false;
                }
                else
                {
                    string fullDateTimeString = cal.Text + " " + time.Text;

                    if (DateTime.TryParse(fullDateTimeString, out DateTime scheduledDateTime))
                    {
                        DateTime now = DateTime.Now;

                        if (scheduledDateTime < now.AddMinutes(-1))
                        {
                            cal.Text = now.ToString("yyyy-MM-dd");
                            time.Text = now.ToString("HH:mm");
                        }

                    }
                }
            }

        }



        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "viewcarfavorite")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];
                Button Favorite = (Button)row.FindControl("favoritecars");

                int CarId = Convert.ToInt32(GridView2.DataKeys[rowIndex].Value);

                if (Favorite != null)
                {

                    if (Favorite.Text == "Add To ♡")
                    {
                        Favorite.Text = "Remove ♥";
                        Favorite.ForeColor = System.Drawing.Color.Red;
                        favoriteadd(CarId); // Call your method to add favorite
                    }
                    else
                    {
                        Favorite.Text = "Add To ♡";
                        Favorite.ForeColor = System.Drawing.Color.Black;
                        favoriteremove(CarId); // Call your method to add favorite
                    }
                }
            }
            else if (e.CommandName == "ViewMore")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];

                int CarId = Convert.ToInt32(GridView2.DataKeys[rowIndex].Value);

                Response.Redirect("CarDetails.aspx?Id=" + CarId);
            }
        }
        void favoriteadd(int car)
        {
            getCon();
            if (Session["user"] != null)
            {
                string queary = "insert into favorite (userid,carid) values ('" + ViewState["userid"] + "','" + car + "')";
                cmd = new SqlCommand(queary, con);
                cmd.ExecuteNonQuery();
            }
        }
        void favoriteremove(int car)
        {
            getCon();
            if (Session["user"] != null)
            {
                string queary = "delete from favorite where userid = '" + ViewState["userid"] + "' and carid = '" + car + "' ";
                cmd = new SqlCommand(queary, con);
                cmd.ExecuteNonQuery();
            }
        }
    }
}