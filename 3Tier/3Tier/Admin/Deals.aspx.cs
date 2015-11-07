using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace _3Tier.Admin
{
    public partial class Deals : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        static string excep_page = "Deals.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                if (!IsPostBack)
                {
                    Deals1();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Deals1()
        {
            try
            {
                ds = bl.Deals1();
                gvusers.DataSource = ds;
                gvusers.DataBind();
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected DataSet Permission()
        {
            if (Session["admin"] != null)
            {
                string type = Session["usertype"].ToString();
                string user = Session["admin"].ToString();
                ds = bl.permisson(type, user);
                return ds;
            }
            else
            {
                return null;
            }
        }


        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvusers.PageIndex = e.NewPageIndex;
            gvusers.DataBind();
            Deals1();
        }

         protected void ListName1(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["statausclient"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        ds = bl.emaildeal(listid);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            bmail.Text = ds.Tables[0].Rows[0]["bemail"].ToString();
                            bmobile.Text = ds.Tables[0].Rows[0]["bmobile"].ToString();
                            bcomment.Text = ds.Tables[0].Rows[0]["bcomment"].ToString();
                            lblsellertitle.Text = ds.Tables[0].Rows[0]["stitle"].ToString();
                            lblseller.Text = ds.Tables[0].Rows[0]["semail"].ToString();
                            sname.Text = ds.Tables[0].Rows[0]["seller"].ToString();


                            model1.Show();
                            pnledit.Visible = true;
                        }
                
                    }
                    catch (Exception ex)
                    {
                        bl.insert_exception(ex, excep_page);
                        Response.Redirect("~/ErrorPage.aspx");
                    }
                }
                else
                {
                    string strScript = "alert('No Permissions to do this task');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                string strScript = "alert('You Don't Have Permission');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }

        protected void ListName2(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["deleteclient"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.deletedeals(listid);

                        if (i != 0)
                        {
                            string strScript = "alert('Mail Deleted');location.replace('Deals.aspx');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        }
                        else
                        {
                            string strScript = "alert('Error Occured! Try again');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        bl.insert_exception(ex, excep_page);
                        Response.Redirect("~/ErrorPage.aspx");
                    }
                }
                else
                {
                    string strScript = "alert('No Permissions to do this task');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                string strScript = "alert('You Don't Have Permission');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }

        protected void btnsend_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int s=Convert.ToInt32(Session["listid1"]);

               string a= bmail.Text;
               string b = bmobile.Text;
               string c = bcomment.Text;
               string d = lblsellertitle.Text;
               string e1 = lblseller.Text;
               string f = sname.Text;


                SendMail(a,b,c,d,e1,f);

                int i = bl.updatedeals(s);

                if (i != 0)
                {
                    string strScript = "alert('Mail Sent to Buyer');location.replace('Deals.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                else
                {
                    string strScript = "alert('Error Occured! Try again');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        private void SendMail(string a, string b, string c, string d, string e1, string f)
        {
            string Body = " <br/><br/>Dear  " + f + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "One Of Buyer Sent Email to you. If interest Set the Deal<br/><br/>";

            Body += "<b>Your Email Id : </b> " + e1 + "<br/><br/>";

            Body += "<b>Your Item Title : </b> " + d + "<br>><br/>";

            Body += "<b>Buyer Mobile Id : </b> " + b + "<br/><br/>";

            Body += "<b>Buyer Email : </b> " + a + "<br>><br/>";

            Body += "<b>Buyer Comment : </b> " + c + "<br>><br/>";

            Body += "Visit <a href=" + ConfigurationManager.AppSettings["siteurl"] + " >here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Mail from Buyer");
            values.Add("body_html", Body);
            values.Add("to", e1);
            try
            {
                byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
            }

            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }


        protected void btncancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Deals.aspx");
        }
}
}