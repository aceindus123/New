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
    public partial class Feedback : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        bool cu;
        static string excep_page = "FeedBack.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    ds = bl.getcountry();
                    ddlcountry.DataSource = ds;
                    ddlcountry.DataTextField = "countryname";
                    ddlcountry.DataValueField = "countryid";
                    ddlcountry.DataBind();
                }
                catch(Exception ex)
                {
                     bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
                }
            }
        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcountry.SelectedItem.Text == "Select Country")
            {
                ddlcity.Items.Clear();
                ddlstate.Items.Clear();
                ddlstate.Items.Insert(0, "Select State");
                ddlcity.Items.Insert(0, "Select City");
            }
            else
            {
                try
                {
                    ddlstate.Items.Clear();
                    ddlcity.Items.Clear();
                    DataSet dsstate = new DataSet();
                    string y = ddlcountry.SelectedItem.Value.ToString();
                    ds = bl.getstates(y);
                    ddlstate.Items.Insert(0, "Select State");
                    ddlcity.Items.Insert(0, "Select City");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                        {

                            ddlstate.Items.Add("");
                            ddlstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["statename"].ToString();
                            ddlstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["stateid"].ToString();
                        }
                    }
                }
                catch(Exception ex)
                {
                     bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
                }
            }
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlstate.SelectedItem.Text == "Select State")
            {
                ddlcity.Items.Clear();
                ddlcity.Items.Insert(0, "Select City");
            }
            else
            {
                try
                {
                    ddlcity.Items.Clear();
                    DataSet dscity = new DataSet();
                    string z = ddlstate.SelectedItem.Value.ToString();
                    ds = bl.getcities2(z);
                    ddlcity.Items.Insert(0, "Select City");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                        {

                            ddlcity.Items.Add("");
                            ddlcity.Items[i].Text = ds.Tables[0].Rows[i - 1]["cityname"].ToString();
                            ddlcity.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
        }
        protected void imgSubmit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string fname = txtfname.Text;
                string femail = txtEmailid.Text;
                string fsub = Txtsubject.Text;
                string fmsg = txtcomments.Text;
                string contry1 = ddlcountry.SelectedItem.Text;
                string state1 = ddlstate.SelectedItem.Text;
                string city1 = ddlcity.SelectedItem.Text;

                int reply = bl.insertfb(fname, femail, fsub, fmsg, contry1, state1, city1);
                if (reply > 0)
                {
                   sendEmail(fname, femail, fsub, fmsg);

                    string alert = "alert('Your Feed Back is Submitted Successfully')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                    txtcomments.Text = "";
                    txtEmailid.Text = "";
                    txtfname.Text = "";
                    Txtsubject.Text = "";
                    ddlcountry.SelectedIndex = -1;
                    ddlstate.SelectedIndex = -1;
                    ddlcity.SelectedIndex = -1;
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }


        private void sendEmail(string fname, string email, string fsub, string fmsg)
        {
            string Body = " <br/><br/>Dear  "+fname+",<br/><br/>Greetings from  Indus!!! <br/><br/>";

            Body += "We have received your query. Your query will be resolved by our technical team as soon as possible <br/><br/>";

            Body += "<b>Your Email Id : </b> " + email + "<br/><br/>";

            Body += "<b>Subject : </b> " + fsub + "<br/><br/>";

            Body += "<b>Query :</b> " + fmsg + "<br/><br/>";

            Body += "For More Details Of Site. Please Visit <a href=" + ConfigurationManager.AppSettings["siteurl"] + " >here</a> <br/><br/>";

            Body += "<b>With  Best Wishes,<br/> INDUS </b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding your query "+fsub+"");
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

        protected void imgReset_Click(object sender, ImageClickEventArgs e)
        {
            txtcomments.Text = "";
            txtEmailid.Text = "";
            txtfname.Text = "";
            Txtsubject.Text = "";
            ddlcountry.SelectedIndex = -1;
            ddlstate.SelectedIndex = -1;
            ddlcity.SelectedIndex = -1;
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