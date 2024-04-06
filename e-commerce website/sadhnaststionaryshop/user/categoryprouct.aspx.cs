using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_categoryprouct : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    String uid, pid, id;
    protected void Page_Load(object sender, EventArgs e)
    {

        Button bb = (Button)Master.FindControl("Button8");
        bb.BackColor = System.Drawing.ColorTranslator.FromHtml("#47c9af");
        bb.CssClass = "selectedmenu";
        Label5.Text = Request.QueryString["catnm"].ToString();
        

    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "buy")
        {
            String id = e.CommandArgument.ToString();
            Response.Redirect("buyproduct.aspx?id=" + id);
        }

        if (e.CommandName == "cart")
        {
            int r;
            pid = e.CommandArgument.ToString();
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            com = con.CreateCommand();
            com.CommandText = "insert into cartpro values(@uid,@pid)";
            com.Parameters.AddWithValue("@uid", uid);
            com.Parameters.AddWithValue("@pid", pid);
            con.Open();

            r = com.ExecuteNonQuery();
            if (r == 1)
            {

                Response.Write("<script>alert('Item added to your cart');</script>");
            }
            con.Close();
        }
        if (e.CommandName == "wish")
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                uid = Session["user"].ToString();
                int r;
                pid = e.CommandArgument.ToString();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
                com = con.CreateCommand();
                com.CommandText = "insert into wishpro values(@uid,@pid)";
                com.Parameters.AddWithValue("@uid", uid);
                com.Parameters.AddWithValue("@pid", pid);
                con.Open();

                r = com.ExecuteNonQuery();
                if (r == 1)
                {

                    Response.Write("<script>alert('Item added to your Wishlist');</script>");
                }
                con.Close();
            }


        }
    }
    protected void Button9_Click(object sender, EventArgs e)
    {

    }
    protected void Button10_Click(object sender, EventArgs e)
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
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("categoryprouct.aspx?id=" + id);
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

        id = e.CommandArgument.ToString();
        Response.Write(id);

        Response.Redirect("categoryprouct.aspx?id=" + id);
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}