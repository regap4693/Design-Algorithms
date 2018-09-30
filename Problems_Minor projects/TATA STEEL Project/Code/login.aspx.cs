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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB;Data Source=HP-HP;Initial Catalog=Inventory;User ID=sa;Password=root;");
        conn.Open();
        OleDbCommand olcom = new OleDbCommand("SELECT rm_password,rm_role,rm_eName FROM [Inventory].[dbo].[t_im_roleMapping_dtl] where rm_ePNo= ?", conn);
        olcom.Parameters.AddWithValue("@a1", UserName.Text);
        OleDbDataAdapter odap = new OleDbDataAdapter(olcom);

        DataSet ds = new DataSet();
        odap.Fill(ds, "[Inventory].[dbo].[t_im_roleMapping_dtl]");
        conn.Close();
        Session["Username"] = Convert.ToString(ds.Tables[0].Rows[0][2]);
        if(ds.Tables[0].Rows.Count>0)
        {
        String pass = Convert.ToString(ds.Tables[0].Rows[0][0]);
        String role = Convert.ToString((ds.Tables[0].Rows[0][1]));
       
        if ((Password.Text).Equals(pass))
        {
            Label1.Text = "You Have Successfully Logged In";
            if (role.Equals("0"))
            {
                Master.User = UserName.Text;
                Server.Transfer("CreateInventory.aspx", true); 
            }
            else if (role.Equals("1"))
            {
                Master.User = UserName.Text;
                Server.Transfer("SearchInventory.aspx", true);
            }
        }

        
        else
        {
            Label1.Text = "Password is Incorrect";
        }
    }
        else 
        {
            Label1.Text = "User Name is Incorrect";
        }
    }
    
}