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
    public partial class Mainmenu : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        int catid;
        static string excep_page = "Mainmenu.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ds = bl.bind4();
                DataList1.DataSource = ds;
                DataList1.DataBind();

                if (Convert.ToString(Request.QueryString["cat"]) != null && Request.QueryString["cat"].ToString() != "")
                {
                    catid = Convert.ToInt32(Request.QueryString["cat"].ToString());
                    DataSet a1 = bl.binddata(catid);
                    string a2 = a1.Tables[0].Rows[0]["category"].ToString();
                    lbltitle.Text = a2;
                    lbltitle.Visible = true;
                    DataSet ds1 = bl.binddata(a2);
                    ddtop.DataSource = ds1;
                    ddtop.DataBind();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sale")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                string s = lbltitle.Text;
                Response.Redirect("Allads.aspx?subcat=" + catid + "&title1=" + s);
            }
        }
        protected void DataList1_ItemCommand2(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sale")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Mainmenu.aspx?cat=" + catid);
            }
        }
        protected void lbltitle_Click(object sender, EventArgs e)
        {
            string s = lbltitle.Text;
            Response.Redirect("Allads.aspx?cat=" + s);
        }

    

        protected void lnk1_Click(object sender, EventArgs e)
        {
            string x = "all";
            Response.Redirect("Allads.aspx?all="+x);
        }

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)//ace
        {
            Response.Write("<script type='text/javascript'> window.open('http://aceindus.in/','_blank',false); </script>");
        }

        protected void ImageButton26_Click(object sender, ImageClickEventArgs e)//sms
        {
            Response.Write("<script type='text/javascript'> window.open('http://www.indussms.com/','_blank',false); </script>");
        }

        protected void ImageButton18_Click(object sender, ImageClickEventArgs e)//cf
        {
            Response.Write("<script type='text/javascript'> window.open('http://classifieds4dollar.com/','_blank',false); </script>");
        }

        protected void ImageButton19_Click(object sender, ImageClickEventArgs e)//ig
        {
            Response.Write("<script type='text/javascript'> window.open('http://igiit.com/','_blank',false); </script>");
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