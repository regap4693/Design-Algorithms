using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMaster : System.Web.UI.MasterPage
{
    public String pid
    {
        get { return (String)Session["pid"]; }
        set { Session["pid"] = value; }

    }
    public String bid
    {
        get { return (String)Session["bid"]; }
        set { Session["bid"] = value; }

    }
    public String Inv
    {
        get { return (String)Session["Inv"]; }
        set { Session["Inv"] = value; }

    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
