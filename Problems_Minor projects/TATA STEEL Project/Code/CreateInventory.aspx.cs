using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Collections;

using System.Data.SqlClient;

public partial class CreateInventory: System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Convert.ToString(Session["Username"]);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        var selectedValues =(from item in CheckBoxList1.Items.Cast<ListItem>() where item.Selected select item.Value).ToArray();
        var selectedValuesJoined = string.Join(",", selectedValues);
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn.Open();
        OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_inventory_mst] ([inv_uid],[inv_name],[inv_desc],[inv_capacity],[inv_deptId],[inv_qtyAvailable],[inv_qtyConsumed],[inv_qtyReserve],[inv_costAssociated],[inv_approverId1],[inv_availability],[inv_valid],[inv_bookingRestriction],inv_isDeleted,inv_createdBy,inv_createdOn) values (?,?,?,?,?,?,?,?,?,?,?,?,?,'false',?,?)", conn);
        olcom.Parameters.AddWithValue("@a0", '*');    
        olcom.Parameters.AddWithValue("@a2", InameTextBox.Text);
        olcom.Parameters.AddWithValue("@a3", IdescTextBox.Text);
        olcom.Parameters.AddWithValue("@a4", IcapacityTextBox.Text);
        olcom.Parameters.AddWithValue("@a5", DropDownList3.SelectedValue);
        olcom.Parameters.AddWithValue("@a6", QtyAvailTextBox.Text);
        olcom.Parameters.AddWithValue("@a7", QtyConsumedTextBox.Text);
        olcom.Parameters.AddWithValue("@a8", QtyReservedTextBox.Text);
        olcom.Parameters.AddWithValue("@a9", RadioButtonList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a10", AppIDTextBox.Text);
        olcom.Parameters.AddWithValue("@a11", selectedValuesJoined);
        olcom.Parameters.AddWithValue("@a12", RadioButtonList2.SelectedValue);
        olcom.Parameters.AddWithValue("@a13", BRestrictionTextBox.Text);
        olcom.Parameters.AddWithValue("@a14", Convert.ToString(Session["User"]));
        olcom.Parameters.AddWithValue("@a15", DateTime.Now);
        olcom.ExecuteNonQuery();
        conn.Close();
        SqlConnection sqlConnection1 = new SqlConnection("Server=HP-HP;Database=Inventory;User Id=sa;Password=root;");
        SqlCommand cmd = new SqlCommand();

        Object returnValue;

        cmd.CommandText = "SELECT inv_id FROM [Inventory].[dbo].[t_im_inventory_mst] where inv_uid='*'";

        cmd.CommandType = CommandType.Text;
        cmd.Connection = sqlConnection1;

        sqlConnection1.Open();

        returnValue = cmd.ExecuteScalar();
        cmd.ExecuteNonQuery();

        sqlConnection1.Close();

        OleDbConnection con = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        con.Open();
        OleDbCommand olcon = new OleDbCommand("UPDATE [Inventory].[dbo].[t_im_inventory_mst] SET inv_uid = (?) WHERE inv_uid= '*'", con);
        olcon.Parameters.AddWithValue("@a1", DropDownList3.SelectedValue + '_' + returnValue);

        olcon.ExecuteNonQuery();
        con.Close();
        Server.Transfer("InventoryCreated.aspx", true);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        BRestrictionTextBox.Text = "";
        IdescTextBox.Text = "";
        InameTextBox.Text = "";
        IcapacityTextBox.Text = "";
        QtyAvailTextBox.Text = "";
        QtyConsumedTextBox.Text = "";
        QtyReservedTextBox.Text = "";
        AppIDTextBox.Text = "";
        DropDownList1.SelectedValue = " ";
        DropDownList2.SelectedValue = " ";
        DropDownList3.SelectedValue = " ";
       foreach (ListItem item in CheckBoxList1.Items)
       {
           if (item.Selected)
               CheckBoxList1.SelectedItem.Selected = false;
       }

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