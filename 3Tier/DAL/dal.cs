using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;


namespace DAL
{
    public class dal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();

        public DataSet binddata()
        {
            da = new SqlDataAdapter("select * from Img_Cat order by Category asc", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet bind(string s)
        {
            da = new SqlDataAdapter("select stateid from state where statename='" + s + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet bindcities(string pre, int id)
        {
            da = new SqlDataAdapter("select * from city where cityname like '" + pre + "%' and stateid='" + id + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet getcountry()
        {
            string qry = "select * from Country";
            da = new SqlDataAdapter(qry, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet getstates(string y)
        {
            cmd = new SqlCommand("select * from state where countryid=" + y + " order by  statename asc ", con);
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }

        public DataSet getcities2(string z)
        {
            cmd = new SqlCommand("select * from city where stateid=" + z, con);
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }

        public int contactus(string Fname, string Email, string Address, string Country, string States, string City, string Zipcode, string Phonenumber, string Comments,string date)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert_contactus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@fname", Fname));
                cmd.Parameters.Add(new SqlParameter("@email", Email));
                cmd.Parameters.Add(new SqlParameter("@address", Address));
                cmd.Parameters.Add(new SqlParameter("@country", Country));
                cmd.Parameters.Add(new SqlParameter("@state", States));
                cmd.Parameters.Add(new SqlParameter("@city", City));
                cmd.Parameters.Add(new SqlParameter("@zipcode", Zipcode));
                cmd.Parameters.Add(new SqlParameter("@phnum", Phonenumber));
                cmd.Parameters.Add(new SqlParameter("@comments", Comments));
                cmd.Parameters.Add(new SqlParameter("@date", date));

                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            catch (Exception ex)
            {
                int x;
                string script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
                return x = 0;
            }
        }

        public int insertfb(string fname, string femail, string fsub, string fmsg, string contry1, string state1, string city1)
        {
            DateTime dt = System.DateTime.Now;
            int x = 0;
            con.Open();
            SqlCommand cmd = new SqlCommand("insertfdb", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@fname", fname));
            cmd.Parameters.Add(new SqlParameter("@femail", femail));
            cmd.Parameters.Add(new SqlParameter("@fsubject", fsub));
            cmd.Parameters.Add(new SqlParameter("@fmessage", fmsg));
            cmd.Parameters.Add(new SqlParameter("@fdate", dt));
            cmd.Parameters.Add(new SqlParameter("@contry1", contry1));
            cmd.Parameters.Add(new SqlParameter("@state1", state1));
            cmd.Parameters.Add(new SqlParameter("@city1", city1));
            x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet bind()
        {
            da = new SqlDataAdapter("select category,cid from Img_Cat order by Category asc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int InsertUpdateData(SqlCommand cmd)
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                int x = cmd.ExecuteNonQuery();
                con.Close();

                return x;
            }
            catch (Exception ex)
            {
                int y = 0;
                return y;
            }
            finally
            {
                //  con.Dispose();
            }
        }

        public DataSet bind1()
        {
            da = new SqlDataAdapter("select top(1) sid from Main_Cat order by sid desc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int bind2(string x1, string x)
        {
            string y = "update Main_Cat set ad_id='" + x1 + "' where  sid='" + x + "'";
            con.Open();
            SqlCommand cmd1 = new SqlCommand(y, con);
            int i = cmd1.ExecuteNonQuery();
            con.Close();
            return i;
        }

        public DataSet bind3(string s)
        {
            da = new SqlDataAdapter("select SubCategory from Img_SubCat where category='" + s + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds; 
        }

        public DataSet bind4()
        {
            da = new SqlDataAdapter("select category,cid from Img_Cat order by Category asc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet binddata(int catid)
        {
            da = new SqlDataAdapter("select category from Img_Cat where cid =" + catid + "", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet binddata(string a2)
        {
            da = new SqlDataAdapter("select cid,SubCategory,cat_Image from Img_SubCat where category='" + a2 + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladsubcat(string x)
        {
            da = new SqlDataAdapter("select SubCategory from Img_SubCat where cid=" + x + "", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladsubcat1(string x)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where Item_Subacat='" + x + "' and status=1", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladcat(string x)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where Item_cat='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladadd(string x)
        {
            da = new SqlDataAdapter("select address from  Main_Cat where sid='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladadd1(string x)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where address='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladcity(string x)
        {
            da = new SqlDataAdapter("select city from  Main_Cat where sid='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladcity1(string x)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where city='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladcat1(string x)
        {
            da = new SqlDataAdapter("select item_cat from  Main_Cat where sid='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladsubcat2(string x)
        {
            da = new SqlDataAdapter("select item_subacat from  Main_Cat where sid='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Alladsearch(string x)
        {
            da = new SqlDataAdapter("select * from main_cat where item_cat like '" + x + "%'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Allads()
        {
            da = new SqlDataAdapter("select * from main_cat", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Detailadbind(string x)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where sid='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet bind(string a, string b)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where email ='" + a + "' and mobile='" + b + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet profile(string a, string b)
        {
            string c = "select * from Register where email='" + a + "' and pwd='" + b + "'";
            da = new SqlDataAdapter(c, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet registercount(string p)
        {
            da = new SqlDataAdapter(" select count(*) as count from Register where email='" + p + "' ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int Insertregister(SqlCommand cmd)
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                int x = cmd.ExecuteNonQuery();
                return x;
                con.Close();

            }
            catch (Exception ex)
            {
                int y = 0;
                return y;
            }
            finally
            {
            }
        }

        public DataSet updateregister(string email)
        {
            da = new SqlDataAdapter("select * from Register where email='" + email + "' ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updateststus(int id, int status)
        {
            string sql = "update Register set status='" + status + "' where rid=" + id + "";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
           int x= cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet Allads1()
        {
            da = new SqlDataAdapter("select top(6)* from main_cat where status=1 ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet Allads2()
        {
            da = new SqlDataAdapter("select top(6)* from main_cat where status=1 order by sid desc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet Allads3()
        {
            da = new SqlDataAdapter("select top(6)* from main_cat where status=1 order by sid asc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet history(string x)
        {
            da = new SqlDataAdapter("select sid,item_cat,item_title,posted_date from main_cat where email='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet findpwd(string x)
        {
            da = new SqlDataAdapter("select email,pwd from register where email='" + x + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet getdata(string prefixText)
        {
            da = new SqlDataAdapter("select statename from state where statename='"+prefixText+"'  and countryid=2", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updatepwd(string x, string p)
        {
            string sql = "update Register set pwd='" + p + "' where email='" + x + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            int x1 = cmd.ExecuteNonQuery();
            con.Close();
            return x1;
        }

        public DataSet search(string x)
        {
            da = new SqlDataAdapter(" select * from  Main_Cat where item_cat='"+x+"'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet search1(string x)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where state='"+x+"'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet search2(string x, string x1)
        {
            da = new SqlDataAdapter("select * from  Main_Cat where state='" + x + "' and item_cat='"+x1+"'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet users()
        {
            da = new SqlDataAdapter("Select  *,case  when  status  =  1 then  'Active'  else  'Deactive'  end  as  txtstatus from   Register order by rid desc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet finduser(string x)
        {
            da = new SqlDataAdapter("select count(*) as count from adminlogin where emailid='"+x+"'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int createuser(string uname, string fname, string pwd, string dis, string cont, string add, string mobile, string contact, string email, int status, string clientview, string clientupdate, string clientstatus, string clientdelete, string clientcreate, string adview, string adstatus, string addelete, string adcreate, string usview, string usemail, string usdelete, string feedview, string feedmail, string feeddelete, string supportview, string supportsolution, string supportdelete, string userview, string userupdate, string userstatus, string userdelete, string usercreate, string date)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@uname", uname));
                cmd.Parameters.Add(new SqlParameter("@fname", fname));
                cmd.Parameters.Add(new SqlParameter("@pwd", pwd));
                cmd.Parameters.Add(new SqlParameter("@dis", dis));
                cmd.Parameters.Add(new SqlParameter("@cont", cont));
                cmd.Parameters.Add(new SqlParameter("@add", add));
                cmd.Parameters.Add(new SqlParameter("@mobile", mobile));
                cmd.Parameters.Add(new SqlParameter("@contact", contact));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                cmd.Parameters.Add(new SqlParameter("@status", status));

                cmd.Parameters.Add(new SqlParameter("@clientview", clientview));
                cmd.Parameters.Add(new SqlParameter("@clientupdate", clientupdate));
                cmd.Parameters.Add(new SqlParameter("@clientstatus", clientstatus));
                cmd.Parameters.Add(new SqlParameter("@clientdelete", clientdelete));
                cmd.Parameters.Add(new SqlParameter("@clientcreate", clientcreate));

                cmd.Parameters.Add(new SqlParameter("@adview", adview));
                cmd.Parameters.Add(new SqlParameter("@adstatus", adstatus));
                cmd.Parameters.Add(new SqlParameter("@addelete", addelete));
                cmd.Parameters.Add(new SqlParameter("@adcreate", adcreate));

                cmd.Parameters.Add(new SqlParameter("@usview", usview));
                cmd.Parameters.Add(new SqlParameter("@usemail", usemail));
                cmd.Parameters.Add(new SqlParameter("@usdelete", usdelete));

                cmd.Parameters.Add(new SqlParameter("@feedview", feedview));
                cmd.Parameters.Add(new SqlParameter("@feedmail", feedmail));
                cmd.Parameters.Add(new SqlParameter("@feeddelete", feeddelete));

                cmd.Parameters.Add(new SqlParameter("@supportview", supportview));
                cmd.Parameters.Add(new SqlParameter("@supportsolution", supportsolution));
                cmd.Parameters.Add(new SqlParameter("@supportdelete", supportdelete));

                cmd.Parameters.Add(new SqlParameter("@userview", userview));
                cmd.Parameters.Add(new SqlParameter("@userupdate", userupdate));
                cmd.Parameters.Add(new SqlParameter("@userstatus", userstatus));
                cmd.Parameters.Add(new SqlParameter("@userdelete", userdelete));
                cmd.Parameters.Add(new SqlParameter("@usercreate", usercreate));
                cmd.Parameters.Add(new SqlParameter("@date", date));

                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            catch (Exception ex)
            {
                int x;
                string script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
                return x = 0;
            }
        }

        public DataSet allusers()
        {
            da = new SqlDataAdapter("select *,case  when  status  =  1 then  'Active'  else  'Deactive'  end  as  txtstatus  from adminlogin", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet verifyuser(string type, string contry, string user, string pwd)
        {
            da = new SqlDataAdapter("Select *  from adminlogin where usertype='" + type + "' and country='" + contry + "' and username='" + user+ "' and password='" +pwd + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet permisson(string type, string user)
        {
            string admin = "Select * from adminlogin where usertype='" + type + "' and username='" + user + "'";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet findone(int listid)
        {
            string admin = "Select  * from  adminlogin where id=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updateuser(int id,string a, string b, string c, string d, string e1, string f, string g, string h, string clientview1, string clientupdate1, string clientstatus1, string clientdelete1, string clientcreate1, string adview1, string adstatus1, string addelete1, string adcreate1, string usview1, string usemail1, string usdelete1, string feedview1, string feedmail1, string feeddelete1, string supportview1, string supportsolution1, string supportdelete1, string userview1, string userupdate1, string userstatus1, string userdelete1, string usercreate1)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@id", id));

                cmd.Parameters.Add(new SqlParameter("@uname", b));
                cmd.Parameters.Add(new SqlParameter("@fname", a));
                cmd.Parameters.Add(new SqlParameter("@pwd", g));
                cmd.Parameters.Add(new SqlParameter("@dis", c));
                cmd.Parameters.Add(new SqlParameter("@cont", d));
                cmd.Parameters.Add(new SqlParameter("@add", e1));
                cmd.Parameters.Add(new SqlParameter("@mobile", f));
                cmd.Parameters.Add(new SqlParameter("@email", h));

                cmd.Parameters.Add(new SqlParameter("@clientview", clientview1));
                cmd.Parameters.Add(new SqlParameter("@clientupdate", clientupdate1));
                cmd.Parameters.Add(new SqlParameter("@clientstatus", clientstatus1));
                cmd.Parameters.Add(new SqlParameter("@clientdelete", clientdelete1));
                cmd.Parameters.Add(new SqlParameter("@clientcreate", clientcreate1));

                cmd.Parameters.Add(new SqlParameter("@adview", adview1));
                cmd.Parameters.Add(new SqlParameter("@adstatus", adstatus1));
                cmd.Parameters.Add(new SqlParameter("@addelete", addelete1));
                cmd.Parameters.Add(new SqlParameter("@adcreate", adcreate1));

                cmd.Parameters.Add(new SqlParameter("@usview", usview1));
                cmd.Parameters.Add(new SqlParameter("@usemail", usemail1));
                cmd.Parameters.Add(new SqlParameter("@usdelete", usdelete1));

                cmd.Parameters.Add(new SqlParameter("@feedview", feedview1));
                cmd.Parameters.Add(new SqlParameter("@feedmail", feedmail1));
                cmd.Parameters.Add(new SqlParameter("@feeddelete", feeddelete1));

                cmd.Parameters.Add(new SqlParameter("@supportview", supportview1));
                cmd.Parameters.Add(new SqlParameter("@supportsolution", supportsolution1));
                cmd.Parameters.Add(new SqlParameter("@supportdelete", supportdelete1));

                cmd.Parameters.Add(new SqlParameter("@userview", userview1));
                cmd.Parameters.Add(new SqlParameter("@userupdate", userupdate1));
                cmd.Parameters.Add(new SqlParameter("@userstatus", userstatus1));
                cmd.Parameters.Add(new SqlParameter("@userdelete", userdelete1));
                cmd.Parameters.Add(new SqlParameter("@usercreate", usercreate1));

                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            catch (Exception ex)
            {
                int x;
                string script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
                return x = 0;
            }
        }

        public int userstatus(int listid)
        {
            string admin = "Select  * from  adminlogin where id=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
            {
                con.Open();
                cmd = new SqlCommand("update adminlogin set status=0 where id="+listid+"", con);
                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            if (ds.Tables[0].Rows[0]["status"].ToString() == "0")
            {
                con.Open();
                cmd = new SqlCommand("update adminlogin set status=1 where id=" + listid + "", con);
                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            else
            {
                int x = 0;
                return x;
            }
        }

        public int deleteuser(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete adminlogin where id=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet findclient(int listid)
        {
            string admin = "Select  * from  register where rid=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updateclient(SqlCommand cmd)
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                int x = cmd.ExecuteNonQuery();
                con.Close();

                return x;
            }
            catch (Exception ex)
            {
                int y = 0;
                return y;
            }
            finally
            {
            }
        }

        public int statusclient(int listid)
        {
            string admin = "Select  * from  register where rid=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
            {
                con.Open();
                cmd = new SqlCommand("update register set status=0 where rid=" + listid + "", con);
                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            if (ds.Tables[0].Rows[0]["status"].ToString() == "0")
            {
                con.Open();
                cmd = new SqlCommand("update register set status=1 where rid=" + listid + "", con);
                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            else
            {
                int x = 0;
                return x;
            }
        }

        public int deleteclient(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete register where rid=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet findEmail(int listid)
        {
            string admin = "Select  * from  contactus where cid=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int deletecontct(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete contactus where cid=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet contact()
        {
            string admin = "Select  * from  contactus";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet feed()
        {
            string admin = "Select  * from  feedback";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet feedemail(int listid)
        {
            string admin = "Select  * from  feedback where fid=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int deletefeed(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete feedback where fid=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet ad()
        {
            string admin = "Select  *,case  when  status  =  1 then  'Active'  else  'Deactive'  end  as  txtstatus from  Main_Cat";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int statusad(int listid)
        {
            string admin = "Select  * from  main_cat where sid=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
            {
                con.Open();
                cmd = new SqlCommand("update main_cat set status=0 where sid=" + listid + "", con);
                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            if (ds.Tables[0].Rows[0]["status"].ToString() == "0")
            {
                con.Open();
                cmd = new SqlCommand("update main_cat set status=1 where sid=" + listid + "", con);
                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            else
            {
                int x = 0;
                return x;
            }
        }

        public int deletead(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete main_cat  where sid=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet findad(int listid)
        {
            string admin = "Select  * from  Main_Cat where sid='"+listid+"'";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet statusad1(int listid)
        {
            string admin = "Select  * from  main_cat where sid=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;

        }

        public DataSet findadmin()
        {

            string admin = "select *  from adminlogin  where usertype='Admin'";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet finduserstatus(int listid)
        {
            string admin = "Select  * from  adminlogin where id=" + listid + "";
            da = new SqlDataAdapter(admin, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;

        }

        public void insert_exception(Exception ex, string excep_page)
        {
            string excep1 = ex.StackTrace.ToString();
            string line = excep1.Substring(excep1.LastIndexOf("line"), (excep1.Length - excep1.LastIndexOf("line")));
            string exception_msg = ex.Message;
            DateTime date = Convert.ToDateTime(System.DateTime.Now.ToString());
            string excep_status = "0";
            string respo = "0";

            SqlCommand cmd = new SqlCommand("spexception", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Excep_desc", exception_msg);
            cmd.Parameters.AddWithValue("@Excep_page", excep_page);
            cmd.Parameters.AddWithValue("@Linenumber", line);
            cmd.Parameters.AddWithValue("@Excep_status", excep_status);
            cmd.Parameters.AddWithValue("@Excep_postdate", date);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public int deal(string a, string b, string c, string d, string e1, string f, string g, int h, string i)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insertdeal", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@seller", a));
                cmd.Parameters.Add(new SqlParameter("@semail", b));
                cmd.Parameters.Add(new SqlParameter("@smobile", c));
                cmd.Parameters.Add(new SqlParameter("@title", d));
                cmd.Parameters.Add(new SqlParameter("@bemail", e1));
                cmd.Parameters.Add(new SqlParameter("@bmobile", f));
                cmd.Parameters.Add(new SqlParameter("@comment", g));
                cmd.Parameters.Add(new SqlParameter("@status", h));
                cmd.Parameters.Add(new SqlParameter("@date", i));

                int x = cmd.ExecuteNonQuery();
                con.Close();
                return x;
            }
            catch (Exception ex)
            {
                int x;
                return x = 0;
            }
        }

        public DataSet Deals1()
        {
            da = new SqlDataAdapter("select *,case  when  status  =  1 then  'Sent'  else  'Send Mail'  end  as  mail from  deals ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int deletedeals(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete deals  where did=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet emaildeal(int listid)
        {
            da = new SqlDataAdapter("select * from  deals where did='"+listid+"' ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updatedeals(int s)
        {
            con.Open();
            cmd = new SqlCommand("update deals  set status=1 where did=" + s + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet support1()
        {
            da = new SqlDataAdapter("select *,case  when  Excep_Status  =  1 then  'Resolved'  else  'Error'  end  as  mail from  sellone_exceptions ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int deletesupport(int listid)
        {
            con.Open();
            cmd = new SqlCommand("delete sellone_exceptions  where Excep_id=" + listid + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }

        public DataSet solutionsupport(int listid)
        {
            da = new SqlDataAdapter("select * from  sellone_exceptions where Excep_id='" + listid + "' ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet fineassigner(string s)
        {
           da = new SqlDataAdapter("select emailid from  adminlogin where usertype='" + s + "' ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updatesupport (string s2, int s1)
        {
            con.Open();
            cmd = new SqlCommand("update sellone_exceptions  set Excep_status=1, responce='" + s2 + "' where Excep_id=" + s1 + "", con);
            int x = cmd.ExecuteNonQuery();
            con.Close();
            return x;
        }
    }
}
