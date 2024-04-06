using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Default3_aspxmycart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (DataList1.Items.Count <= 0)
        {
            Response.Write("j");
            Response.Write("<script>alert('you does not add any item in cart so plese add items in cart first');window.location='default.aspx';</script>");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("cartbuy.aspx");
    }
}