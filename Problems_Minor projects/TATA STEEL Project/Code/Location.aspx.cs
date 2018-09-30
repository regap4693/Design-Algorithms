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
public partial class Location : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Convert.ToString("User");
        form.Visible = true;
        success.Visible = false;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        TextBox2.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        foreach (ListItem item in RadioButtonList1.Items)
        {
            if (item.Selected)
                RadioButtonList1.SelectedItem.Selected = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn.Open();
        OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_loc_mst] (loc_name,loc_valid,loc_compCode,loc_admin,loc_isDeleted,loc_createdBy,loc_createdOn,loc_ModifiedBy) values (?,?,?,?,'False',?,?,?)", conn);
        olcom.Parameters.AddWithValue("@a1", TextBox2.Text); 
        olcom.Parameters.AddWithValue("@a2", RadioButtonList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a3", TextBox4.Text); 
        olcom.Parameters.AddWithValue("@a4", TextBox5.Text); 
        olcom.Parameters.AddWithValue("@a6", Convert.ToString(Session["User"])); 
        olcom.Parameters.AddWithValue("@a7", DateTime.Now);
        olcom.Parameters.AddWithValue("@a8", Convert.ToString(Session["User"])); 
        
        int n = olcom.ExecuteNonQuery();
        conn.Close();
        form.Visible = false;
        success.Visible = true;
        //Server.Transfer("CreateInventory.aspx", true);
    }
}