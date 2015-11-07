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
    public partial class admin_contact : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        static string excep_page = "admin-contact.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                if (!IsPostBack)
                {
                    contact();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void contact()
        {
            try
            {
                ds = bl.contact();
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

        private void sendEmail(string name, string mail, string query, string message)
        {
            string Body = " <br/><br/> Hi " + name + ",<br/><br/>Welcome to Indus <br/><br/>";

            Body += "<b>Your Mail :</b> " + mail + "<br/><br/>";

            Body += "<b>We received your Query :</b> " + query + "<br/><br/>";

            Body += "<b>Solution for your Query :</b> " + message + "<br/><br/>";

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
            contact();
        }

        protected void ListName1(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["emailcontact"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        ds = bl.findEmail(listid);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string Mail = ds.Tables[0].Rows[0]["email"].ToString();
                            string Name = ds.Tables[0].Rows[0]["fname"].ToString();
                            string Message = ds.Tables[0].Rows[0]["comments"].ToString();

                            lblname.Text = Name;
                            lblname.Visible = true;
                            lblmail.Text = Mail;
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
                if (ds2.Tables[0].Rows[0]["deletecontact"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.deletecontct(listid);

                        if (i != 0)
                        {
                            string strScript = "alert('Request Deleted');location.replace('admin-contact.aspx');";
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

                ds = bl.findEmail(listid);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string name = lblname.Text;
                    string mail = lblmail.Text;
                    string query = lblquery.Text;
                    string message = txtmsg.Text;

                    sendEmail(name, mail, query, message);

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
            Response.Redirect("admin-contact.aspx");
        }
    }
}