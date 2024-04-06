using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_buyproduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        outofstock.Visible = false;
        if (Session["user"] == null)
        {
            //Response.Redirect("login.aspx");
        }
        else
        {
            String nm = Session["user"].ToString();
            //Response.Write("HIIIIIIIIIIIIIIIII" + nm);
        }
        Label1.Text= Request.QueryString["id"].ToString();
        //Response.Write(Label1.Text);
        if (DataList1.Items.Count <= 0)
        {
            outofstock.Visible = true;
        }
    
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {

            int index = e.Item.ItemIndex;
            Label quan = (Label)DataList1.Items[index].FindControl("Label11");
            
            int q = Convert.ToInt32(quan.Text);
            String id = e.CommandArgument.ToString();

            Response.Redirect("finalbuy.aspx?id=" + id + "&quan=" + quan.Text);
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        

    }
}