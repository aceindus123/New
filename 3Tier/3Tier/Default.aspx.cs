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
    public partial class Default1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        int catid;
        bll bl = new bll();
        dal dl = new dal();
        int pos;
        PagedDataSource adsource;
        static string excep_page = "Default.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ds = bl.binddata();
                    ds2 = bl.Allads1();

                    ddtop.DataSource = ds;
                    ddtop.DataBind();

                    if (ds2.Tables[0].Rows.Count > 0)
                    {
                        downdata.Visible = true;

                        ddl.DataSource = ds2;
                        ddl.DataBind();
                    }
                    else
                    {
                        downdata.Visible = false;
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
                Response.Redirect("Mainmenu.aspx?cat=" + catid);
            }
        }

        protected void DataList1_ItemCommand2(object source, DataListCommandEventArgs e)
         {
            if (e.CommandName == "aa")
            {
                catid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Allads.aspx?recent=" + catid);
            }
        }

        protected void ImageButton19_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script type='text/javascript'> window.open('http://http://www.careersgen.com//','_blank',false); </script>");
        }

        protected void ImageButton26_Click(object sender, ImageClickEventArgs e)
        {
            //http://www.indusemail.com/
            Response.Write("<script type='text/javascript'> window.open('http://www.indusemail.com','_blank',false); </script>");
        }
        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            //http://wawalive.com/
            Response.Write("<script type='text/javascript'> window.open('http://wawalive.com','_blank',false); </script>");
        }
        protected void ImageButton18_Click(object sender, ImageClickEventArgs e)
        {
            //http://www.industravels.com/
            Response.Write("<script type='text/javascript'> window.open('http://www.industravels.com/','_blank',false); </script>");
        }


        protected void left_Click(object sender, ImageClickEventArgs e)
        {
            ds2 = bl.Allads3();
            ddl.DataSource = ds2;
            ddl.DataBind();
        }

        protected void right_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ds2 = bl.Allads2();
                ddl.DataSource = ds2;
                ddl.DataBind();
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