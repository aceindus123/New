<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class ImageHandler : IHttpHandler
{
    SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "image/jpeg";
        string imageid = context.Request.QueryString["imgID"];
        strcon.Open();
        SqlCommand command = new SqlCommand("select Item_Image3 from Main_Cat where sid=" + imageid, strcon);
        SqlDataReader dr = command.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((Byte[])dr[0]);
        strcon.Close();
        context.Response.End();
      }

  
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}