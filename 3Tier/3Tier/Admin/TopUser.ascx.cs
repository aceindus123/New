using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _3Tier.Admin
{
    public partial class TopUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                string a=Session["Admin"].ToString();
                if (a != "")
                {
                    user.Visible = true;
                    user.Text = a;
                    logout.Visible = true;
                }
            }
            else
            {
               
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}