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
using System.Data.SqlClient;

namespace _3Tier
{
    public partial class Profile : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        int catid;
        static string excep_page = "Profile.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Label2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void Signin_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string a = txtuser.Text;
                string b = txtpwd.Text;

                ds = bl.profile(a, b);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["USER"] = ds.Tables[0].Rows[0]["name"].ToString();
                    Session["EMAIL"] = a;
                    Response.Redirect("History.aspx");
                }
                else
                {
                    string strScript = "alert('Entered Credentials are Wrong');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }

        }

        protected void HyperLink1_Click(object sender, EventArgs e)
        {
            model.Show();
            pnlAtoZ.Visible = true;
           // line.Visible = true;
        }

        protected void btnfpwd_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ds = bl.registercount(Emailid.Text);

                if (ds.Tables[0].Rows[0]["count"].ToString() == "1")
                {
                    ds = bl.updateregister(Emailid.Text);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string Namestr = ds.Tables[0].Rows[0]["name"].ToString();
                        string email = ds.Tables[0].Rows[0]["email"].ToString();
                        string pwd = ds.Tables[0].Rows[0]["pwd"].ToString();
                        sendEmail(Namestr, email, pwd);

                        string strScript = "alert('Password Sent to Your Email');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        model.Hide();
                        pnlAtoZ.Visible = false;
                        Emailid.Text = "";
                        //Label3.Text = "Entered Email is Not Registered";
                        //Label3.Visible = true;
                    }
                }



                else
                {
                    Emailid.Text = "";
                    //Label3.Text = "Entered Email is Not Registered";
                    //Label3.Visible = true;
                    string strScript = "alert('Entered Email is Not Registered');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    pnlAtoZ.Visible = true;
                    model.Show();
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        private void sendEmail(string Namestr, string Emailstr, string Passwordstr)
        {
            string Body = " Hi   " + Namestr + ",<br/>Welcome to Indus <br/><br/>";
            Body += "<b>Your Email :</b> " + Emailstr + "<br/>";
            Body += "<b>Password :</b> " + Passwordstr + "<br/><br/><br/>";

            Body += "Login <a href=" + ConfigurationManager.AppSettings["siteurl1"] + ">here</a> ";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Welcome to Indus  - Password Information");
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

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script type='text/javascript'> window.open('http://www.indusnexus.com/','_blank',false); </script>");
        }

        protected void ImageButton26_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script type='text/javascript'> window.open('http://indusemail.com/','_blank',false); </script>");
        }

        protected void ImageButton18_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script type='text/javascript'> window.open('http://www.justcalluz.com/','_blank',false); </script>");
        }

        protected void ImageButton19_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script type='text/javascript'> window.open('http://www.industraining.net/','_blank',false); </script>");
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
                catch(Exception ex)
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
