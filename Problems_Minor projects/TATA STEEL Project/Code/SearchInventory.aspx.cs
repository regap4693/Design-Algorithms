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

public partial class SearchInventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Convert.ToString(Session["Username"]);
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn1 = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn1.Open();
        OleDbCommand olcom = new OleDbCommand("SELECT inv_uid FROM [INVENTORY].[dbo].[t_im_inventory_mst] WHERE inv_name= ? AND inv_deptId = ?", conn1);
        olcom.Parameters.AddWithValue("@a1", DropDownList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a2", DropDownList4.SelectedValue);
        OleDbDataAdapter oadap = new OleDbDataAdapter(olcom);
        DataSet ds=new DataSet();

        oadap.Fill(ds, "[INVENTORY].[dbo].[t_im_inventory_dtl]");
        conn1.Close();
        Master.Inv= Convert.ToString(ds.Tables[0].Rows[0][0]);
        Server.Transfer("BookingDetails.aspx", true);
    }
}
