using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

namespace _3Tier.Admin
{
    public partial class Menu : System.Web.UI.UserControl
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected DataSet Permission()
        {
            if (Session["admin"] != null)
            {
                string type = Session["usertype"].ToString();
                string user = Session["admin"].ToString();
                ds = bl.permisson(type, user);
                return ds;
            }
            else
            {
                return null;
            }
        }

        protected void lnkhome_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected void lnkclient_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewclient"].ToString() == "1")
                    {
                        Response.Redirect("Clients.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected void lnkad_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewad"].ToString() == "1")
                    {
                        Response.Redirect("ad.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected void lnkcontact_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewcontact"].ToString() == "1")
                    {
                        Response.Redirect("admin-contact.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }

        }

        protected void lnkfeed_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewfeed"].ToString() == "1")
                    {
                        Response.Redirect("admin-feed.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected void lnksupport_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewsupport"].ToString() == "1")
                    {
                        Response.Redirect("admin-support.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewuser"].ToString() == "1")
                    {
                        Response.Redirect("Users.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }
        protected void lnkdeals_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                ds2 = Permission();
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    if (ds2.Tables[0].Rows[0]["viewuser"].ToString() == "1")
                    {
                        Response.Redirect("Deals.aspx");
                    }
                    else
                    {
                        string strScript = "alert('No Permissions to do this task');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('You Don't Have Permission');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }
}
}