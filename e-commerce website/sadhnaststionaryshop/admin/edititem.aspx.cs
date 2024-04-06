using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


public partial class edititem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Visible = false;
        LinkButton bb = (LinkButton)Master.FindControl("LinkButton3");
        bb.BackColor = System.Drawing.ColorTranslator.FromHtml("#47c9af");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

        Label3.Text = e.CommandArgument.ToString();
        if (e.CommandName == "edit")
        {
            Response.Redirect("alledit.aspx?id=" + Label3.Text);
        }
        if (e.CommandName == "delete")
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            com = con.CreateCommand();
            com.CommandText = "delete from item where id=@id";
            Response.Write(Label3.Text);
            com.Parameters.AddWithValue("@id", Label3.Text);
            Response.Write(Label3.Text);
            con.Open();
            int r = com.ExecuteNonQuery();
            Response.Write("<script>alert('item deleted successfully')</script>");
            Response.Write("<script>alert('item deleted nn')</script>");
        }
        DataList1.DataBind();
        con.Close();
        // Response.Redirect("edititem.aspx");
    }
}