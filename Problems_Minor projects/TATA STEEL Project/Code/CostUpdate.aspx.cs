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

public partial class CostUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedValue = " ";
        DropDownList2.SelectedValue = " ";
        DropDownList3.SelectedValue = " ";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        foreach (ListItem item in ListBox1.Items)
        {
            if (item.Selected)
                ListBox1.SelectedItem.Selected = false;
        }
        TextBox10.Text = "";
        TextBox11.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn.Open();
        OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_cost_mst] (ic_res_em_uid,ic_costType,ic_unit,ic_costTaxable,ic_costNonTaxable,ic_cancellationCharge,ic_cautionDeposit,ic_bookingFee,ic_serviceTax,ic_eduCess,ic_otherTax,ic_paymentMode,ic_valid,ic_isDeleted,ic_createdBy,ic_createdOn,ic_ModifiedBy) values (?,?,?,?,?,?,?,?,?,?,?,?,'True','False',?,?,?)", conn);
        olcom.Parameters.AddWithValue("@a1", DropDownList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a2", DropDownList2.SelectedValue);
        olcom.Parameters.AddWithValue("@a3", DropDownList3.SelectedValue);
        olcom.Parameters.AddWithValue("@a4", TextBox2.Text);
        olcom.Parameters.AddWithValue("@a5", TextBox3.Text);
        olcom.Parameters.AddWithValue("@a6", TextBox4.Text);
        olcom.Parameters.AddWithValue("@a7", TextBox5.Text);
        olcom.Parameters.AddWithValue("@a8", TextBox6.Text);
        olcom.Parameters.AddWithValue("@a9", TextBox7.Text);
        olcom.Parameters.AddWithValue("@a10", TextBox8.Text);
        olcom.Parameters.AddWithValue("@a11", TextBox9.Text);

        var selectedValues = (from item in ListBox1.Items.Cast<ListItem>() where item.Selected select item.Value).ToArray();
        var selectedValuesJoined = string.Join(",", selectedValues);

        olcom.Parameters.AddWithValue("@a12", selectedValuesJoined);
        olcom.Parameters.AddWithValue("@a15", Convert.ToString(Session["User"]));
        olcom.Parameters.AddWithValue("@a16", DateTime.Now);
        olcom.Parameters.AddWithValue("@a17", Convert.ToString(Session["User"]));
        OleDbCommand olcom1 = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_costType_mst] (cst_name,cst_desc,cst_valid,cst_isDeleted,cst_createdBy,cst_createdOn,cst_ModifiedBy) values (?,?,'True','False',?,?,?)", conn);
        olcom1.Parameters.AddWithValue("@a1", TextBox11.Text);
        olcom1.Parameters.AddWithValue("@a2", TextBox10.Text);
        olcom1.Parameters.AddWithValue("@a5", Convert.ToString(Session["User"]) );
        olcom1.Parameters.AddWithValue("@a6", DateTime.Now); 
        olcom1.Parameters.AddWithValue("@a7", Convert.ToString(Session["User"]) );


    }
}