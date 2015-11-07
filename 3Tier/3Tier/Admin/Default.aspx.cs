using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Data;

namespace _3Tier.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        dal dl = new dal();
        bll bl = new bll();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }

        protected void Signin_Click(object sender, EventArgs e)
        {
            string type = ddlUsertype.SelectedItem.Text;
            string contry = ddlCountry.SelectedItem.Text;
            string user = txtuname.Text;
            string pwd = txtpwd.Text;

            ds = bl.verifyuser(type, contry, user, pwd);

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                if (Convert.ToString(ds.Tables[0].Rows[0]["status"]) == "1")
                {
                    string Cusername = ds.Tables[0].Rows[0]["username"].ToString();
                    string usertype = ds.Tables[0].Rows[0]["usertype"].ToString();
                    Session["Authentication"] = "true";
                    Session.Add("admin", Cusername);
                    Session.Add("usertype", usertype);

                    Response.Redirect("Home.aspx");
                }

                else
                {
                    string strScript = "alert('Please Enter Correct User Credentials');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                    ddlCountry.SelectedIndex = -1;
                    ddlUsertype.SelectedIndex = -1;
                    txtuname.Text = "";
                    txtpwd.Text = "";
                }
            }
            else
            {
                string strScript = "alert('You are Not Authorised user');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }

        //private bool Login(string utype, string ucontry, string User, string Passwd)
        //{
        //    if (utype == "Admin" && ucontry == "India" && User == "admin" && Passwd == "admin1")
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}
    }
}