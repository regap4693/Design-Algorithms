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

public partial class SubLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        form.Visible = true;
        success.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox2.Text = "";
        TextBox5.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn.Open();
        OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_subloc_mst] (sloc_name,sloc_valid,sloc_locId,sloc_owner,sloc_isDeleted,sloc_createdBy,sloc_createdOn)values (?,'True',?,?,'False',?,?)", conn);
        olcom.Parameters.AddWithValue("@a1", TextBox2.Text);
        olcom.Parameters.AddWithValue("@a3", DropDownList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a4", TextBox5.Text);
        olcom.Parameters.AddWithValue("@a5", Convert.ToString(Session["User"])); 
        olcom.Parameters.AddWithValue("@a5", DateTime.Now);
              
        int n = olcom.ExecuteNonQuery();
        conn.Close();
        form.Visible = false;
        success.Visible = true;
    }
}