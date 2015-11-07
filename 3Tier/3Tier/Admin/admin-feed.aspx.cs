using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Data;
using System.Net;
using System.Configuration;
using System.Collections.Specialized;

namespace _3Tier.Admin
{
    public partial class admin_feed : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        static string excep_page = "admin-feed.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                if (!IsPostBack)
                {
                    feed();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void feed()
        {
            try
            {
                ds = bl.feed();
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

        private void sendEmail(string name, string mail, string query,string message,string subject)
        {
            string Body = " <br/><br/> Hi " + name + ",<br/><br/>Welcome to Indus <br/><br/>";

            Body += "<b>Your Mail :</b> " + mail + "<br/><br/>";

            Body += "<b>Your Subject :</b> " + subject + "<br/><br/>";

            Body += "<b>We received your Query :</b> " + query + "<br/><br/>";

            Body += "<b>Solution For Your Query :</b> " + message + "<br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding Your Query");
            values.Add("body_html", Body);
            values.Add("to", mail);
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

        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvusers.PageIndex = e.NewPageIndex;
            gvusers.DataBind();
            feed();
        }

        protected void ListName1(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["emailfeed"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        ds = bl.feedemail(listid);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string Mail = ds.Tables[0].Rows[0]["f_email"].ToString();
                            string Name = ds.Tables[0].Rows[0]["f_name"].ToString();
                            string subject = ds.Tables[0].Rows[0]["f_subject"].ToString();
                            string Message = ds.Tables[0].Rows[0]["f_message"].ToString();

                            lblname.Text = Name;
                            lblname.Visible = true;
                            lblmail.Text = Mail;
                            lblsubject.Text = subject;
                            lblsubject.Visible = true;
                            lblmail.Visible = true;
                            lblquery.Text = Message;

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
                if (ds2.Tables[0].Rows[0]["deletefeed"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.deletefeed(listid);

                        if (i != 0)
                        {
                            string strScript = "alert('Request Deleted');location.replace('admin-feed.aspx');";
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
                int listid = Convert.ToInt32(Session["listid1"]);

                ds = bl.feedemail(listid);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string name = lblname.Text;
                    string mail = lblmail.Text;
                    string query = lblquery.Text;
                    string message = txtmsg.Text;
                    string subject = lblsubject.Text;

                    sendEmail(name, mail, query, message, subject);

                    string strScript = "alert('Email Sent');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }

                else
                {
                    string strScript = "alert('Error Occured');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            catch(Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void btncancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("admin-feed.aspx");
        }
    }
}