using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace _3Tier.Admin
{
    public partial class admin_support : System.Web.UI.Page
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
                    support1();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void support1()
        {
            try
            {
                ds = bl.support1();
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
            support1();
        }

        protected void ListName1(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["solutionsupport"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        ds = bl.solutionsupport(listid);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            excepname.Text = ds.Tables[0].Rows[0]["Excep_Desc"].ToString();
                            exceppage.Text = ds.Tables[0].Rows[0]["Excep_Page"].ToString();
                            excepline.Text = ds.Tables[0].Rows[0]["Excep_Lineno"].ToString();

                            if (ds2.Tables[0].Rows[0]["usertype"].ToString() != "Admin")
                            {
                                res.Visible = false;
                                res1.Visible = true;
                                btnsend.Visible = false;
                                btnsend1.Visible = true;
                                res2.Visible = false;


                            }
                            else
                            {
                                res.Visible = true;
                                res1.Visible = false;
                                res2.Visible = true;
                                btnsend.Visible = true;
                                btnsend1.Visible = false;
                                if (ds.Tables[0].Rows[0]["Excep_status"].ToString() == "1")
                                {
                                    Tr1.Visible = true;
                                    TextBox1.Text = ds.Tables[0].Rows[0]["responce"].ToString();
                                }
                                else
                                {
                                    Tr1.Visible = false;

                                }
                            }

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
                if (ds2.Tables[0].Rows[0]["deletesupport"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.deletesupport(listid);

                        if (i != 0)
                        {
                            string strScript = "alert('Exception Deleted');location.replace('admin-support.aspx');";
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
            if (dda.SelectedItem.Text != "Select")
            {
                try
                {
                    int s = Convert.ToInt32(Session["listid1"]);
                    string f = Assignedemail.Text;
                  
                    string crdrevs = f;
                    string crdres = "";
                    crdrevs = crdrevs.TrimEnd(',');

                    string[] crdrevis = Regex.Split(crdrevs, ",");
                    for (int i = 0; i < crdrevis.Length; i++)
                    {
                        crdres = crdrevis[i];
                        SendMail(crdres);

                    }
                    string strScript = "alert('Mail Sent to Assigner');location.replace('admin-support.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
            else
            {
                string strScript = "alert('Please select assigner type');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                model1.Show();
                pnledit.Visible = true;
            }
        }

        private void SendMail(string f)
        {
            string Body = " <br/><br/>Dear  " + f + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "Errors occred in the pages.  Solve asap <br/><br/>";

            Body += "<b>Thanks & Regards </b><br/>";
            Body += "<b>INDUS</b> <br/><br/>";

            Body += "Login <a href=" + ConfigurationManager.AppSettings["siteurl4"] + " >here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Exception occured in Pages");
            values.Add("body_html", Body);
            values.Add("to", f);
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
            Response.Redirect("admin-support.aspx");
        }

        protected void dda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dda.SelectedItem.Text != "Select")
            {
                try
                {
                    string s = dda.SelectedItem.Text;
                    ds = bl.fineassigner(s);
                    string a = "";
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            a += ds.Tables[0].Rows[i]["emailid"].ToString() + ",";
                        }
                        a = a.Remove(a.Length - 1);
                        Assignedemail.Text = a;
                    }
                    else
                    {
                        string strScript = "alert('You are not create this user');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        Assignedemail.Text = "";
                    }
                    model1.Show();
                    pnledit.Visible = true;
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
            else
            {
                string strScript = "alert('Please select assigner type');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                model1.Show();
                pnledit.Visible = true;
            }
        }
        protected void btnsend1_Click(object sender, ImageClickEventArgs e)
        {
            if (Label2.Text != null)
            {
                try
                {
                    int s1 = Convert.ToInt32(Session["listid1"]);
                     ds = bl.findadmin();
                     string s = ds.Tables[0].Rows[0]["emailid"].ToString();

                     string s2 = Label2.Text;
                     int x = bl.updatesupport(s2,s1);
                      SendMail1(s);

                    
                    string strScript = "alert('Mail Sent to Admin');location.replace('admin-support.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
            else
            {
                string strScript = "alert('Please fill Textbox');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                model1.Show();
                pnledit.Visible = true;
            }
        }
        private void SendMail1(string f)
        {
            string Body = " <br/><br/>Dear  " + f + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "Exceptions Rectified in the Site.<br/><br/>";

            Body += "<b>Thanks & Regards </b><br/>";
            Body += "<b>INDUS</b> <br/><br/>";


            Body += "Login <a href=" + ConfigurationManager.AppSettings["siteurl4"] + " >here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Exception occred in Pages");
            values.Add("body_html", Body);
            values.Add("to", f);
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
}
}