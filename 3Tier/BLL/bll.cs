using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class bll
    {
        dal dl = new dal();
        DataSet ds = new DataSet();
        int cu;

        public DataSet binddata()
        {
            ds = dl.binddata();
            return ds;
        }

        public DataSet bind(string s)
        {
            ds = dl.bind(s);
            return ds;
        }

        public DataSet bindcities(string pre, int id)
        {
            ds = dl.bindcities(pre, id);
            return ds;
        }

        public DataSet getcountry()
        {
            ds = dl.getcountry();
            return ds;
        }

        public DataSet getstates(string y)
        {
            ds = dl.getstates(y);
            return ds;
        }

        public DataSet getcities2(string z)
        {
            ds = dl.getcities2(z);
            return ds;
        }

        public int contactus(string Fname, string Email, string Address, string Country, string States, string City, string Zipcode, string Phonenumber, string Comments,string date)
        {
            cu = dl.contactus(Fname, Email, Address, Country, States, City, Zipcode, Phonenumber, Comments,date);
            return cu;
        }

        public int insertfb(string fname, string femail, string fsub, string fmsg, string contry1, string state1, string city1)
        {
            cu = dl.insertfb(fname, femail, fsub, fmsg, contry1, state1, city1);
            return cu;
        }

        public DataSet bind()
        {
            ds = dl.bind();
            return ds;
        }

        public int InsertUpdateData(System.Data.SqlClient.SqlCommand cmd)
        {
            cu = dl.InsertUpdateData(cmd);
            return cu;
        }



        public DataSet bind1()
        {
            ds = dl.bind1();
            return ds;
        }

        public int bind2(string x1, string x)
        {
            cu = dl.bind2(x1, x);
            return cu;

        }

        public DataSet bind3(string s)
        {
            ds = dl.bind3(s);
            return ds;
        }



        public DataSet bind4()
        {
            ds = dl.bind4();
            return ds;
        }

        public DataSet binddata(int catid)
        {
            ds = dl.binddata(catid);
            return ds;
        }

        public DataSet binddata(string a2)
        {
            ds = dl.binddata(a2);
            return ds;
        }

        public DataSet Alladsubcat(string x)
        {
            ds = dl.Alladsubcat(x);
            return ds;
        }

        public DataSet Alladsubcat1(string x)
        {
            ds = dl.Alladsubcat1(x);
            return ds;
        }

        public DataSet Alladcat(string x)
        {
            ds = dl.Alladcat(x);
            return ds;
        }

        public DataSet Alladadd(string x)
        {
            ds = dl.Alladadd(x);
            return ds;
        }

        public DataSet Alladadd1(string x)
        {
            ds = dl.Alladadd1(x);
            return ds;
        }

        public DataSet Alladcity(string x)
        {
            ds = dl.Alladcity(x);
            return ds;
        }

        public DataSet Alladcity1(string x)
        {
            ds = dl.Alladcity1(x);
            return ds;
        }

        public DataSet Alladcat1(string x)
        {
            ds = dl.Alladcat1(x);
            return ds;
        }

        public DataSet Alladsubcat2(string x)
        {
            ds = dl.Alladsubcat2(x);
            return ds;
        }

        public DataSet Alladsearch(string x)
        {
            ds = dl.Alladsearch(x);
            return ds;
        }

        public DataSet Allads()
        {
            ds = dl.Allads();
            return ds;
        }

        public DataSet Detailadbind(string x)
        {
            ds = dl.Detailadbind(x);
            return ds;
        }

        public DataSet bind(string a, string b)
        {
            ds = dl.bind(a,b);
            return ds;
        }

        public DataSet profile(string a, string b)
        {
            ds = dl.profile(a, b);
            return ds;
        }

        public DataSet registercount(string p)
        {
            ds = dl.registercount(p);
            return ds;
        }

        public int Insertregister(System.Data.SqlClient.SqlCommand cmd)
        {
            cu = dl.Insertregister(cmd);
            return cu;
        }

        public DataSet updateregister(string email)
        {
            ds = dl.updateregister(email);
            return ds;
        }

        public int updateststus(int id, int status)
        {
            cu = dl.updateststus(id,status);
            return cu;
        }


        public DataSet Allads1()
        {
            ds = dl.Allads1();
            return ds;
        }

        public DataSet Allads2()
        {
            ds = dl.Allads2();
            return ds;
        }
        public DataSet Allads3()
        {
            ds = dl.Allads3();
            return ds;
        }



        public DataSet history(string x)
        {
            ds = dl.history(x);
            return ds;
        }

        public DataSet findpwd(string x)
        {
            ds = dl.findpwd(x);
            return ds;
        }

        public DataSet getdata(string prefixText)
        {
            ds=dl.getdata(prefixText);
            return ds;
        }

        public int updatepwd(string x, string p)
        {
            cu = dl.updatepwd(x, p);
            return cu;
        }

        public DataSet search(string x)
        {
            ds = dl.search(x);
            return ds;
        }

        public DataSet search1(string x)
        {
            ds = dl.search1(x);
            return ds;
        }

        public DataSet search2(string x, string x1)
        {
            ds = dl.search2(x,x1);
            return ds;
        }

        public DataSet users()
        {
            ds = dl.users();
            return ds;
        }

        public DataSet finduser(string x)
        {
            ds = dl.finduser(x);
            return ds;
        }

        public int createuser(string uname, string fname, string pwd, string dis, string cont, string add, string mobile, string contact, string email, int status, string clientview, string clientupdate, string clientstatus, string clientdelete, string clientcreate, string adview, string adstatus, string addelete, string adcreate, string usview, string usemail, string usdelete, string feedview, string feedmail, string feeddelete, string supportview, string supportsolution, string supportdelete, string userview, string userupdate, string userstatus, string userdelete, string usercreate,string date)
        {
            cu = dl.createuser(uname, fname, pwd, dis, cont, add, mobile, contact, email, status, clientview, clientupdate, clientstatus, clientdelete, clientcreate, adview, adstatus, addelete, adcreate, usview, usemail, usdelete, feedview, feedmail, feeddelete, supportview, supportsolution, supportdelete, userview, userupdate, userstatus, userdelete, usercreate,date);
            return cu;
        }

        public DataSet allusers()
        {
            ds = dl.allusers();
            return ds;
        }

        public DataSet verifyuser(string type, string contry, string user, string pwd)
        {
            ds = dl.verifyuser(type, contry, user, pwd);
            return ds;
        }

        public DataSet permisson(string type, string user)
        {
            ds = dl.permisson(type, user);
            return ds;
        }

        public DataSet findone(int listid)
        {
            ds = dl.findone(listid);
            return ds;
        }

        public int updateuser(int id,string a, string b, string c, string d, string e1, string f, string g, string h, string clientview1, string clientupdate1, string clientstatus1, string clientdelete1, string clientcreate1, string adview1, string adstatus1, string addelete1, string adcreate1, string usview1, string usemail1, string usdelete1, string feedview1, string feedmail1, string feeddelete1, string supportview1, string supportsolution1, string supportdelete1, string userview1, string userupdate1, string userstatus1, string userdelete1, string usercreate1)
        {
            cu = dl.updateuser(id,a, b, c, d, e1, f, g, h, clientview1, clientupdate1, clientstatus1, clientdelete1, clientcreate1, adview1, adstatus1, addelete1, adcreate1, usview1, usemail1, usdelete1, feedview1, feedmail1, feeddelete1, supportview1, supportsolution1, supportdelete1, userview1, userupdate1, userstatus1, userdelete1, usercreate1);
            return cu;
        }

        public int userstatus(int listid)
        {
            cu = dl.userstatus(listid);
            return cu;
        }

        public int deleteuser(int listid)
        {
            cu = dl.deleteuser(listid);
            return cu;
        }

        public DataSet findclient(int listid)
        {
            ds = dl.findclient(listid);
            return ds;
        }

        public int updateclient(System.Data.SqlClient.SqlCommand cmd)
        {
            cu = dl.updateclient(cmd);
            return cu;
        }



        public int statusclient(int listid)
        {
            cu = dl.statusclient(listid);
            return cu;
        }

        public int deleteclient(int listid)
        {
            cu = dl.deleteclient(listid);
            return cu;
        }

        public DataSet findEmail(int listid)
        {
            ds = dl.findEmail(listid);
            return ds;
        }

        public int deletecontct(int listid)
        {
            cu = dl.deletecontct(listid);
            return cu;
        }

        public DataSet contact()
        {

            ds = dl.contact();
            return ds;
        }

        public DataSet feed()
        {
            ds = dl.feed();
            return ds;
        }

        public DataSet feedemail(int listid)
        {
            ds = dl.feedemail(listid);
            return ds;
        }

        public int deletefeed(int listid)
        {
            cu = dl.deletefeed(listid);
            return cu;
        }

        public DataSet ad()
        {

            ds = dl.ad();
            return ds;
        }

        public int statusad(int listid)
        {
            cu = dl.statusad(listid);
            return cu;
        }

        public int deletead(int listid)
        {
            cu = dl.deletead(listid);
            return cu;
        }

        public DataSet findad(int listid)
        {
            ds = dl.findad(listid);
            return ds;
        }

        public DataSet statusad1(int listid)
        {
            ds = dl.statusad1(listid);
            return ds;
        }

        public DataSet findadmin()
        {
            ds = dl.findadmin();
            return ds;
        }

        public DataSet finduserstatus(int listid)
        {
            ds = dl.finduserstatus(listid);
            return ds;
        }

        public void insert_exception(Exception ex, string excep_page)
        {
            dl.insert_exception(ex, excep_page);
        }

        public int deal(string a, string b, string c, string d, string e1, string f, string g, int h, string i)
        {
            cu = dl.deal(a,b,c,d,e1,f,g,h,i);
            return cu;
        }

        public DataSet Deals1()
        {
            ds = dl.Deals1();
            return ds;
        }

        public int deletedeals(int listid)
        {
            cu = dl.deletedeals(listid);
            return cu;
        }

        public DataSet emaildeal(int listid)
        {
            ds = dl.emaildeal(listid);
            return ds;
        }

        public int updatedeals(int s)
        {
            cu = dl.updatedeals(s);
            return cu;
        }

        public DataSet support1()
        {
            ds = dl.support1();
            return ds;
        }

        public int deletesupport(int listid)
        {
            cu = dl.deletesupport(listid);
            return cu;
        }

        public DataSet solutionsupport(int listid)
        {
            ds = dl.solutionsupport(listid);
            return ds;
        }

        public DataSet fineassigner(string s)
        {
            ds = dl.fineassigner(s);
            return ds;
        }

        //public int deletesupport(int listid)
        //{
        //    cu = dl.deletesupport(listid);
        //    return cu;
        //}

        public int updatesupport( string s2, int s1)
        {
            cu = dl.updatesupport(s2,s1);
            return cu;
        }
    }
}
