using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Configuration;
using System.Data.SqlClient;

namespace _3Tier
{
    public partial class Allads : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        int catid;
        static string excep_page = "Allads.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Convert.ToString(Request.QueryString["subcat"]) != null && Request.QueryString["subcat"].ToString() != "")
                    {

                        string x = Convert.ToString(Request.QueryString["subcat"]);
                        string x2 = Convert.ToString(Request.QueryString["title1"]);
                        if (x2 == "Books ")
                        {
                            x2 = "Books & Sports";
                        }
                        else if (x2 == "Electronics ")
                        {
                            x2 = "Electronics & Computers";
                        }
                        else if (x2 == "Fashion ")
                        {
                            x2 = "Fashion & Beauty";
                        }
                        else if (x2 == "Home ")
                        {
                            x2 = "Home & Furniture";
                        }
                        else if (x2 == "Mobiles ")
                        {
                            x2 = "Mobiles & Tablets";
                        }

                        ds = bl.Alladsubcat(x);
                        string x1 = ds.Tables[0].Rows[0]["SubCategory"].ToString();
                        lnk1.Text = x2;
                        lnk2.Text = x1;

                        ds2 = bl.Alladsubcat1(x1);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds2;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["cat"]) != null && Request.QueryString["cat"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["cat"]);
                        if (x == "Books ")
                        {
                            x = "Books & Sports";
                        }
                        else if (x == "Electronics ")
                        {
                            x = "Electronics & Computers";
                        }
                        else if (x == "Fashion ")
                        {
                            x = "Fashion & Beauty";
                        }
                        else if (x == "Home ")
                        {
                            x = "Home & Furniture";
                        }
                        else if (x == "Mobiles ")
                        {
                            x = "Mobiles & Tablets";
                        }

                        lnk1.Text = x;
                        lbla.Visible = false;

                        ds = bl.Alladcat(x);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["address"]) != null && Request.QueryString["address"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["address"]);

                        ds = bl.Alladadd(x);
                        string a = ds.Tables[0].Rows[0]["address"].ToString();
                        lnk1.Text = a;
                        lbla.Visible = false;

                        ds2 = bl.Alladadd1(a);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds2;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["city"]) != null && Request.QueryString["city"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["city"]);

                        ds = bl.Alladcity(x);
                        string a = ds.Tables[0].Rows[0]["city"].ToString();
                        lnk1.Text = a;
                        lbla.Visible = false;

                        ds2 = bl.Alladcity1(a);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds2;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["city1"]) != null && Request.QueryString["city1"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["city1"]);
                        lnk1.Text = x;
                        lbla.Visible = false;

                        ds2 = bl.Alladcity1(x);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds2;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["cat1"]) != null && Request.QueryString["cat1"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["cat1"]);

                        ds2 = bl.Alladcat1(x);

                        string a = ds2.Tables[0].Rows[0]["item_cat"].ToString();
                        lnk1.Text = a;
                        lbla.Visible = false;

                        ds = bl.Alladcat(a);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["subcat1"]) != null && Request.QueryString["subcat1"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["subcat1"]);

                        ds2 = bl.Alladsubcat2(x);
                        string a = ds2.Tables[0].Rows[0]["item_subacat"].ToString();
                        lnk1.Text = a;
                        lbla.Visible = false;

                        ds = bl.Alladsubcat1(a);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["serchid"]) != null && Request.QueryString["serchid"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["serchid"]);
                        lnk1.Text = x;
                        lbla.Visible = false;
                        ds = bl.Alladsearch(x);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }

                    }
                    if (Convert.ToString(Request.QueryString["all"]) != null && Request.QueryString["all"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["all"]);
                        lnk1.Text = x;
                        lbla.Visible = false;
                        ds = bl.Allads();
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }

                    }

                    if (Convert.ToString(Request.QueryString["recent"]) != null && Request.QueryString["recent"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["recent"]);
                        lnk1.Text = "ITEM";
                        lbla.Visible = false;
                        ds = bl.Detailadbind(x);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }

                    }

                    if ((Convert.ToString(Request.QueryString["serchid2"]) != null && Request.QueryString["serchid2"].ToString() != "") && (Convert.ToString(Request.QueryString["state1"]) != null && Request.QueryString["state1"].ToString() != ""))
                    {
                        string x1 = Convert.ToString(Request.QueryString["serchid2"]);
                        string x = Convert.ToString(Request.QueryString["state1"]);

                        lnk1.Text = x;
                        lnk2.Text = x1;
                        lbla.Visible = true;
                        ds = bl.search2(x, x1);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }
                    }

                    if (Convert.ToString(Request.QueryString["serchid1"]) != null && Request.QueryString["serchid1"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["serchid1"]);
                        lbla.Visible = false;

                        if (x == "Books ")
                        {
                            x = "Books & Sports";
                        }
                        else if (x == "Electronics ")
                        {
                            x = "Electronics & Computers";
                        }
                        else if (x == "Fashion ")
                        {
                            x = "Fashion & Beauty";
                        }
                        else if (x == "Home ")
                        {
                            x = "Home & Furniture";
                        }
                        else if (x == "Mobiles ")
                        {
                            x = "Mobiles & Tablets";
                        }

                        lnk1.Text = x;


                        ds = bl.search(x);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
                        }

                    }

                    if (Convert.ToString(Request.QueryString["state"]) != null && Request.QueryString["state"].ToString() != "")
                    {
                        string x = Convert.ToString(Request.QueryString["state"]);
                        lnk1.Text = x;
                        lbla.Visible = false;
                        ds = bl.search1(x);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddtop.DataSource = ds;
                            ddtop.DataBind();
                        }
                        else
                        {
                            ddtop.Visible = false;
                            Label1.Visible = true;
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

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sale")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("DetailedAds.aspx?allad=" + catid);
            }

            if (e.CommandName == "sale1")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Allads.aspx?address=" + catid);
            }

            if (e.CommandName == "sale2")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Allads.aspx?city=" + catid);
            }

            if (e.CommandName == "sale3")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Allads.aspx?cat1=" + catid);
            }

            if (e.CommandName == "sale4")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Allads.aspx?subcat1=" + catid);
            }
        }
        protected void lnkmore_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoreTips.aspx");

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
            try
            {
                if (txtloc.Text != "")
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