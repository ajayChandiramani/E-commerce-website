using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void button9_click(object sender, EventArgs e)
    {

        Response.Write("<script>alert('are you sure')</script>");
        Session["user"] = null;
        Response.Redirect("default.aspx");
    }
}
