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
    public partial class PostImage : System.Web.UI.Page
    {
        dal dl = new dal();
        bll bl = new bll();
        DataSet ds = new DataSet();
        int catid;
        static string excep_page = "PostImage.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToString(Request.QueryString["id"]) != null && Request.QueryString["id"].ToString() != "")
                {
                    string x = Convert.ToString(Request.QueryString["id"]);
                    ds = bl.Detailadbind(x);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ddtop.DataSource = ds;
                        ddtop.DataBind();
                    }
                }

                if (Convert.ToString(Request.QueryString["id1"]) != null && Request.QueryString["id1"].ToString() != "")
                {
                    string x = Convert.ToString(Request.QueryString["id1"]);
                    ds = bl.Detailadbind(x);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                    }
                }
                if (Convert.ToString(Request.QueryString["id2"]) != null && Request.QueryString["id2"].ToString() != "")
                {
                    string x = Convert.ToString(Request.QueryString["id2"]);
                    ds = bl.Detailadbind(x);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataList2.DataSource = ds;
                        DataList2.DataBind();
                    }
                }
                if (Convert.ToString(Request.QueryString["id3"]) != null && Request.QueryString["id3"].ToString() != "")
                {
                    string x = Convert.ToString(Request.QueryString["id3"]);
                    ds = bl.Detailadbind(x);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataList3.DataSource = ds;
                        DataList3.DataBind();
                    }
                }
                if (Convert.ToString(Request.QueryString["id4"]) != null && Request.QueryString["id4"].ToString() != "")
                {
                    string x = Convert.ToString(Request.QueryString["id4"]);
                    ds = bl.Detailadbind(x);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataList4.DataSource = ds;
                        DataList4.DataBind();
                    }
                }
                if (Convert.ToString(Request.QueryString["id5"]) != null && Request.QueryString["id5"].ToString() != "")
                {
                    string x = Convert.ToString(Request.QueryString["id5"]);
                    ds = bl.Detailadbind(x);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataList5.DataSource = ds;
                        DataList5.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
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