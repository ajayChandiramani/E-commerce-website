using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_myorder : System.Web.UI.Page
{
    String uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            uid = Session["user"].ToString();
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;

        Label status = (Label)DataList1.Items[index].FindControl("Label10");

        Label reason = (Label)DataList1.Items[index].FindControl("Label12");
        
        if (status.Text == "Your product is cancel by admin")
        {
            reason.Visible = true;

        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        
        Label status = (Label)e.Item.FindControl("Label10");

        Button viewresbtn = (Button)e.Item.FindControl("Button10");

        if (status.Text != "Your product is cancel by admin")
        {

            viewresbtn.Visible = false;
        }
        else
        {
            viewresbtn.Visible = true;
        }
    }
}