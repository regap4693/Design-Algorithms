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

public partial class ShowPayDtl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Master.pid;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("HomeUser.aspx", true);
    }
}