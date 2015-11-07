using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _3Tier.UserControls
{
    public partial class TopUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ip();

                if (Session["USER"] != null)
                {
                    string a = Session["USER"].ToString();
                    if (a != "")
                    {
                        user.Visible = true;
                        user.Text = a;
                        logout.Visible = true;
                    }
                }
            }
        }

        private void ip()
        {
            string myHost = System.Net.Dns.GetHostName();
            string myIP = System.Net.Dns.GetHostByName(myHost).AddressList[0].ToString();
            lblipadd.Text = myIP;
        }

        protected void imgad_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Postad.aspx");
        }

        protected void imgac_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["USER"] != null)
            {
                Response.Redirect("History.aspx");
            }
            else
            {
                Response.Redirect("Profile.aspx");
            }
        }

        protected void ImageButton22_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ImageButton23_Click(object sender, ImageClickEventArgs e)
        {
            //fb
        }

        protected void ImageButton24_Click(object sender, ImageClickEventArgs e)
        {
            //twitter
        }

        protected void ImageButton25_Click(object sender, ImageClickEventArgs e)
        {
            //googl
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}