using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace _3Tier
{
    public class Global : System.Web.HttpApplication
    {

        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        string Date;
    
        protected void Application_Start(object sender, EventArgs e)
        {

            string myHost = System.Net.Dns.GetHostName();
            string myIP = System.Net.Dns.GetHostByName(myHost).AddressList[0].ToString();

            Date = System.DateTime.Now.ToString();
            con.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("insert into Ipaddress(sysipaddress,datetime,sysnames) values(@sysip,@datetime,@sysname)", con);
            // cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sysname", myHost);
            cmd.Parameters.AddWithValue("@sysip", myIP);
            cmd.Parameters.AddWithValue("@datetime", Date);
            int s = cmd.ExecuteNonQuery();
            con.Close();
        }

        private void InsertInformation(string ipaddress, string Serverinfo, string Date)
        {
            con.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("sp_insertip1", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sysip", ipaddress);
            cmd.Parameters.AddWithValue("@datetime", Date);
            int s = cmd.ExecuteNonQuery();
            con.Close();
        }

        public string GetIPAddress()
        {
            try
            {
                string ipAdd;
                HttpRequest currentRequest = HttpContext.Current.Request;
                ipAdd = currentRequest.ServerVariables["HTTP_X_FORWARDED_FOR"];

                if (ipAdd == null || ipAdd.ToLower() == "unknown")
                    ipAdd = currentRequest.ServerVariables["REMOTE_ADDR"];
                return ipAdd;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetServerInfo()
        {
            try
            {
                string Sinfo;
                HttpRequest currentRequest = HttpContext.Current.Request;
                Sinfo = currentRequest.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (Sinfo == null || Sinfo.ToLower() == "unknown")
                {
                    Sinfo = currentRequest.ServerVariables["REMOTE_ADDR"];
                    Sinfo += "/" + currentRequest.ServerVariables["LOGON_USER"];
                }
                string[] computerinfo = Sinfo.Split('/');

                return computerinfo[1];
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }  

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}