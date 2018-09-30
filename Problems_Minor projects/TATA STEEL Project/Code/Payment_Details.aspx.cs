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

public partial class Payment_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Master.bid;
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        
        TextBox2.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox15.Text = "";
    }
    protected void Submit_Click1(object sender, EventArgs e)
    {
        OleDbConnection conn1 = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn1.Open();
        OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_payment_dtl] (pay_seq,pay_type,pay_payer,pay_payee,pay_signatory,pay_mode,pay_payDate,pay_paymentDate,pay_payNumber,pay_amount,pay_fineAmount,pay_description,pay_voucherNo,pay_voucherDate,pay_SAPNo,pay_SAPDate,pay_isPrinted,pay_isEmailed,py_createdBy,py_createdOn,py_ModifiedBy) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", conn1);
        olcom.Parameters.AddWithValue("@a1", TextBox2.Text);
        olcom.Parameters.AddWithValue("@a2", DropDownList4.SelectedValue);
        olcom.Parameters.AddWithValue("@a3", TextBox4.Text);
        olcom.Parameters.AddWithValue("@a4", TextBox5.Text);
        olcom.Parameters.AddWithValue("@a5", TextBox6.Text);
        olcom.Parameters.AddWithValue("@a6", DropDownList3.SelectedValue);
        olcom.Parameters.AddWithValue("@a7", Calendar1.SelectedDate);
        olcom.Parameters.AddWithValue("@a8", Calendar2.SelectedDate);
        olcom.Parameters.AddWithValue("@a9", TextBox9.Text);
        olcom.Parameters.AddWithValue("@a10", TextBox10.Text);
        olcom.Parameters.AddWithValue("@a11", TextBox11.Text);
        olcom.Parameters.AddWithValue("@a12", TextBox12.Text);
        olcom.Parameters.AddWithValue("@a13", TextBox13.Text);
        olcom.Parameters.AddWithValue("@a14", Calendar3.SelectedDate);
        olcom.Parameters.AddWithValue("@a15", TextBox15.Text);
        olcom.Parameters.AddWithValue("@a16", Calendar4.SelectedDate);
        olcom.Parameters.AddWithValue("@a17", RadioButtonList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a18", RadioButtonList2.SelectedValue);
        olcom.Parameters.AddWithValue("@a19", Convert.ToString(Session["User"]));
        olcom.Parameters.AddWithValue("@a20", DateTime.Now);
        olcom.Parameters.AddWithValue("@a21", Convert.ToString(Session["User"]));

        olcom.ExecuteNonQuery();

        OleDbCommand com = new OleDbCommand("Select pay_id from [Inventory].[dbo].[t_im_payment_dtl] where pay_seq=? and pay_type=? and pay_payer=? and pay_payee=? and pay_signatory=? and pay_mode=? and pay_payDate=? and pay_paymentDate=? and pay_payNumber=? and pay_amount=? and pay_fineAmount=? and pay_description=? and pay_voucherNo=? and pay_voucherDate=? and pay_SAPNo=? and pay_SAPDate=? and pay_isPrinted=? and pay_isEmailed=?", conn1);
        com.Parameters.AddWithValue("@a1", TextBox2.Text);
        com.Parameters.AddWithValue("@a2", DropDownList4.SelectedValue);
        com.Parameters.AddWithValue("@a3", TextBox4.Text);
        com.Parameters.AddWithValue("@a4", TextBox5.Text);
        com.Parameters.AddWithValue("@a5", TextBox6.Text);
        com.Parameters.AddWithValue("@a6", DropDownList3.SelectedValue);
        com.Parameters.AddWithValue("@a7", Calendar1.SelectedDate);
        com.Parameters.AddWithValue("@a8", Calendar2.SelectedDate);
        com.Parameters.AddWithValue("@a9", TextBox9.Text);
        com.Parameters.AddWithValue("@a10", TextBox10.Text);
        com.Parameters.AddWithValue("@a11", TextBox11.Text);
        com.Parameters.AddWithValue("@a12", TextBox12.Text);
        com.Parameters.AddWithValue("@a13", TextBox13.Text);
        com.Parameters.AddWithValue("@a14", Calendar3.SelectedDate);
        com.Parameters.AddWithValue("@a15", TextBox15.Text);
        com.Parameters.AddWithValue("@a16", Calendar4.SelectedDate);
        com.Parameters.AddWithValue("@a17", RadioButtonList1.SelectedValue);
        com.Parameters.AddWithValue("@a18", RadioButtonList2.SelectedValue);
        OleDbDataAdapter oadap = new OleDbDataAdapter(com);
        DataSet ds = new DataSet();
        oadap.Fill(ds, "[INVENTORY].[dbo].[t_im_payment_dtl]");
        Master.pid=Convert.ToString(ds.Tables[0].Rows[0][0]);
        
        OleDbCommand olcom1 = new OleDbCommand("Update [Inventory].[dbo].[t_im_invBooking_dtl] set ib_payment=? where ib_bookingID=?", conn1);
        olcom1.Parameters.AddWithValue("@a1", Master.pid);
        olcom1.Parameters.AddWithValue("@a2", Master.bid);


        olcom1.ExecuteNonQuery();




        //int n1 = com.ExecuteNonQuery();
        conn1.Close();
        Server.Transfer("ShowPayDtl.aspx", true);
    }
    protected void Reset_Click(object sender, EventArgs e)
    {
       
        TextBox2.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox15.Text = "";
        DropDownList3.SelectedValue = " ";
        DropDownList4.SelectedValue = " ";
        foreach (ListItem item in RadioButtonList1.Items)
        {
            if (item.Selected)
                RadioButtonList1.SelectedItem.Selected = false;
        }
        foreach (ListItem item in RadioButtonList2.Items)
        {
            if (item.Selected)
                RadioButtonList2.SelectedItem.Selected = false;
        }

    }


}



