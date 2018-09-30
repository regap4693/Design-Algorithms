using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Collections;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
        Label1.Visible = false;
        Label2.Visible = false;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {


       // String date = Calendar1.SelectedDate.ToString();
        TextBox2.Text = Calendar1.SelectedDate.ToShortDateString();
       // DateTime myDate = DateTime.ParseExact(date, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        if (Calendar1.SelectedDate < DateTime.Today)
        {
            Label1.Text = "* Enter Valid Date";
            TextBox2.Text = "";
            Label1.Visible = true;


        }
        else
            Label1.Visible = false;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        TextBox3.Text = String.Format(Calendar2.SelectedDate.ToShortDateString());
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        BookingDesc.Text = "";
        BookingECC.Text = "";
        BookingEcontact.Text = "";
        BookingEdeptDropDownList.SelectedValue = " " ;
        BookingEemail.Text = "";
        BookingPNo.Text = "";
        BookingEname.Text = "";
        People.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        Starttime.Text = "";
        Endtime.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        
            OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
            conn.Open();
            OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_invBooking_dtl] (ib_inv_id,ib_bookingPNo,ib_bookingEname,ib_bookingEemail,ib_bookingEcontact,ib_bookingEdept,ib_bookingECC,ib_purposeId,ib_chairId,ib_noOfPeople,ib_costId,ib_bookingDesc,ib_startDate,ib_startTime,ib_endDate,ib_endTime,ib_createdBy,ib_createdOn,ib_ModifiedBy) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", conn);
            olcom.Parameters.AddWithValue("@a1", Master.Inv);
            olcom.Parameters.AddWithValue("@a2", Convert.ToString(Session["User"]));
            olcom.Parameters.AddWithValue("@a3", BookingEname.Text);
            olcom.Parameters.AddWithValue("@a4", BookingEemail.Text);
            olcom.Parameters.AddWithValue("@a5", BookingEcontact.Text);
            olcom.Parameters.AddWithValue("@a6", BookingEdeptDropDownList.SelectedValue);
            olcom.Parameters.AddWithValue("@a7", BookingECC.Text);
            olcom.Parameters.AddWithValue("@a8", DropDownList1.SelectedValue);
            olcom.Parameters.AddWithValue("@a9", DropDownList2.SelectedValue);
            olcom.Parameters.AddWithValue("@a10", People.Text);

            OleDbCommand olcom11 = new OleDbCommand("Select ic_id from [Inventory].[dbo].[t_im_cost_mst] where ic_res_em_uid=?", conn);
            olcom11.Parameters.AddWithValue("@a1", Master.Inv);
            DataSet ds1 = new DataSet();
            OleDbDataAdapter oadap1 = new OleDbDataAdapter(olcom11);
            oadap1.Fill(ds1, "[INVENTORY].[dbo].[t_im_cost_mst]");

            olcom.Parameters.AddWithValue("@a11", Convert.ToString((ds1.Tables[0].Rows[0][0])));
            olcom.Parameters.AddWithValue("@a12", BookingDesc.Text);
            olcom.Parameters.AddWithValue("@a13", Calendar1.SelectedDate);
            olcom.Parameters.AddWithValue("@a14", Starttime.Text);
            olcom.Parameters.AddWithValue("@a15", Calendar2.SelectedDate);
            olcom.Parameters.AddWithValue("@a16", Endtime.Text);
            olcom.Parameters.AddWithValue("@a17", Convert.ToString(Session["User"]));
            olcom.Parameters.AddWithValue("@a18", DateTime.Now);
            olcom.Parameters.AddWithValue("@a19", Convert.ToString(Session["User"]));

            olcom.ExecuteNonQuery();


            OleDbCommand com = new OleDbCommand("Select ib_bookingID from [Inventory].[dbo].[t_im_invBooking_dtl] where ib_inv_id=? and ib_bookingPNo=? and ib_bookingEname=? and ib_bookingEemail=? and ib_bookingEcontact=? and ib_bookingEdept=? and ib_bookingECC=? and ib_purposeId=? and ib_chairId=? and ib_noOfPeople=? and ib_costId=? and ib_startDate=? and ib_startTime=? and ib_endDate=? and ib_endTime=? and ib_createdBy=? and ib_ModifiedBy=?", conn);


            com.Parameters.AddWithValue("@a1", Master.Inv);
            com.Parameters.AddWithValue("@a2", Convert.ToString(Session["User"]));
            com.Parameters.AddWithValue("@a3", BookingEname.Text);
            com.Parameters.AddWithValue("@a4", BookingEemail.Text);
            com.Parameters.AddWithValue("@a5", BookingEcontact.Text);
            com.Parameters.AddWithValue("@a6", BookingEdeptDropDownList.SelectedValue);
            com.Parameters.AddWithValue("@a7", BookingECC.Text);
            com.Parameters.AddWithValue("@a8", DropDownList1.SelectedValue);
            com.Parameters.AddWithValue("@a9", DropDownList2.SelectedValue);
            com.Parameters.AddWithValue("@a10", People.Text);

            OleDbCommand olcom12 = new OleDbCommand("Select ic_id from [Inventory].[dbo].[t_im_cost_mst] where ic_res_em_uid=?", conn);
            olcom12.Parameters.AddWithValue("@a1", Master.Inv);
            DataSet ds2 = new DataSet();
            OleDbDataAdapter oadap2 = new OleDbDataAdapter(olcom12);
            oadap2.Fill(ds2, "[INVENTORY].[dbo].[t_im_cost_mst]");

            com.Parameters.AddWithValue("@a11", Convert.ToString((ds2.Tables[0].Rows[0][0])));
            //com.Parameters.AddWithValue("@a12", BookingDesc.Text);
            com.Parameters.AddWithValue("@a12", Calendar1.SelectedDate);
            com.Parameters.AddWithValue("@a13", Starttime.Text);
            com.Parameters.AddWithValue("@a14", Calendar2.SelectedDate);
            com.Parameters.AddWithValue("@a15", Endtime.Text);
            com.Parameters.AddWithValue("@a16", Convert.ToString(Session["User"]));

            com.Parameters.AddWithValue("@a17", Convert.ToString(Session["User"]));

            DataSet ds3 = new DataSet();
            OleDbDataAdapter oadap3 = new OleDbDataAdapter(com);
            oadap3.Fill(ds3, "[INVENTORY].[dbo].[t_im_invBooking_dtl]");

            Master.bid = Convert.ToString(ds3.Tables[0].Rows[0][0]);
            //Label3.Text = Master.bid;
            conn.Close();
            Server.Transfer("BookDone.aspx", true);
        
    }

}