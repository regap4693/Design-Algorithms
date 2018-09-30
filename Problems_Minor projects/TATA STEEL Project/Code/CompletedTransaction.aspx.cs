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

public partial class CompletedTransaction : System.Web.UI.Page
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
        OleDbCommand com = new OleDbCommand("Select ib_bookingID,ib_inv_id as UNIQUE_ID,ib_bookingPNo,ib_bookingEname as NAME  from [INVENTORY].[dbo].[t_im_invBooking_dtl] where ib_bookingPNo=? and ib_payment is not NULL and ib_approverId1 is not NULL", conn);
        com.Parameters.AddWithValue("@a1", Convert.ToString(Session["User"]));
        
        OleDbDataAdapter oadap = new OleDbDataAdapter(com);
        oadap.Fill(ds, "[INVENTORY].[dbo].[t_im_invBooking_dtl]");
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
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Panel1.Visible = true;
        GridView1.EditIndex = e.NewEditIndex;
        BindEmployeeDetails();

        conn.Open();

        OleDbCommand com = new OleDbCommand("Select * from [INVENTORY].[dbo].[t_im_invBooking_dtl]  where ib_bookingPNo=? and ib_payment is not NULL and ib_approverId1 is not NULL", conn);
        com.Parameters.AddWithValue("@a1", Convert.ToString(Session["User"]));

        OleDbDataAdapter oadap = new OleDbDataAdapter(com);
        DataSet ds1 = new DataSet();

        oadap.Fill(ds1, "[INVENTORY].[dbo].[t_im_invBooking_dtl]");
        conn.Close();
        Label1.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][1].ToString();
        Label2.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][2].ToString();
        Label3.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][3].ToString();
        Label4.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][4].ToString();
        Label5.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][5].ToString();
        Label6.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][6].ToString();
        Label7.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][7].ToString();
        Label8.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][8].ToString();
        Label9.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][9].ToString();
        Label10.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][10].ToString();
        Label11.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][11].ToString();
        Label12.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][12].ToString();
        Label13.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][13].ToString();
        Label14.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][14].ToString();
        Label15.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][15].ToString();
        Label16.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][16].ToString();
        Label17.Text = ds1.Tables["[INVENTORY].[dbo].[t_im_invBooking_dtl]"].Rows[e.NewEditIndex][17].ToString();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindEmployeeDetails();
        Panel1.Visible = false;
    }
}