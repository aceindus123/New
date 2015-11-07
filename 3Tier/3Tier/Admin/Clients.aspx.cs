using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Collections.Specialized;

namespace _3Tier.Admin
{
    public partial class Clients : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();

        bll bl = new bll();
        dal dl = new dal();
        static string excep_page = "Clients.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                if (!IsPostBack)
                {
                    users();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void users()
        {
            try
            {
                ds = bl.users();
                gvusers.DataSource = ds;
                gvusers.DataBind();
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            try
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["createclient"].ToString() == "1")
                    {
                        View1.Visible = false;
                        createuser.Visible = true;
                        btn1.Visible = false;
                        View.Visible = false;
                        CreateClient.Visible = true;
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

        protected void ListName(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["updateclient"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        ds = bl.findclient(listid);

                        txtedfname.Text = ds.Tables[0].Rows[0]["name"].ToString();
                        txtedlname.Text = ds.Tables[0].Rows[0]["lname"].ToString();
                        txtedmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                        txtedmob.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                        txtedcontact.Text = ds.Tables[0].Rows[0]["pwd"].ToString();
                        txtedaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                        pnledit.Visible = true;
                        model1.Show();
                    }
                    catch (Exception ex)
                    {
                        bl.insert_exception(ex, excep_page);
                        Response.Redirect("~/ErrorPage.aspx");

                    }
                }
                else
                {
                    model1.Hide();
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
                if (ds2.Tables[0].Rows[0]["statausclient"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.statusclient(listid);

                        if (i != 0)
                        {
                            ds = bl.findclient(listid);
                            string a = ds.Tables[0].Rows[0]["name"].ToString();
                            string b = ds.Tables[0].Rows[0]["email"].ToString();
                            if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
                            {
                        
                                string strScript = "alert('Client Status Modified');location.replace('Clients.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            }
                            else
                            {
                                sendEmail3(a, b);
                                 string strScript = "alert('Client Status Modified');location.replace('Clients.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            
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

                        ds = bl.findclient(listid);

                        string a = ds.Tables[0].Rows[0]["name"].ToString();
                        string b = ds.Tables[0].Rows[0]["email"].ToString();

                        int i = bl.deleteclient(listid);

                        if (i != 0)
                        {

                            sendEmail1(a, b);

                            string strScript = "alert('Client Deleted');location.replace('Clients.aspx');";
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

        private void sendEmail1(string Namestr, string Emailstr)
        {
            string Body = " <br/><br/>Dear  " + Namestr + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "<b>Your Email Id : </b> " + Emailstr + "<br/><br/>";

            Body += "We have found that you have provided us with incorrect details,<br>";

            Body+="That is the reason we have deleted your account from our records. Provide correct details and go through our INDUS  benefits.<br/><br/>";

            Body += "Register <a href=" + ConfigurationManager.AppSettings["siteurl3"] + " >here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Provided incorrect details");
            values.Add("body_html", Body);
            values.Add("to", Emailstr);
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

        private void sendEmail2(string Namestr, string Emailstr)
        {
            string Body = " <br/><br/>Dear  " + Namestr + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "<b>Your Email Id : </b> " + Emailstr + "<br/><br/>";

            Body += "You have successfully registered on our site. Feel free to use our site.<br>";

            Body += "Register <a href=" + ConfigurationManager.AppSettings["siteurl3"] + " >here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Provided incorrect details");
            values.Add("body_html", Body);
            values.Add("to", Emailstr);
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

        private void sendEmail3(string Namestr, string Emailstr)
        {
            string Body = " <br/><br/>Dear  " + Namestr + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "<b>Your Email Id : </b> " + Emailstr + "<br/><br/>";

            Body += "Our admin has Stoped your account due  to unotherised the site .<br>";


            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Due to unotherised Access");
            values.Add("body_html", Body);
            values.Add("to", Emailstr);
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


        protected void Create_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ds = bl.registercount(utxtemail.Text);

                if (ds.Tables[0].Rows[0]["count"].ToString() == "0")
                {
                    int sta = 1;
                    string name = utxtfname.Text;
                    string lname = utxtlname.Text;
                    string email = utxtemail.Text;
                    string pwd = utxtpwd.Text;
                    string mobile = utxtmobile.Text;
                    string add = utxtadd.Text;
                    string date = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
                    string sys_ipaddress = GetIP();

                    string sql = "insert into Register(name,lname,email,mobile,pwd,address,status,PostedDate,ipaddress) values(@name,@lname,@email,@mobile,@pwd,@add,@sta,@date,@sys_ipaddress)";
                    SqlCommand cmd = new SqlCommand(sql);
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                    cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = lname;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                    cmd.Parameters.Add("@mobile", SqlDbType.VarChar).Value = mobile;
                    cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = pwd;
                    cmd.Parameters.Add("@add", SqlDbType.VarChar).Value = add;
                    cmd.Parameters.Add("@sta", SqlDbType.VarChar).Value = sta;
                    cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
                    cmd.Parameters.Add("@sys_ipaddress", SqlDbType.VarChar).Value = sys_ipaddress;
                    int i = bl.Insertregister(cmd);

                    if (i != 0)
                    {

                        ds2 = bl.updateregister(email);
                        int uid = Convert.ToInt32(ds2.Tables[0].Rows[0]["rid"].ToString());
                        string Namestr = name + " " + lname;
                        sendEmail(Namestr, email, pwd, uid);

                        string strScript = "alert('Registration completed Successfully.');location.replace('Clients.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                    clear();
                }
                else
                {
                    string strScript = "alert('Entered Email is Already Registered');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                clear();
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected string GetIP()
        {
            try
            {
                string Sinfo;
                HttpRequest currentRequest = HttpContext.Current.Request;
                Sinfo = currentRequest.ServerVariables["HTTP_X_FORWARDED_FOR"];

                if (Sinfo == null || Sinfo.ToLower() == "unknown")
                {
                    Sinfo = currentRequest.ServerVariables["REMOTE_ADDR"];
                    Sinfo += "/" + currentRequest.ServerVariables["LOGON_USER"];
                }
                string[] computerinfo = Sinfo.Split('/');

                return computerinfo[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void sendEmail(string Namestr, string Emailstr, string Passwordstr, int uid)
        {
            string Body = " <br/><br/>Dear  " + Namestr + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "You have successfully registered on our site. Feel free to use our site.<br/><br/>";


            Body += "<b>Your Email Id : </b> " + Emailstr + "<br/><br/>";

            Body += "<b>Password : </b> " + Passwordstr + "<br/><br/>";

            Body += "Login <a href=" + ConfigurationManager.AppSettings["siteurl1"] + " >here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding registering your details  - Email verfification");
            values.Add("body_html", Body);
            values.Add("to", Emailstr);
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
            utxtfname.Text = "";
            utxtlname.Text = "";
            utxtemail.Text = "";
            utxtmobile.Text = "";
            utxtpwd.Text = "";
            utxtadd.Text = "";
        }

        protected void btncancel_Click(object sender, ImageClickEventArgs e)
        {
            clear();
            Response.Redirect("clients.aspx");
        }

        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvusers.PageIndex = e.NewPageIndex;
            gvusers.DataBind();
            users();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(Session["listid1"]);

                string a = txtedfname.Text;
                string b = txtedlname.Text;
                string c = txtedmail.Text;
                string d = txtedmob.Text;
                string e1 = txtedcontact.Text;
                string f = txtedaddress.Text;


                string sql = "update Register set name=@name,lname=@lname,email=@email,mobile=@mobile,pwd=@pwd,address=@add where rid=@id";
                SqlCommand cmd = new SqlCommand(sql);
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = a;
                cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = b;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = c;
                cmd.Parameters.Add("@mobile", SqlDbType.VarChar).Value = d;
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = e1;
                cmd.Parameters.Add("@add", SqlDbType.VarChar).Value = f;
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                int i = bl.updateclient(cmd);
                if (i != 0)
                {
                    string strScript = "alert('Client Updated Successfully');location.replace('Clients.aspx');";
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
    }
}