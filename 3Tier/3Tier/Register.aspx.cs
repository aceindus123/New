using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace _3Tier
{
    public partial class Register : System.Web.UI.Page
    {
        dal dl = new dal();
        bll bl = new bll();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        static string excep_page = "Register.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Create_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ds = bl.registercount(txtemail.Text);

                if (ds.Tables[0].Rows[0]["count"].ToString() == "0")
                {
                    int sta = 0;
                    string name = txtname.Text;
                    string lname = txtlname.Text;
                    string email = txtemail.Text;
                    string pwd = txtpwd.Text;
                    string mobile = txtphone.Text;
                    string add = txtaddress.Text;
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

                        string strScript = "alert('Registration completed Successfully. Please Activate your Account From Mail');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                    clear();
                }
                else
                {
                    string strScript = "alert('Entered Email is Already Registered');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
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
            string Status = "1";

            string Body = " <br/><br/>Dear  " + Namestr + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "Recently, you have successfully entered your details on our site<br/><br/>";

            Body += "<b>Your Email Id : </b> " + Emailstr + "<br/><br/>";

            Body += "<b>Password : </b> " + Passwordstr + "<br/><br/>";


            Body += "<a href=" + ConfigurationManager.AppSettings["siteurl"] + "Activate.aspx?uid=" + uid + "&Status=" + Status + " >Confirm your Email address to active your account</a><br/><br/><br/>";
            Body += "Login <a href=" + ConfigurationManager.AppSettings["siteurl1"] + "Login >here</a> ";

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
            txtname.Text = "";
            txtlname.Text = "";
            txtemail.Text = "";
            txtpwd.Text = "";
            txtphone.Text = "";
            txtcpwd.Text = "";
            txtaddress.Text = "";
        }

        protected void btncancel_Click(object sender, ImageClickEventArgs e)
        {
            clear();
        }

        protected void imgsearch_Click(object sender, ImageClickEventArgs e)
        {
            if ((txtsearch.Text != "") && (txtloc.Text != ""))
            {
                string s = txtsearch.Text;
                string s1 = txtloc.Text;
                Response.Redirect("allads.aspx?serchid2=" + s + "&state1=" + s1);
            }

            if (txtsearch.Text != "")
            {
                string s = txtsearch.Text;
                Response.Redirect("allads.aspx?serchid1=" + s);
            }

            if (txtloc.Text != "")
            {
                string s = txtloc.Text;
                Response.Redirect("Allads.aspx?state=" + s);
            }

            else
            {
                Response.Redirect("Default.aspx");
                txtsearch.Text = "";
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchCustomers(string prefixText)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.AppSettings["ConnectionString"].ToString();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select statename from state where statename like @SearchText+'%'  and countryid=2";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> customers = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(sdr["statename"].ToString());
                        }
                    }
                    conn.Close();
                    return customers;
                }
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetCompletionList1(string prefixText)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select Item_cat from main_cat where item_cat like @City+'%'", con);
            cmd.Parameters.AddWithValue("@City", prefixText);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            con.Close();

            List<string> CityNames = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CityNames.Add(dt.Rows[i][0].ToString());
            }
            return CityNames;
        }

        protected void txtloc_TextChanged(object sender, EventArgs e)
        {
            if (txtloc.Text != "")
            {
                try
                {
                    string s = txtloc.Text;
                    ds = bl.getdata(s);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        pnlAtoZ.Visible = true;
                        model.Show();
                    }
                    else
                    {
                        pnlAtoZ.Visible = false;
                        model.Hide();
                        //string script = "alert('Please Select State name from below list')";
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
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
                pnlAtoZ.Visible = false;
                model.Hide();
            }
        }

        protected void selectcity(object sender, CommandEventArgs e)
        {
            try
            {
                string a = e.CommandArgument.ToString();
                Response.Redirect("Allads.aspx?city1=" + a);
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void get_city(object sender, CommandEventArgs e)
        {
            try
            {
                string pre = e.CommandArgument.ToString();
                string s = txtloc.Text;
                DataSet i = bl.bind(s);
                int id = Convert.ToInt32(i.Tables[0].Rows[0]["stateid"].ToString());
                DataSet dscities = bl.bindcities(pre, id);

                if (dscities.Tables[0].Rows.Count > 0)
                {
                    dl_bindcities.DataSource = dscities;
                    dl_bindcities.DataBind();
                    LinkButton1.Visible = false;
                }
                else
                {
                    LinkButton1.Visible = true;
                }

                pnlAtoZ.Visible = true;
                model.Show();
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }
}