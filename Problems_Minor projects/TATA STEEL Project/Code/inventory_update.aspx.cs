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

public partial class Inventory_update : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            BindEmployeeDetails();
        }
    }

    protected void BindEmployeeDetails()
    {
        conn.Open();
        OleDbCommand com = new OleDbCommand("Select inv_uid as UNIQUE_ID,inv_id as ID,inv_name as NAME,inv_desc as DESCRIPTION,inv_capacity as CAPACITY,inv_deptId as DEPARTMENT_ID,inv_qtyAvailable as AVAILABLE_QUANTITY,inv_qtyConsumed as QUANTITY_CONSUMED,inv_qtyReserve as QUANTITY_RESERVED,inv_costAssociated as COST_ASSOCIATED,inv_approverId1 as APPROVER_ID,inv_availability as AVAILABLE_DAYS,inv_valid as VALIDITY,inv_isDeleted as IS_DELETED from [INVENTORY].[dbo].[t_im_inventory_mst]", conn);
        OleDbDataAdapter oadap = new OleDbDataAdapter(com);

        oadap.Fill(ds, "[INVENTORY].[dbo].[t_inventory_loc_mst]");
        conn.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        }

    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Panel1.Visible = true;
        GridView1.EditIndex = e.NewEditIndex;
        BindEmployeeDetails();
        InameTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0]).Text;
        IdescTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0]).Text;
        IcapacityTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[5].Controls[0]).Text;
        QtyAvailTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[7].Controls[0]).Text;
        QtyConsumedTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[8].Controls[0]).Text;
        QtyReservedTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[9].Controls[0]).Text;
        AppIDTextBox.Text = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[11].Controls[0]).Text;
        String c = ((TextBox)GridView1.Rows[e.NewEditIndex].Cells[12].Controls[0]).Text;
        
        for (int i = 0; i < c.Length; i++)
        {
            if (i % 2 == 0)
            {
                String k=c.Substring(i, 1);
                
               
               
                foreach (ListItem x in CheckBoxList1.Items)
                {
                    if (x.Value == k)
                        x.Selected = true;
                }
            }

        }


        if (((CheckBox)GridView1.Rows[e.NewEditIndex].Cells[14].Controls[0]).Checked)

            RadioButtonList3.SelectedIndex = 0;

        else
            RadioButtonList3.SelectedIndex = 1;
        if (((CheckBox)GridView1.Rows[e.NewEditIndex].Cells[13].Controls[0]).Checked)

            RadioButtonList2.SelectedIndex = 0;

        else
            RadioButtonList2.SelectedIndex = 1;

        if (((CheckBox)GridView1.Rows[e.NewEditIndex].Cells[10].Controls[0]).Checked)

            RadioButtonList1.SelectedIndex = 0;

        else
            RadioButtonList1.SelectedIndex = 1;
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String s = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;


        conn.Open();
        OleDbCommand olcom = new OleDbCommand("Update [INVENTORY].[dbo].[t_im_inventory_mst] set inv_name=?,inv_desc=?,inv_capacity=?,inv_qtyAvailable=?,inv_qtyConsumed=?,inv_qtyReserve=?,inv_costAssociated=?,inv_approverId1=?,inv_availability=?,inv_valid=?,inv_isDeleted=?,inv_ModifiedBy=? where inv_uid=?", conn);
        olcom.Parameters.AddWithValue("@a1", InameTextBox.Text);
        olcom.Parameters.AddWithValue("@a2", IdescTextBox.Text);
        olcom.Parameters.AddWithValue("@a3", IcapacityTextBox.Text);
        olcom.Parameters.AddWithValue("@a4", QtyAvailTextBox.Text);
        olcom.Parameters.AddWithValue("@a5", QtyConsumedTextBox.Text);
        olcom.Parameters.AddWithValue("@a6", QtyReservedTextBox.Text);
        olcom.Parameters.AddWithValue("@a7", RadioButtonList1.SelectedValue);
        olcom.Parameters.AddWithValue("@a8", AppIDTextBox.Text);
        String t = "";
        foreach (ListItem x in CheckBoxList1.Items)
        {
            if (x.Selected)
                t = t + x.Value + ",";


        }
        olcom.Parameters.AddWithValue("@a9", t);

        olcom.Parameters.AddWithValue("@a10", RadioButtonList2.SelectedValue);
        olcom.Parameters.AddWithValue("@a11", RadioButtonList3.SelectedValue);
        olcom.Parameters.AddWithValue("@a12", TextBox1.Text);


      
        olcom.Parameters.AddWithValue("@a13",s);
       
        
        olcom.ExecuteNonQuery();
        conn.Close();

        GridView1.EditIndex = -1;
        BindEmployeeDetails();
        Panel1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        InameTextBox.Text = "";
        IdescTextBox.Text = "";
        QtyAvailTextBox.Text = "";
        IcapacityTextBox.Text = "   ";
        QtyConsumedTextBox.Text = "";
        QtyReservedTextBox.Text = "";
        AppIDTextBox.Text = "";
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Panel1.Visible = false;
        GridView1.EditIndex = -1;
        BindEmployeeDetails();

    }
    protected void AppIDTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void IdescTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void QtyAvailTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        Panel1.Visible = false;
    }
}