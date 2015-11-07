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
    public partial class ContactUs : System.Web.UI.Page
    {
        dal dl = new dal();
        bll bl = new bll();
        DataSet ds = new DataSet();

        static string excep_page = "ContactUs.aspx";
      
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
                catch (Exception ex)
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
                catch (Exception ex)
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
                catch(Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
        }

       protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string Fname = txtfname.Text;
                string Email = txtEmailid.Text;
                string Address = txtAddress.Text;
                string Country = ddlcountry.SelectedItem.Text;
                string States = ddlstate.SelectedItem.Text;
                string City = ddlcity.SelectedItem.Text;
                string Phonenumber = txtphno.Text;
                string Zipcode = txtzipcode.Text;
                string Comments = txtcomments.Text;
                string date = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");

                int cu = bl.contactus(Fname, Email, Address, Country, States, City, Zipcode, Phonenumber, Comments,date);
                if (cu == 1)
                {
                    sendEmail(Fname, Email, Phonenumber, Comments);

                    //string strScript = "alert('Details are Submitted sucessfully');location.replace('ContactUs.aspx');";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                    Page.ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'>alert('Details are Submitted sucessfully')</script>");

                    txtfname.Text = "";
                    txtEmailid.Text = "";
                    txtAddress.Text = "";
                    ddlcountry.SelectedIndex=-1;
                    ddlstate.SelectedIndex = -1;
                    ddlcity.SelectedIndex = -1;
                    txtphno.Text = "";
                    txtzipcode.Text = "";
                    txtcomments.Text = "";
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

       private void sendEmail(string Fname, string Email, string Phonenumber, string Comments)
       {
           string Body = " <br/><br/>Dear  " + Fname + ",<br/><br/>Greetings from  Indus!!! <br/><br/>";

           Body += "We have received your query. Your query will be resolved by our technical team as soon as possible <br/><br/>";

           Body += "<b>Your Email Id : </b> " + Email + "<br/><br/>";

           Body += "<b>Mobile Number : </b> " + Phonenumber + "<br/><br/>";

           Body += "<b>Query :</b> " + Comments + "<br/><br/>";

           Body += "For More Details Of Site. Please Visit <a href=" + ConfigurationManager.AppSettings["siteurl"] + " >here</a> <br/><br/>";

           Body += "<b>With  Best Wishes,<br/> INDUS </b> <br/><br/>";

           WebClient client = new WebClient();
           NameValueCollection values = new NameValueCollection();
           values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
           values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
           values.Add("from", "vyarramsetty@aceindus.in");
           values.Add("from_name", "vyarramsetty@aceindus.in");
           values.Add("subject", "Regarding your query. ");
           values.Add("body_html", Body);
           values.Add("to", Email);
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

        protected void btnreset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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