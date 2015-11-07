using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using System.Data;
using System.Net;
using System.Configuration;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.IO;

namespace _3Tier.Admin
{
    public partial class ad : System.Web.UI.Page
    {
        bll bl = new bll();
        dal dl = new dal();
        DataSet ds = new DataSet();
        DataSet ds2 = new DataSet();
        static string excep_page = "ad.aspx";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                if (!IsPostBack)
                {
                    try
                    {
                        ads();
                        ds = bl.bind();
                        ddcat.DataTextField = "category";
                        ddcat.DataSource = ds;
                        ddcat.DataBind();
                        ddcat.Items.Insert(0, "Select");

                        ds2 = bl.getcountry();
                        ddc.DataSource = ds2;
                        ddc.DataTextField = "countryname";
                        ddc.DataValueField = "countryid";
                        ddc.DataBind();
                        ddc.Items.Insert(0, "Select Country");
                    }
                    catch(Exception ex)
                    {
                        bl.insert_exception(ex, excep_page);
                        Response.Redirect("~/ErrorPage.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddc.SelectedItem.Text == "Select Country")
            {
                ddlcity.Items.Clear();
                dds.Items.Clear();
                dds.Items.Insert(0, "Select State");
                ddlcity.Items.Insert(0, "Select City");
            }
            else
            {
                dds.Items.Clear();
                ddlcity.Items.Clear();
                string y = ddc.SelectedItem.Value.ToString();

                try
                {
                    ds = bl.getstates(y);
                    dds.Items.Insert(0, "Select State");
                    ddlcity.Items.Insert(0, "Select City");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                        {
                            dds.Items.Add("");
                            dds.Items[i].Text = ds.Tables[0].Rows[i - 1]["statename"].ToString();
                            dds.Items[i].Value = ds.Tables[0].Rows[i - 1]["stateid"].ToString();
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

        protected void ddcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string s = ddcat.SelectedItem.Text;
                DataSet ds = bl.bind3(s);
                ddsub.DataTextField = "SubCategory";
                ddsub.DataSource = ds;
                ddsub.DataBind();
                ddsub.Items.Insert(0, "Select");
            }
            catch(Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dds.SelectedItem.Text == "Select State")
            {
                ddlcity.Items.Clear();
                ddlcity.Items.Insert(0, "Select City");
            }
            else
            {
                try
                {
                    ddlcity.Items.Clear();
                    string z = dds.SelectedItem.Value.ToString();
                    ds = bl.getcities2(z);
                    ddlcity.Items.Insert(0, "Select City");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                        {
                            ddlcity.Items.Add("");
                            ddlcity.Items[i].Text = ds.Tables[0].Rows[i - 1]["cityname"].ToString();
                            ddlcity.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
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

        protected void ads()
        {
            ds = bl.ad();
            gvusers.DataSource = ds;
            gvusers.DataBind();
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

        private void sendEmail(string name, string mail,string  cat, string subcat,string title,string dis,string cost,string mobile,string address )
        {
            string Body = " <br/><br/> Dear " + name + ",<br/><br/>Greetings from Indus!! <br/><br/>";

            Body += " Your ad has been posted successfully. Kindly check out the details and let us know your feedback <br/><br/>";

            Body += "<u><b>Your Details Of Posted Ad</b></u> <br/><br/>";

            Body += "<b>Your Mail :</b> " + mail + "<br/><br/>";

            Body += "<b> Catagory :</b> " + cat + "<br/><br/>";

            Body += "<b>Sub Catagory :</b> " + subcat + "<br/><br/>";

            Body += "<b> Posted Title : </b> " + title + "<br/><br/>";

            Body += "<b> Item Discription :</b> " + dis + "<br/><br/>";

            Body += "<b> Item Price : </b> " + cost + "<br/><br/>";

            Body += "<b> Mobile : </b> " + mobile + "<br/><br/>";

            Body += "<b> Address :  </b> " + address + "<br/><br/>";

            Body += "For More Details Of Site. Please Visit <a href=" + ConfigurationManager.AppSettings["siteurl"] + " >here</a> <br/><br/>";


            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding  Approval of your ad");
            values.Add("body_html", Body);
            values.Add("to", mail);
            try
            {
                byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
            }

            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }

        }

        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvusers.PageIndex = e.NewPageIndex;
            gvusers.DataBind();
            ads();
        }

        protected void ListName(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["viewad"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        ds = bl.findad(listid);

                        ddtop.DataSource = ds;
                        ddtop.DataBind();
                        pnledit.Visible = true;
                        ModalPopupExtender1.Show();
                      
                    }
                    catch (Exception ex)
                    {
                        bl.insert_exception(ex, excep_page);
                        Response.Redirect("~/ErrorPage.aspx");
                    }
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

    
        protected void ListName1(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["statausad"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.statusad(listid);

                        if (i != 0)
                        {
                            ds= bl.statusad1(listid);

                            string name = ds.Tables[0].Rows[0]["seller"].ToString();
                            string mail = ds.Tables[0].Rows[0]["Email"].ToString();
                            string cat = ds.Tables[0].Rows[0]["item_cat"].ToString();
                            string subcat = ds.Tables[0].Rows[0]["item_subacat"].ToString();
                            string title = ds.Tables[0].Rows[0]["item_title"].ToString();
                            string dis = ds.Tables[0].Rows[0]["item_dis"].ToString();
                            string cost = ds.Tables[0].Rows[0]["item_cost"].ToString();
                            string mobile = ds.Tables[0].Rows[0]["mobile"].ToString();
                            string address = ds.Tables[0].Rows[0]["address"].ToString();

                            if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
                            {
                                sendEmail(name,  mail,  cat,subcat,title,dis,cost,mobile,address);
                                string strScript = "alert('Ad Status Modifed');location.replace('ad.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            }
                            else
                            {
                                sendEmail1(name, mail, cat, subcat, title, dis);
                                string strScript = "alert('Ad Status Modifed');location.replace('ad.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            }
                        }
                        else
                        {
                            string strScript = "alert('Error Occured! Try again');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
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

        private void sendEmail1(string name, string mail, string cat, string subcat, string title, string dis)
        {
            string Body = " <br/><br/> Dear " + name + ",<br/><br/>Greetings from Indus!! <br/><br/>";

            Body += " Your ad has been Stopped Temporarly <br/><br/>";

            Body += "<u><b>Your Details Of Posted Ad</b></u> <br/><br/>";

            Body += "<b>Your Mail :</b> " + mail + "<br/><br/>";

            Body += "<b> Catagory :</b> " + cat + "<br/><br/>";

            Body += "<b>Sub Catagory :</b> " + subcat + "<br/><br/>";

            Body += "<b> Posted Title : </b> " + title + "<br/><br/>";

            Body += "<b> Item Discription :</b> " + dis + "<br/><br/>";


            Body += "For More Details Of Your Ad. Please Contact <a href=" + ConfigurationManager.AppSettings["siteurl2"] + " >here</a> <br/><br/>";


            Body += "<b>With  Best Wishes,<br/> INDUS :</b> <br/><br/>";

            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", "vyarramsetty@aceindus.in");
            values.Add("from_name", "vyarramsetty@aceindus.in");
            values.Add("subject", "Regarding  Stopped  of your ad");
            values.Add("body_html", Body);
            values.Add("to", mail);
            try
            {
                byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
            }

            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void ListName2(object sender, CommandEventArgs e)
        {
            ds2 = Permission();
            if (ds2.Tables[0].Rows.Count != 0)
            {
                if (ds2.Tables[0].Rows[0]["deletead"].ToString() == "1")
                {
                    int listid;
                    try
                    {
                        string list_id;
                        list_id = e.CommandArgument.ToString();
                        listid = Convert.ToInt32(list_id);
                        Session["listid1"] = listid;

                        int i = bl.deletead(listid);

                        if (i != 0)
                        {
                            string strScript = "alert('Ad Deleted');location.replace('ad.aspx');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        }
                        else
                        {
                            string strScript = "alert('Error Occured! Try again');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
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

        protected void imgsubmit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string cat = ddcat.SelectedItem.Text;
                string subcat = ddsub.SelectedItem.Text;
                string title = txttitle.Text;
                string dis = txtdis.Text;
                string name = txtname.Text;
                string cost = txtcost.Text;
                string email = txtemail.Text;
                string mobile = txtmobile.Text;
                string loc = txtloc.Text;
                string country = ddc.SelectedItem.Text;
                string state = dds.SelectedItem.Text;
                string city = ddlcity.SelectedItem.Text;
                string zip = txtzip.Text;
                string date = System.DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
                int status = 1;


                // Read the file and convert it to Byte Array
                string filePath = upload1.PostedFile.FileName;
                string filename = Path.GetFileName(filePath);
                string ext = Path.GetExtension(filename);

                string filePath1 = upload2.PostedFile.FileName;
                string filename1 = Path.GetFileName(filePath1);
                string ext1 = Path.GetExtension(filename1);

                string filePath2 = upload3.PostedFile.FileName;
                string filename2 = Path.GetFileName(filePath2);
                string ext2 = Path.GetExtension(filename2);

                string filePath3 = upload4.PostedFile.FileName;
                string filename3 = Path.GetFileName(filePath3);
                string ext3 = Path.GetExtension(filename3);

                string filePath4 = upload5.PostedFile.FileName;
                string filename4 = Path.GetFileName(filePath4);
                string ext4 = Path.GetExtension(filename4);

                string filePath5 = upload6.PostedFile.FileName;
                string filename5 = Path.GetFileName(filePath5);
                string ext5 = Path.GetExtension(filename5);

                string contenttype = String.Empty;

                //Set the contenttype based on File Extension
                switch (ext)
                {
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                }

                switch (ext1)
                {
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                }

                switch (ext2)
                {
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                }

                switch (ext3)
                {
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                }

                switch (ext4)
                {
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                }

                switch (ext5)
                {
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                }
                if (contenttype != String.Empty)
                {
                    Stream fs = upload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    Stream fs1 = upload2.PostedFile.InputStream;
                    BinaryReader br1 = new BinaryReader(fs1);
                    Byte[] bytes1 = br1.ReadBytes((Int32)fs1.Length);

                    Stream fs2 = upload3.PostedFile.InputStream;
                    BinaryReader br2 = new BinaryReader(fs2);
                    Byte[] bytes2 = br2.ReadBytes((Int32)fs2.Length);

                    Stream fs3 = upload4.PostedFile.InputStream;
                    BinaryReader br3 = new BinaryReader(fs3);
                    Byte[] bytes3 = br3.ReadBytes((Int32)fs3.Length);

                    Stream fs4 = upload5.PostedFile.InputStream;
                    BinaryReader br4 = new BinaryReader(fs4);
                    Byte[] bytes4 = br4.ReadBytes((Int32)fs4.Length);

                    Stream fs5 = upload6.PostedFile.InputStream;
                    BinaryReader br5 = new BinaryReader(fs5);
                    Byte[] bytes5 = br5.ReadBytes((Int32)fs5.Length);

                    //insert the file into database
                    string strQuery = "insert into Main_Cat( Item_Cat,Item_Subacat,Item_Title,Item_Dis,Seller,Item_cost,Email,Mobile,Address,country,state,City,zipcode,Item_Image1name,Item_Image1,Item_Image2name,Item_Image2,Item_Image3name,Item_Image3,Item_Image4name,Item_Image4,Item_Image5name,Item_Image5,Item_Image6name,Item_Image6,Posted_Date,status) values ( @Item_Cat,@Item_Subacat,@Item_Title,@Item_Dis,@Seller,@item_cost,@Email,@Mobile,@Address,@country,@state,@City,@zipcode,@Item_Image1name,@Item_Image1,@Item_Image2name,@Item_Image2,@Item_Image3name,@Item_Image3,@Item_Image4name,@Item_Image4,@Item_Image5name,@Item_Image5,@Item_Image6name,@Item_Image6,@Posted_Date,@status)";
                    SqlCommand cmd = new SqlCommand(strQuery);

                    cmd.Parameters.Add("@Item_Cat", SqlDbType.VarChar).Value = cat;
                    cmd.Parameters.Add("@Item_Subacat", SqlDbType.VarChar).Value = subcat;
                    cmd.Parameters.Add("@Item_Title", SqlDbType.VarChar).Value = title;
                    cmd.Parameters.Add("@Item_Dis", SqlDbType.VarChar).Value = dis;
                    cmd.Parameters.Add("@Seller", SqlDbType.VarChar).Value = name;
                    cmd.Parameters.Add("@item_cost", SqlDbType.VarChar).Value = cost;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
                    cmd.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = mobile;
                    cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = loc;
                    cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = country;
                    cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = state;
                    cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = city;
                    cmd.Parameters.Add("@zipcode", SqlDbType.VarChar).Value = zip;
                    cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = status;



                    cmd.Parameters.Add("@Item_Image1name", SqlDbType.VarChar).Value = filename;
                    cmd.Parameters.Add("@Item_Image1", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@Item_Image2name", SqlDbType.VarChar).Value = filename1;
                    cmd.Parameters.Add("@Item_Image2", SqlDbType.Binary).Value = bytes1;
                    cmd.Parameters.Add("@Item_Image3name", SqlDbType.VarChar).Value = filename2;
                    cmd.Parameters.Add("@Item_Image3", SqlDbType.Binary).Value = bytes2;
                    cmd.Parameters.Add("@Item_Image4name", SqlDbType.VarChar).Value = filename3;
                    cmd.Parameters.Add("@Item_Image4", SqlDbType.Binary).Value = bytes3;
                    cmd.Parameters.Add("@Item_Image5name", SqlDbType.VarChar).Value = filename4;
                    cmd.Parameters.Add("@Item_Image5", SqlDbType.Binary).Value = bytes4;
                    cmd.Parameters.Add("@Item_Image6name", SqlDbType.VarChar).Value = filename5;
                    cmd.Parameters.Add("@Item_Image6", SqlDbType.Binary).Value = bytes5;

                    cmd.Parameters.Add("@Posted_Date", SqlDbType.VarChar).Value = date;

                    int a = bl.InsertUpdateData(cmd);
                    if (a != 0)
                    {
                        Random rd = new Random();
                        Label lbl = new Label();
                        lbl.Text = Convert.ToString(rd.Next(10000));

                        DataSet ds = bl.bind1();

                        string x = ds.Tables[0].Rows[0]["sid"].ToString();
                        string x1 = lbl.Text;
                        int i = bl.bind2(x1, x);
                        clear();

                        Page.ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'>alert('Congrats Yor Ad is Submitted Succesfully Publish Shortly. Ad Id is " + lbl.Text + "')</script>");
                    }
                }
                else
                {
                    string script = "alert('Please Upload PNG/JPG Images')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
            catch (Exception ex)
            {
                bl.insert_exception(ex, excep_page);
                Response.Redirect("~/ErrorPage.aspx");
            }

        }

        public void clear()
        {
            ddcat.SelectedIndex = -1;
            ddsub.SelectedIndex = -1;
            ddc.SelectedIndex = -1;
            dds.SelectedIndex = -1;
            ddlcity.SelectedIndex = -1;
            txtdis.Text = "";
            txtemail.Text = "";
            txtloc.Text = ""; ;
            txtmobile.Text = "";
            txtname.Text = "";
            txttitle.Text = "";
            txtcost.Text = "";
            txtzip.Text = "";
        }

        protected void imgcancel_Click(object sender, ImageClickEventArgs e)
        {
            clear();
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            addata.Visible = false;
            updateclient.Visible = true;
        }
}
}