using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace _3Tier
{
    public partial class DetailedAds : System.Web.UI.Page
    {
        dal dl = new dal();
        bll bl = new bll();
        DataSet ds = new DataSet();
        int catid;
        static string excep_page = "DetailedAds.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Convert.ToString(Request.QueryString["allad"]) != null && Request.QueryString["allad"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["allad"]);
                        ds = bl.Detailadbind(x);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string a = ds.Tables[0].Rows[0]["email"].ToString();
                            string b = ds.Tables[0].Rows[0]["mobile"].ToString();
                            string c = ds.Tables[0].Rows[0]["seller"].ToString();
                            string d = ds.Tables[0].Rows[0]["item_title"].ToString();
                            int id = Convert.ToInt32 (ds.Tables[0].Rows[0]["sid"]);
                            Session["id"]=id;
                            Session["title"] = d;
                            Session["seller"] = c;
                            Session["email"] = a;
                            Session["mobile"] = b;
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                            DataList1.DataSource = ds;
                            DataList1.DataBind();
                        }
                        else
                        {
                            string script = "alert('No Ads Found')";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                        }
                    }
                    if (Session["id"] != null)
                    {
                        string x1 = Session["id"].ToString();
                        ds = bl.Detailadbind(x1);
                        ddtop.DataSource = ds;
                        ddtop.DataBind();
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    bl.insert_exception(ex, excep_page);
                    Response.Redirect("~/ErrorPage.aspx");
                }
            }
        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sale")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("DetailedAds.aspx");
            }
        }

        protected void lnkseller_Click(object sender, EventArgs e)
        {
            try
            {
                string a = Session["email"].ToString();
                string b = Session["mobile"].ToString();
                ds = bl.bind(a, b);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataList2.Visible = true;
                    DataList2.DataSource = ds;
                    DataList2.DataBind();
                    nolabel.Visible = false;
                }
                else
                {
                    nolabel.Visible = true;
                    DataList2.Visible = false;
                }
            }

            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void DataList1_ItemCommand2(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sale")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("DetailedAds.aspx");
            }
        }

        protected void Label10_Click(object sender, ImageClickEventArgs e)
        {
            if ((txtcomment.Text != "") && (txtmobile.Text != "") && (txtemail.Text != ""))
            {
                if (Session["seller"] != "")
                {
                    try
                    {
                        string a = Session["seller"].ToString();
                        string b = Session["email"].ToString();
                        string c = Session["mobile"].ToString();
                        string d = Session["title"].ToString();

                        string e1 = txtemail.Text;
                        string f = txtmobile.Text;
                        string g = txtcomment.Text;
                        int h = 0;
                        string i = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
                        int s = bl.deal(a, b, c, d, e1, f, g, h, i);

                        if (s != 0)
                        {
                            string script = "alert('Mail sent to Seller, If Seller interest he will Call you');location.replace('DetailedAds.aspx');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
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
                    Response.Redirect("DetailedAds.aspx.aspx");
                }
            }
            else
            {
                string script = "alert('Enter Comment,Email and Your Mobile Number');location.replace('DetailedAds.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }

        }

        protected void lnkmore_Click(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'> window.open('MoreTips.aspx','_blank',false); </script>");
        }

        protected void DataList1_ItemCommand3(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "aa")
            {
                int s = Convert.ToInt32(e.CommandArgument);
                string redirect = string.Format("<script>window.open('{0}');</script>", string.Format("PostImage.aspx?id={0}", +s));
                Response.Write(redirect);
            }
            if (e.CommandName == "aa1")
            {
                int s = Convert.ToInt32(e.CommandArgument);
                string redirect = string.Format("<script>window.open('{0}');</script>", string.Format("PostImage.aspx?id1={0}", +s));
                Response.Write(redirect);
            }
            if (e.CommandName == "aa2")
            {
                int s = Convert.ToInt32(e.CommandArgument);
                string redirect = string.Format("<script>window.open('{0}');</script>", string.Format("PostImage.aspx?id2={0}", +s));
                Response.Write(redirect);
            }
            if (e.CommandName == "aa3")
            {
                int s = Convert.ToInt32(e.CommandArgument);
                string redirect = string.Format("<script>window.open('{0}');</script>", string.Format("PostImage.aspx?id3={0}", +s));
                Response.Write(redirect);
            }
            if (e.CommandName == "aa4")
            {
                int s = Convert.ToInt32(e.CommandArgument);
                string redirect = string.Format("<script>window.open('{0}');</script>", string.Format("PostImage.aspx?id4={0}", +s));
                Response.Write(redirect);
            }
            if (e.CommandName == "aa5")
            {
                int s = Convert.ToInt32(e.CommandArgument);
                string redirect = string.Format("<script>window.open('{0}');</script>", string.Format("PostImage.aspx?id5={0}", +s));
                Response.Write(redirect);
            }
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