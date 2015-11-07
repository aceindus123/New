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
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;


namespace _3Tier
{
    public partial class History : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        static string excep_page = "History.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["EMAIL"] != null)
                    {
                        string x = Session["EMAIL"].ToString();
                        ds = bl.history(x);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            grid.DataSource = ds;
                            grid.DataBind();
                        }
                        else
                        {
                            grid.Visible = false;
                            nimageo.Visible = true;
                        }
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
        }

        protected void dlReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (Session["EMAIL"] != null)
            {
                try
                {
                    string x = Session["EMAIL"].ToString();
                    grid.PageIndex = e.NewPageIndex;
                    ds = bl.history(x);
                    grid.DataSource = ds;
                    grid.DataBind();
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void change_click(object sender, EventArgs e)
        {
            pwd.Visible = true;
            gv.Visible = false;
        }

        protected void histor_Click(object sender, EventArgs e)
        {
            pwd.Visible = false;
            gv.Visible = true;
        }

        private void sendEmail(string mail, string old, string ne, string date)
        {
            string Body = " <br/><br/>Dear User,<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "Recently, you have changed your account password <br/><br/>";

            Body += "<b>Your Email Id : </b> " + mail + "<br/><br/>";

            Body += "<b>Previous Password : </b> " + old + "<br/><br/>";

            Body += "<b>Changed Password :</b> " + ne + "<br/><br/>";

            Body += "<b>Changed Date & Time  :</b> " + date + "<br/><br/>";

            Body += "If you are not done, please contact  <br/><br/>";

            Body += "Contact <a href=" + ConfigurationManager.AppSettings["siteurl2"] + " >here</a> <br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS </b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding your changed password");
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (Session["EMAIL"] != null)
                {
                    string x = Session["EMAIL"].ToString();

                    ds = bl.findpwd(x);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string x1 = ds.Tables[0].Rows[0]["pwd"].ToString();
                        if (x1 == txtprepwd.Text)
                        {
                            int i = bl.updatepwd(x, Txtnewpwd.Text);
                            if (i == 1)
                            {
                                string date = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");

                                gv.Visible = true;

                                sendEmail(x, txtprepwd.Text, Txtnewpwd.Text, date);
                                string strScript = "alert('Password Changed Successfully');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                                pwd.Visible = false;
                            }
                            else
                            {
                                string strScript = "alert('Error Occured ! Try again Later');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            }
                        }

                        else
                        {
                            pwd.Visible = true;
                            string strScript = "alert('Previous Password is Wrong');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        }
                    }
                    else
                    {
                        pwd.Visible = true;
                        string strScript = "alert('Error Occured ! Try again Later');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void ImageBtncancel_Click(object sender, ImageClickEventArgs e)
        {
            gv.Visible = true;
            pwd.Visible = false;
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