using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    public String User
    {
        get { return (String)Session["User"]; }
        set { Session["User"] = value; }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
