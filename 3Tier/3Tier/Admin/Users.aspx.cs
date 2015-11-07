using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;
using System.Net;

namespace _3Tier.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        static string excep_page = "Users.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin"] != null)
            {
                if (!IsPostBack)
                {
                    clients();
                    Postad();
                    contact();
                    feed();
                    support();
                    users();

                    data();

                    clients1();
                    Postad1();
                    contact1();
                    feed1();
                    support1();
                    users1();

                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        public void data()
        {
            try
            {
                ds = bl.allusers();
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
            data();
        }

        protected void lnkcreate_Click(object sender, EventArgs e)
        {
            try
            {
                ds = Permission();
                if (ds.Tables[0].Rows.Count != 0)
                {
                    if (ds.Tables[0].Rows[0]["createuser"].ToString() == "1")
                    {
                        createuser1.Visible = true;
                        gvdisplay.Visible = false;
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
            catch(Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void ListName(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["updateuser"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid"] = listid;

                        ds = bl.findone(listid);

                        txtedlname.Text = ds.Tables[0].Rows[0]["username"].ToString();
                        txtedfname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                        ddleddesgn.SelectedItem.Text = ds.Tables[0].Rows[0]["usertype"].ToString();
                        ddledcountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                        txtedcontact.Text = ds.Tables[0].Rows[0]["password"].ToString();
                        txtedmail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                        txtedaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                        txtedmob.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                        ModalPopupExtender1.Show();
                    }
                    catch (Exception ex)
                    {
                        bl.insert_exception(ex, excep_page);
                        Response.Redirect("~/ErrorPage.aspx");
                    }
                }
                else
                {
                    ModalPopupExtender1.Hide();
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

        protected void ListName1(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["statusuer"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid"] = listid;

                        int i = bl.userstatus(listid);
                        if (i != 0)
                        {
                            try
                            {
                                ds = bl.finduserstatus(listid);
                                string a = ds.Tables[0].Rows[0]["fname"].ToString();
                                string b = ds.Tables[0].Rows[0]["emailid"].ToString();

                                if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
                                {
                                    SendMail1(a, b);
                                    string strScript = "alert('User Status Modified');location.replace('Users.aspx');";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                                }
                                else
                                {
                                    SendMail(a, b);
                                    string strScript = "alert('User Status Modified');location.replace('Users.aspx');";
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
                    ModalPopupExtender1.Hide();
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

        private void SendMail(string a, string b)
        {
            string Body = " <br/><br/> Dear " + a + ",<br/><br/>Greetings from Indus!! <br/><br/>";

            Body += "Our admin has Stoped your Permissions to access the site temporarly  <br/><br/>";


            Body += "<b>Your Mail :</b> " + b + "<br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding account Stopped");
            values.Add("body_html", Body);
            values.Add("to", b);
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

        private void SendMail1(string a, string b)
        {
            string Body = " <br/><br/> Dear " + a + ",<br/><br/>Greetings from Indus!! <br/><br/>";

            Body += "Our admin has Given Permissions to access the site  <br/><br/>";


            Body += "<b>Your Mail :</b> " + b + "<br/><br/>";

            Body += "For More Details Of Site. Please Login <a href=" + ConfigurationManager.AppSettings["siteurl4"] + " >here</a> <br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding account created");
            values.Add("body_html", Body);
            values.Add("to", b);
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

        protected void ListName2(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["deleteuser"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid"] = listid;

                        int i = bl.deleteuser(listid);
                        if (i != 0)
                        {
                            string strScript = "alert('User Deleted Successfully');location.replace('Users.aspx');";
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
                    ModalPopupExtender1.Hide();
                    string strScript = "alert('No Permissions to do this task');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                string strScript = "alert('You Don't Have Permission');location.replace('Users.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }


        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            try
            {
                string uname = txtLName.Text;
                string fname = txtFName.Text;
                string pwd = txtPwd.Text;
                string dis = ddlUserType.SelectedItem.Text;
                string cont = ddlCountry.SelectedItem.Text;
                string add = txtAddress.Text;
                string mobile = txtMobile.Text;
                string contact = txtConNumber.Text;
                string email = txtEmailId.Text;
                int status = 1;

                string clientview = "";
                string clientupdate = "";
                string clientstatus = "";
                string clientdelete = "";
                string clientcreate = "";

                string adview = "";
                string adstatus = "";
                string addelete = "";
                string adcreate = "";

                string usview = "";
                string usemail = "";
                string usdelete = "";

                string feedview = "";
                string feedmail = "";
                string feeddelete = "";

                string supportview = "";
                string supportsolution = "";
                string supportdelete = "";

                string userview = "";
                string userupdate = "";
                string userstatus = "";
                string userdelete = "";
                string usercreate = "";

                string date = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");


                if (chkview.Checked == true) { clientview = "1"; } else { clientview = "0"; }
                if (chkedit.Checked == true) { clientupdate = "1"; } else { clientupdate = "0"; }
                if (chkstatus.Checked == true) { clientstatus = "1"; } else { clientstatus = "0"; }
                if (chkdelete.Checked == true) { clientdelete = "1"; } else { clientdelete = "0"; }
                if (chkcreate.Checked == true) { clientcreate = "1"; } else { clientcreate = "0"; }

                if (CheckBox2.Checked == true) { adview = "1"; } else { adview = "0"; }
                if (CheckBox3.Checked == true) { adstatus = "1"; } else { adstatus = "0"; }
                if (CheckBox4.Checked == true) { addelete = "1"; } else { addelete = "0"; }
                if (CheckBox5.Checked == true) { adcreate = "1"; } else { adcreate = "0"; }

                if (CheckBox7.Checked == true) { usview = "1"; } else { usview = "0"; }
                if (CheckBox8.Checked == true) { usemail = "1"; } else { usemail = "0"; }
                if (CheckBox9.Checked == true) { usdelete = "1"; } else { usdelete = "0"; }

                if (CheckBox11.Checked == true) { feedview = "1"; } else { feedview = "0"; }
                if (CheckBox12.Checked == true) { feedmail = "1"; } else { feedmail = "0"; }
                if (CheckBox13.Checked == true) { feeddelete = "1"; } else { feeddelete = "0"; }

                if (CheckBox15.Checked == true) { supportview = "1"; } else { supportview = "0"; }
                if (CheckBox16.Checked == true) { supportsolution = "1"; } else { supportsolution = "0"; }
                if (CheckBox17.Checked == true) { supportdelete = "1"; } else { supportdelete = "0"; }

                if (CheckBox19.Checked == true) { userview = "1"; } else { userview = "0"; }
                if (CheckBox20.Checked == true) { userupdate = "1"; } else { userupdate = "0"; }
                if (CheckBox21.Checked == true) { userstatus = "1"; } else { userstatus = "0"; }
                if (CheckBox22.Checked == true) { userdelete = "1"; } else { userdelete = "0"; }
                if (CheckBox23.Checked == true) { usercreate = "1"; } else { usercreate = "0"; }

                int s = bl.createuser(uname, fname, pwd, dis, cont, add, mobile, contact, email, status, clientview, clientupdate, clientstatus, clientdelete, clientcreate, adview, adstatus, addelete, adcreate, usview, usemail, usdelete, feedview, feedmail, feeddelete, supportview, supportsolution, supportdelete, userview, userupdate, userstatus, userdelete, usercreate, date);

                if (s != 0)
                {
                    string a = Session["admin"].ToString();
                    SendMail(uname, fname, pwd, dis, cont, mobile, contact, email);
                    SendMail1(a, uname, fname, pwd, dis, cont, mobile, contact, email);

                    string strScript = "alert('User is Created Sucessfully');location.replace('Users.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    clear();
                }
                else
                {
                    string strScript = "alert('Error Occured ! Try again');location.replace('Users.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        private void SendMail(string uname, string fname, string pwd, string dis, string cont, string mobile, string contact, string email)
        {
            string Body = " <br/><br/> Dear " + fname + ",<br/><br/>Greetings from Indus!! <br/><br/>";

            Body += "Our admin has created you as a " + dis + ". Your credentials <br/><br/>";


            Body += "<b>Your Mail :</b> " + email + "<br/><br/>";

            Body += "<b> Country :</b> " + cont + "<br/><br/>";

            Body += "<b> User Type :</b> " + dis + "<br/><br/>";

            Body += "<b> uname : </b> " + uname + "<br/><br/>";

            Body += "<b> Password :</b> " + pwd + "<br/><br/>";

            Body += "<b> Mobile : </b> " + mobile + "<br/><br/>";

            Body += "<b> Contact Number : </b> " + contact + "<br/><br/>";

            Body += "<b> Email :  </b> " + email + "<br/><br/>";

            Body += "Don’t provide your credentials to anyone. Also don’t misuse your permissions<br/><br/>";

            Body += "For More Details Of Site. Please Login <a href=" + ConfigurationManager.AppSettings["siteurl4"] + " >here</a> <br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding account created");
            values.Add("body_html", Body);
            values.Add("to", email);
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

        private void SendMail1(string a, string uname, string fname, string pwd, string dis, string cont, string mobile, string contact, string email)
        {
            string Body = " <br/><br/> Dear Admin,<br/><br/>Greetings from Indus!! <br/><br/>";

            Body += "<b>Recently You are created " + fname + " as a " + dis + "<br/><br/>";

            Body += "<b>Your Mail :</b> " + email + "<br/><br/>";

            Body += "<b> Country :</b> " + cont + "<br/><br/>";

            Body += "<b> User Type :</b> " + dis + "<br/><br/>";

            Body += "<b> uname : </b> " + uname + "<br/><br/>";

            Body += "<b> Password :</b> " + pwd + "<br/><br/>";

            Body += "<b> Mobile : </b> " + mobile + "<br/><br/>";

            Body += "<b> Contact Number : </b> " + contact + "<br/><br/>";

            Body += "<b> Email :  </b> " + email + "<br/><br/>";

            Body += "For More Details Of Site. Please Login <a href=" + ConfigurationManager.AppSettings["siteurl4"] + " >here</a> <br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding account created");
            values.Add("body_html", Body);
            values.Add("to", a);
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

        public void clear()
        {
            txtLName.Text = "";
            txtFName.Text = "";
            txtPwd.Text = "";
            ddlUserType.SelectedIndex = -1;
            ddlCountry.SelectedIndex = -1;
            txtAddress.Text = "";
            txtMobile.Text = "";
            txtConNumber.Text = "";
            txtEmailId.Text = "";
            clients();
            contact();
            feed();
            Postad();
            users();
            support();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            createuser1.Visible = false;
            gvdisplay.Visible = true;
            clear();
        }

        public void clients()
        {
            t1.Visible = false;
            t2.Visible = false;
            t3.Visible = false;
            t4.Visible = false;
            t5.Visible = false;
            t6.Visible = false;
            rdclientsno.Checked = true;
            chkselectall.Checked = false;
            chkview.Checked = false;
            chkedit.Checked = false;
            chkstatus.Checked = false;
            chkdelete.Checked = false;
            chkcreate.Checked = false;
        }

        public void Postad()
        {
            t7.Visible = false;
            t8.Visible = false;
            t9.Visible = false;
            t10.Visible = false;
            t11.Visible = false;
            rdadsno.Checked = true;

            CheckBox1.Checked = false;
            CheckBox2.Checked = false;
            CheckBox3.Checked = false;
            CheckBox4.Checked = false;
            CheckBox5.Checked = false;
        }

        public void contact()
        {
            t12.Visible = false;
            t13.Visible = false;
            t14.Visible = false;
            t15.Visible = false;
            rdusno.Checked = true;

            CheckBox6.Checked = false;
            CheckBox7.Checked = false;
            CheckBox8.Checked = false;
            CheckBox9.Checked = false;
        }

        public void feed()
        {
            t16.Visible = false;
            t17.Visible = false;
            t18.Visible = false;
            t19.Visible = false;
            rdfeedno.Checked = true;

            CheckBox10.Checked = false;
            CheckBox11.Checked = false;
            CheckBox12.Checked = false;
            CheckBox13.Checked = false;
        }

        public void support()
        {
            t20.Visible = false;
            t21.Visible = false;
            t22.Visible = false;
            t23.Visible = false;
            rdsupportno.Checked = true;

            CheckBox14.Checked = false;
            CheckBox15.Checked = false;
            CheckBox16.Checked = false;
            CheckBox17.Checked = false;
        }

        public void users()
        {
            t24.Visible = false;
            t25.Visible = false;
            t26.Visible = false;
            t27.Visible = false;
            t28.Visible = false;
            t29.Visible = false;
            rdusersno.Checked = true;

            CheckBox18.Checked = false;
            CheckBox19.Checked = false;
            CheckBox20.Checked = false;
            CheckBox21.Checked = false;
            CheckBox22.Checked = false;
            CheckBox23.Checked = false;
        }

        protected void rdclientsyes_CheckedChanged(object sender, EventArgs e)
        {
            t1.Visible = true;
            t2.Visible = true;
            t3.Visible = true;
            t4.Visible = true;
            t5.Visible = true;
            t6.Visible = true;
        }

        protected void rdclientsno_CheckedChanged(object sender, EventArgs e)
        {
            clients();
        }

        protected void rdadsyes_CheckedChanged(object sender, EventArgs e)
        {
            t7.Visible = true;
            t8.Visible = true;
            t9.Visible = true;
            t10.Visible = true;
            t11.Visible = true;
        }

        protected void rdadsno_CheckedChanged(object sender, EventArgs e)
        {
            Postad();
        }

        protected void rdusyes_CheckedChanged(object sender, EventArgs e)
        {
            t12.Visible = true;
            t13.Visible = true;
            t14.Visible = true;
            t15.Visible = true;
        }

        protected void rdusno_CheckedChanged(object sender, EventArgs e)
        {
            contact();
        }

        protected void rdfeedyes_CheckedChanged(object sender, EventArgs e)
        {
            t16.Visible = true;
            t17.Visible = true;
            t18.Visible = true;
            t19.Visible = true;
        }

        protected void rdfeedno_CheckedChanged(object sender, EventArgs e)
        {
            feed();
        }

        protected void rdsupportyes_CheckedChanged(object sender, EventArgs e)
        {
            t20.Visible = true;
            t21.Visible = true;
            t22.Visible = true;
            t23.Visible = true;
        }

        protected void rdsupportno_CheckedChanged(object sender, EventArgs e)
        {
            support();
        }

        protected void rdusersyes_CheckedChanged(object sender, EventArgs e)
        {
            t24.Visible = true;
            t25.Visible = true;
            t26.Visible = true;
            t27.Visible = true;
            t28.Visible = true;
            t29.Visible = true;
        }

        protected void rdusersno_CheckedChanged(object sender, EventArgs e)
        {
            users();
        }

        protected void chkselectall_CheckedChanged(object sender, EventArgs e)
        {
            if (chkselectall.Checked == true)
            {
                chkview.Checked = true;
                chkedit.Checked = true;
                chkstatus.Checked = true;
                chkdelete.Checked = true;
                chkcreate.Checked = true;
            }
            else
            {
                chkview.Checked = false;
                chkedit.Checked = false;
                chkstatus.Checked = false;
                chkdelete.Checked = false;
                chkcreate.Checked = false;
            }
        }

        protected void chkview_CheckedChanged(object sender, EventArgs e)
        {
            if (chkview.Checked == false)
            {
                chkselectall.Checked = false;

            }
            else if (chkview.Checked == true && chkedit.Checked == true && chkstatus.Checked == true && chkdelete.Checked == true && chkcreate.Checked == true)
            {
                chkselectall.Checked = true;
            }
        }

        protected void chkedit_CheckedChanged(object sender, EventArgs e)
        {
            if (chkedit.Checked == false)
            {
                chkselectall.Checked = false;

            }
            else if (chkview.Checked == true && chkedit.Checked == true && chkstatus.Checked == true && chkdelete.Checked == true && chkcreate.Checked == true)
            {
                chkselectall.Checked = true;
            }
        }

        protected void chkstatus_CheckedChanged(object sender, EventArgs e)
        {
            if (chkstatus.Checked == false)
            {
                chkselectall.Checked = false;

            }
            else if (chkview.Checked == true && chkedit.Checked == true && chkstatus.Checked == true && chkdelete.Checked == true && chkcreate.Checked == true)
            {
                chkselectall.Checked = true;
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            if (chkdelete.Checked == false)
            {
                chkselectall.Checked = false;

            }
            else if (chkview.Checked == true && chkedit.Checked == true && chkstatus.Checked == true && chkdelete.Checked == true && chkcreate.Checked == true)
            {
                chkselectall.Checked = true;
            }
        }

        protected void chkcreate_CheckedChanged(object sender, EventArgs e)
        {
            if (chkcreate.Checked == false)
            {
                chkselectall.Checked = false;

            }
            else if (chkview.Checked == true && chkedit.Checked == true && chkstatus.Checked == true && chkdelete.Checked == true && chkcreate.Checked == true)
            {
                chkselectall.Checked = true;
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                CheckBox2.Checked = true;
                CheckBox3.Checked = true;
                CheckBox4.Checked = true;
                CheckBox5.Checked = true;
            }
            else
            {
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked == false)
            {
                CheckBox1.Checked = false;

            }
            else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
            {
                CheckBox1.Checked = true;
            }
        }

        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox3.Checked == false)
            {
                CheckBox1.Checked = false;

            }
            else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
            {
                CheckBox1.Checked = true;
            }
        }

        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox4.Checked == false)
            {
                CheckBox1.Checked = false;

            }
            else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
            {
                CheckBox1.Checked = true;
            }
        }

        protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox5.Checked == false)
            {
                CheckBox1.Checked = false;

            }
            else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
            {
                CheckBox1.Checked = true;
            }
        }

        protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox6.Checked == true)
            {
                CheckBox7.Checked = true;
                CheckBox8.Checked = true;
                CheckBox9.Checked = true;
            }
            else
            {
                CheckBox7.Checked = false;
                CheckBox8.Checked = false;
                CheckBox9.Checked = false;
            }
        }

        protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox7.Checked == false)
            {
                CheckBox6.Checked = false;
            }
            else if (CheckBox7.Checked == true && CheckBox8.Checked == true && CheckBox9.Checked == true)
            {
                CheckBox6.Checked = true;
            }
        }

        protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox8.Checked == false)
            {
                CheckBox6.Checked = false;
            }
            else if (CheckBox7.Checked == true && CheckBox8.Checked == true && CheckBox9.Checked == true)
            {
                CheckBox6.Checked = true;
            }
        }

        protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox9.Checked == false)
            {
                CheckBox6.Checked = false;
            }
            else if (CheckBox7.Checked == true && CheckBox8.Checked == true && CheckBox9.Checked == true)
            {
                CheckBox6.Checked = true;
            }
        }

        protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox10.Checked == true)
            {
                CheckBox11.Checked = true;
                CheckBox12.Checked = true;
                CheckBox13.Checked = true;
            }
            else
            {
                CheckBox11.Checked = false;
                CheckBox12.Checked = false;
                CheckBox13.Checked = false;
            }
        }

        protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox11.Checked == false)
            {
                CheckBox10.Checked = false;
            }
            else if (CheckBox11.Checked == true && CheckBox12.Checked == true && CheckBox13.Checked == true)
            {
                CheckBox10.Checked = true;
            }
        }

        protected void CheckBox12_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox12.Checked == false)
            {
                CheckBox10.Checked = false;
            }
            else if (CheckBox11.Checked == true && CheckBox12.Checked == true && CheckBox13.Checked == true)
            {
                CheckBox10.Checked = true;
            }
        }

        protected void CheckBox13_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox13.Checked == false)
            {
                CheckBox10.Checked = false;
            }
            else if (CheckBox11.Checked == true && CheckBox12.Checked == true && CheckBox13.Checked == true)
            {
                CheckBox10.Checked = true;
            }
        }

        protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox14.Checked == true)
            {
                CheckBox15.Checked = true;
                CheckBox16.Checked = true;
                CheckBox17.Checked = true;
            }
            else
            {
                CheckBox15.Checked = false;
                CheckBox16.Checked = false;
                CheckBox17.Checked = false;
            }
        }

        protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox15.Checked == false)
            {
                CheckBox14.Checked = false;
            }
            else if (CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
            {
                CheckBox14.Checked = true;
            }
        }

        protected void CheckBox16_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox16.Checked == false)
            {
                CheckBox14.Checked = false;
            }
            else if (CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
            {
                CheckBox14.Checked = true;
            }
        }

        protected void CheckBox17_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox17.Checked == false)
            {
                CheckBox14.Checked = false;
            }
            else if (CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
            {
                CheckBox14.Checked = true;
            }
        }

        protected void CheckBox18_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox18.Checked == true)
            {
                CheckBox19.Checked = true;
                CheckBox20.Checked = true;
                CheckBox21.Checked = true;
                CheckBox22.Checked = true;
                CheckBox23.Checked = true;
            }
            else
            {
                CheckBox19.Checked = false;
                CheckBox20.Checked = false;
                CheckBox21.Checked = false;
                CheckBox22.Checked = false;
                CheckBox23.Checked = false;
            }
        }

        protected void CheckBox19_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox19.Checked == false)
            {
                CheckBox18.Checked = false;
            }
            else if (CheckBox19.Checked == true && CheckBox20.Checked == true && CheckBox21.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
            {
                CheckBox18.Checked = true;
            }
        }

        protected void CheckBox20_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox20.Checked == false)
            {
                CheckBox18.Checked = false;
            }
            else if (CheckBox19.Checked == true && CheckBox20.Checked == true && CheckBox21.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
            {
                CheckBox18.Checked = true;
            }
        }

        protected void CheckBox21_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox21.Checked == false)
            {
                CheckBox18.Checked = false;
            }
            else if (CheckBox19.Checked == true && CheckBox20.Checked == true && CheckBox21.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
            {
                CheckBox18.Checked = true;
            }
        }

        protected void CheckBox22_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox22.Checked == false)
            {
                CheckBox18.Checked = false;
            }
            else if (CheckBox19.Checked == true && CheckBox20.Checked == true && CheckBox21.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
            {
                CheckBox18.Checked = true;
            }
        }

        protected void CheckBox23_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox23.Checked == false)
            {
                CheckBox18.Checked = false;
            }
            else if (CheckBox19.Checked == true && CheckBox20.Checked == true && CheckBox21.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
            {
                CheckBox18.Checked = true;
            }
        }

        protected void txtLName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string x = txtLName.Text;
                ds = bl.finduser(x);

                if (ds.Tables[0].Rows[0]["count"].ToString() == "0")
                {
                    lblmsg.Text = "User Name avialable";
                }
                else
                {
                    lblmsg.Text = "User Name already Registered";
                }
                lblmsg.Visible = true;
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(Session["listid"]);
                string a = txtedfname.Text;
                string b = txtedlname.Text;
                string c = ddleddesgn.SelectedItem.Text;
                string d = ddledcountry.SelectedItem.Text;
                string e1 = txtedaddress.Text;
                string f = txtedmob.Text;
                string g = txtedcontact.Text;
                string h = txtedmail.Text;

                string clientview1 = "";
                string clientupdate1 = "";
                string clientstatus1 = "";
                string clientdelete1 = "";
                string clientcreate1 = "";

                string adview1 = "";
                string adstatus1 = "";
                string addelete1 = "";
                string adcreate1 = "";

                string usview1 = "";
                string usemail1 = "";
                string usdelete1 = "";

                string feedview1 = "";
                string feedmail1 = "";
                string feeddelete1 = "";

                string supportview1 = "";
                string supportsolution1 = "";
                string supportdelete1 = "";

                string userview1 = "";
                string userupdate1 = "";
                string userstatus1 = "";
                string userdelete1 = "";
                string usercreate1 = "";



                string date = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");


                if (CheckBox25.Checked == true) { clientview1 = "1"; } else { clientview1 = "0"; }
                if (CheckBox26.Checked == true) { clientupdate1 = "1"; } else { clientupdate1 = "0"; }
                if (CheckBox27.Checked == true) { clientstatus1 = "1"; } else { clientstatus1 = "0"; }
                if (CheckBox28.Checked == true) { clientdelete1 = "1"; } else { clientdelete1 = "0"; }
                if (CheckBox29.Checked == true) { clientcreate1 = "1"; } else { clientcreate1 = "0"; }

                if (CheckBox31.Checked == true) { adview1 = "1"; } else { adview1 = "0"; }
                if (CheckBox32.Checked == true) { adstatus1 = "1"; } else { adstatus1 = "0"; }
                if (CheckBox33.Checked == true) { addelete1 = "1"; } else { addelete1 = "0"; }
                if (CheckBox34.Checked == true) { adcreate1 = "1"; } else { adcreate1 = "0"; }

                if (CheckBox36.Checked == true) { usview1 = "1"; } else { usview1 = "0"; }
                if (CheckBox37.Checked == true) { usemail1 = "1"; } else { usemail1 = "0"; }
                if (CheckBox38.Checked == true) { usdelete1 = "1"; } else { usdelete1 = "0"; }

                if (CheckBox40.Checked == true) { feedview1 = "1"; } else { feedview1 = "0"; }
                if (CheckBox41.Checked == true) { feedmail1 = "1"; } else { feedmail1 = "0"; }
                if (CheckBox42.Checked == true) { feeddelete1 = "1"; } else { feeddelete1 = "0"; }

                if (CheckBox44.Checked == true) { supportview1 = "1"; } else { supportview1 = "0"; }
                if (CheckBox45.Checked == true) { supportsolution1 = "1"; } else { supportsolution1 = "0"; }
                if (CheckBox46.Checked == true) { supportdelete1 = "1"; } else { supportdelete1 = "0"; }

                if (CheckBox48.Checked == true) { userview1 = "1"; } else { userview1 = "0"; }
                if (CheckBox49.Checked == true) { userupdate1 = "1"; } else { userupdate1 = "0"; }
                if (CheckBox50.Checked == true) { userstatus1 = "1"; } else { userstatus1 = "0"; }
                if (CheckBox51.Checked == true) { userdelete1 = "1"; } else { userdelete1 = "0"; }
                if (CheckBox52.Checked == true) { usercreate1 = "1"; } else { usercreate1 = "0"; }

                int s = bl.updateuser(id, a, b, c, d, e1, f, g, h, clientview1, clientupdate1, clientstatus1, clientdelete1, clientcreate1, adview1, adstatus1, addelete1, adcreate1, usview1, usemail1, usdelete1, feedview1, feedmail1, feeddelete1, supportview1, supportsolution1, supportdelete1, userview1, userupdate1, userstatus1, userdelete1, usercreate1);

                if (s != 0)
                {
                    string strScript = "alert('User is Updated Sucessfully');location.replace('Users.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    clear();
                }
                else
                {
                    string strScript = "alert('Error Occured ! Try again');location.replace('Users.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        public void clients1()
        {
            Tr1.Visible = false;
            Tr2.Visible = false;
            Tr3.Visible = false;
            Tr4.Visible = false;
            Tr5.Visible = false;
            Tr6.Visible = false;

            RadioButton2.Checked = true;

            CheckBox24.Checked = false;
            CheckBox25.Checked = false;
            CheckBox26.Checked = false;
            CheckBox27.Checked = false;
            CheckBox28.Checked = false;
            CheckBox29.Checked = false;

        }

        public void Postad1()
        {
            Tr7.Visible = false;
            Tr8.Visible = false;
            Tr9.Visible = false;
            Tr10.Visible = false;
            Tr11.Visible = false;

            RadioButton4.Checked = true;

            CheckBox30.Checked = false;
            CheckBox31.Checked = false;
            CheckBox32.Checked = false;
            CheckBox33.Checked = false;
            CheckBox34.Checked = false;
        }

        public void contact1()
        {
            Tr12.Visible = false;
            Tr13.Visible = false;
            Tr14.Visible = false;
            Tr15.Visible = false;

            RadioButton6.Checked = true;

            CheckBox35.Checked = false;
            CheckBox36.Checked = false;
            CheckBox37.Checked = false;
            CheckBox38.Checked = false;
        }

        public void feed1()
        {
            Tr16.Visible = false;
            Tr17.Visible = false;
            Tr18.Visible = false;
            Tr19.Visible = false;

            RadioButton8.Checked = true;

            CheckBox39.Checked = false;
            CheckBox40.Checked = false;
            CheckBox41.Checked = false;
            CheckBox42.Checked = false;
        }

        public void support1()
        {
            Tr20.Visible = false;
            Tr21.Visible = false;
            Tr22.Visible = false;
            Tr23.Visible = false;

            RadioButton10.Checked = true;

            CheckBox43.Checked = false;
            CheckBox44.Checked = false;
            CheckBox45.Checked = false;
            CheckBox46.Checked = false;
        }

        public void users1()
        {
            Tr24.Visible = false;
            Tr25.Visible = false;
            Tr26.Visible = false;
            Tr27.Visible = false;
            Tr28.Visible = false;
            Tr29.Visible = false;

            RadioButton12.Checked = true;

            CheckBox47.Checked = false;
            CheckBox48.Checked = false;
            CheckBox49.Checked = false;
            CheckBox50.Checked = false;
            CheckBox51.Checked = false;
            CheckBox52.Checked = false;
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Tr1.Visible = true;
            Tr2.Visible = true;
            Tr3.Visible = true;
            Tr4.Visible = true;
            Tr5.Visible = true;
            Tr6.Visible = true;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            clients1();

        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            Tr7.Visible = true;
            Tr8.Visible = true;
            Tr9.Visible = true;
            Tr10.Visible = true;
            Tr11.Visible = true;
        }

        protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
        {
            Postad1();
        }

        protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
        {
            Tr12.Visible = true;
            Tr13.Visible = true;
            Tr14.Visible = true;
            Tr15.Visible = true;
        }

        protected void RadioButton6_CheckedChanged(object sender, EventArgs e)
        {
            contact1();
        }

        protected void RadioButton7_CheckedChanged(object sender, EventArgs e)
        {
            Tr16.Visible = true;
            Tr17.Visible = true;
            Tr18.Visible = true;
            Tr19.Visible = true;
        }

        protected void RadioButton8_CheckedChanged(object sender, EventArgs e)
        {
            feed1();
        }

        protected void RadioButton9_CheckedChanged(object sender, EventArgs e)
        {
            Tr20.Visible = true;
            Tr21.Visible = true;
            Tr22.Visible = true;
            Tr23.Visible = true;
        }

        protected void RadioButton10_CheckedChanged(object sender, EventArgs e)
        {
            support1();
        }

        protected void RadioButton11_CheckedChanged(object sender, EventArgs e)
        {
            Tr24.Visible = true;
            Tr25.Visible = true;
            Tr26.Visible = true;
            Tr27.Visible = true;
            Tr28.Visible = true;
            Tr29.Visible = true;
        }

        protected void RadioButton12_CheckedChanged(object sender, EventArgs e)
        {
            users1();
        }

        protected void CheckBox24_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox24.Checked == true)
            {
                CheckBox25.Checked = true;
                CheckBox26.Checked = true;
                CheckBox27.Checked = true;
                CheckBox28.Checked = true;
                CheckBox29.Checked = true;
            }
            else
            {
                CheckBox25.Checked = false;
                CheckBox26.Checked = false;
                CheckBox27.Checked = false;
                CheckBox28.Checked = false;
                CheckBox29.Checked = false;
            }
        }

        protected void CheckBox25_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox25.Checked == false)
            {
                CheckBox24.Checked = false;
            }
            else if (CheckBox25.Checked == true && CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
            {
                CheckBox24.Checked = true;
            }
        }

        protected void CheckBox26_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox26.Checked == false)
            {
                CheckBox24.Checked = false;
            }
            else if (CheckBox25.Checked == true && CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
            {
                CheckBox24.Checked = true;
            }
        }

        protected void CheckBox27_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox27.Checked == false)
            {
                CheckBox24.Checked = false;
            }
            else if (CheckBox25.Checked == true && CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
            {
                CheckBox24.Checked = true;
            }
        }

        protected void CheckBox28_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox28.Checked == false)
            {
                CheckBox24.Checked = false;
            }
            else if (CheckBox25.Checked == true && CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
            {
                CheckBox24.Checked = true;
            }
        }

        protected void CheckBox29_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox29.Checked == false)
            {
                CheckBox24.Checked = false;
            }
            else if (CheckBox25.Checked == true && CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
            {
                CheckBox24.Checked = true;
            }
        }

        protected void CheckBox30_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox30.Checked == true)
            {
                CheckBox31.Checked = true;
                CheckBox32.Checked = true;
                CheckBox33.Checked = true;
                CheckBox34.Checked = true;
            }
            else
            {
                CheckBox31.Checked = false;
                CheckBox32.Checked = false;
                CheckBox33.Checked = false;
                CheckBox34.Checked = false;
            }
        }

        protected void CheckBox31_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox31.Checked == false)
            {
                CheckBox30.Checked = false;
            }
            else if (CheckBox31.Checked == true && CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true)
            {
                CheckBox30.Checked = true;
            }
        }

        protected void CheckBox32_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox32.Checked == false)
            {
                CheckBox30.Checked = false;
            }
            else if (CheckBox31.Checked == true && CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true)
            {
                CheckBox30.Checked = true;
            }
        }

        protected void CheckBox33_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox33.Checked == false)
            {
                CheckBox30.Checked = false;
            }
            else if (CheckBox31.Checked == true && CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true)
            {
                CheckBox30.Checked = true;
            }
        }

        protected void CheckBox34_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox34.Checked == false)
            {
                CheckBox30.Checked = false;
            }
            else if (CheckBox31.Checked == true && CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true)
            {
                CheckBox30.Checked = true;
            }
        }

        protected void CheckBox35_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox35.Checked == true)
            {
                CheckBox36.Checked = true;
                CheckBox37.Checked = true;
                CheckBox38.Checked = true;
            }
            else
            {
                CheckBox36.Checked = false;
                CheckBox37.Checked = false;
                CheckBox38.Checked = false;
            }
        }

        protected void CheckBox36_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox36.Checked == false)
            {
                CheckBox35.Checked = false;
            }
            else if (CheckBox36.Checked == true && CheckBox37.Checked == true && CheckBox38.Checked == true)
            {
                CheckBox35.Checked = true;
            }
        }

        protected void CheckBox37_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox37.Checked == false)
            {
                CheckBox35.Checked = false;
            }
            else if (CheckBox36.Checked == true && CheckBox37.Checked == true && CheckBox38.Checked == true)
            {
                CheckBox35.Checked = true;
            }
        }

        protected void CheckBox38_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox38.Checked == false)
            {
                CheckBox35.Checked = false;
            }
            else if (CheckBox36.Checked == true && CheckBox37.Checked == true && CheckBox38.Checked == true)
            {
                CheckBox35.Checked = true;
            }
        }

        protected void CheckBox39_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox39.Checked == true)
            {
                CheckBox40.Checked = true;
                CheckBox41.Checked = true;
                CheckBox42.Checked = true;
            }
            else
            {
                CheckBox40.Checked = false;
                CheckBox41.Checked = false;
                CheckBox42.Checked = false;
            }
        }

        protected void CheckBox40_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox40.Checked == false)
            {
                CheckBox39.Checked = false;
            }
            else if (CheckBox40.Checked == true && CheckBox41.Checked == true && CheckBox42.Checked == true)
            {
                CheckBox39.Checked = true;
            }
        }

        protected void CheckBox41_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox41.Checked == false)
            {
                CheckBox39.Checked = false;
            }
            else if (CheckBox40.Checked == true && CheckBox41.Checked == true && CheckBox42.Checked == true)
            {
                CheckBox39.Checked = true;
            }
        }

        protected void CheckBox42_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox42.Checked == false)
            {
                CheckBox39.Checked = false;
            }
            else if (CheckBox40.Checked == true && CheckBox41.Checked == true && CheckBox42.Checked == true)
            {
                CheckBox39.Checked = true;
            }
        }

        protected void CheckBox43_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox43.Checked == true)
            {
                CheckBox44.Checked = true;
                CheckBox45.Checked = true;
                CheckBox46.Checked = true;
            }
            else
            {
                CheckBox44.Checked = false;
                CheckBox45.Checked = false;
                CheckBox46.Checked = false;
            }
        }

        protected void CheckBox44_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox44.Checked == false)
            {
                CheckBox43.Checked = false;
            }
            else if (CheckBox44.Checked == true && CheckBox45.Checked == true && CheckBox46.Checked == true)
            {
                CheckBox43.Checked = true;
            }
        }

        protected void CheckBox45_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox45.Checked == false)
            {
                CheckBox43.Checked = false;
            }
            else if (CheckBox44.Checked == true && CheckBox45.Checked == true && CheckBox46.Checked == true)
            {
                CheckBox43.Checked = true;
            }
        }

        protected void CheckBox46_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox46.Checked == false)
            {
                CheckBox43.Checked = false;
            }
            else if (CheckBox44.Checked == true && CheckBox45.Checked == true && CheckBox46.Checked == true)
            {
                CheckBox43.Checked = true;
            }
        }

        protected void CheckBox47_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox47.Checked == true)
            {
                CheckBox48.Checked = true;
                CheckBox49.Checked = true;
                CheckBox50.Checked = true;
                CheckBox51.Checked = true;
                CheckBox52.Checked = true;
            }
            else
            {
                CheckBox48.Checked = false;
                CheckBox49.Checked = false;
                CheckBox50.Checked = false;
                CheckBox51.Checked = false;
                CheckBox52.Checked = false;
            }
        }

        protected void CheckBox48_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox48.Checked == false)
            {
                CheckBox47.Checked = false;
            }
            else if (CheckBox48.Checked == true && CheckBox49.Checked == true && CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox52.Checked == true)
            {
                CheckBox47.Checked = true;
            }
        }

        protected void CheckBox49_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox49.Checked == false)
            {
                CheckBox47.Checked = false;
            }
            else if (CheckBox48.Checked == true && CheckBox49.Checked == true && CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox52.Checked == true)
            {
                CheckBox47.Checked = true;
            }
        }

        protected void CheckBox50_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox50.Checked == false)
            {
                CheckBox47.Checked = false;
            }
            else if (CheckBox48.Checked == true && CheckBox49.Checked == true && CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox52.Checked == true)
            {
                CheckBox47.Checked = true;
            }
        }

        protected void CheckBox51_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox51.Checked == false)
            {
                CheckBox47.Checked = false;
            }
            else if (CheckBox48.Checked == true && CheckBox49.Checked == true && CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox52.Checked == true)
            {
                CheckBox47.Checked = true;
            }
        }

        protected void CheckBox52_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox52.Checked == false)
            {
                CheckBox47.Checked = false;
            }
            else if (CheckBox48.Checked == true && CheckBox49.Checked == true && CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox52.Checked == true)
            {
                CheckBox47.Checked = true;
            }
        }
    }
}