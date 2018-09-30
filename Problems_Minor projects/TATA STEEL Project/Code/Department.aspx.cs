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

using System.Data.SqlClient;

public partial class Department : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        form.Visible = true;
        success.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn.Open();
        OleDbCommand olcom = new OleDbCommand("Insert into [Inventory].[dbo].[t_im_dept_mst] (dept_uid,dept_name,dept_slocId,dept_valid,dept_owner,dept_isDeleted,dept_createdBy,dept_createdOn)values (?,?,?,?,?,'false',?,?)", conn);

        olcom.Parameters.AddWithValue("@a1", "*");
        olcom.Parameters.AddWithValue("@a2", TextBox3.Text);
        olcom.Parameters.AddWithValue("@a3", DropDownList3.SelectedValue);
        olcom.Parameters.AddWithValue("@a4", RadioButtonList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a5", TextBox6.Text);
        olcom.Parameters.AddWithValue("@a5", Convert.ToString(Session["User"]));
        olcom.Parameters.AddWithValue("@a5", DateTime.Now);
        
        olcom.ExecuteNonQuery();
        conn.Close();

        SqlConnection sqlConnection1 = new SqlConnection("Server=HP-HP;Database=Inventory;User Id=sa;Password=root;");
        SqlCommand cmd = new SqlCommand();

        Object returnValue;

        cmd.CommandText = "SELECT dept_id FROM [Inventory].[dbo].[t_im_dept_mst] where dept_uid='*'";

        cmd.CommandType = CommandType.Text;
        cmd.Connection = sqlConnection1;

        sqlConnection1.Open();

        returnValue = cmd.ExecuteScalar();
        cmd.ExecuteNonQuery();

        sqlConnection1.Close();




        OleDbConnection con = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        con.Open();
        OleDbCommand olcon = new OleDbCommand("UPDATE [Inventory].[dbo].[t_im_dept_mst] SET dept_uid = (?) WHERE dept_uid= '*'", con);


        olcon.Parameters.AddWithValue("@a1", DropDownList2.SelectedValue + '_' + DropDownList3.SelectedValue + '_' + returnValue);

        olcon.ExecuteNonQuery();
        con.Close();

        form.Visible = false;
        success.Visible = true;

        // Server.Transfer("CreateInventory.aspx", true);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        DropDownList3.SelectedValue = " ";
        TextBox3.Text = "";
        TextBox6.Text = "";
        RadioButtonList1.SelectedItem.Selected = false;
    }
    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}