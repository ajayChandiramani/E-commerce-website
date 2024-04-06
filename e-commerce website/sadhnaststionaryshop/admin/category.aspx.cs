using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class category : System.Web.UI.Page
{
    string datetime = System.DateTime.Now.ToString().Replace("/", "-").Replace(":", " ");
    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    protected void Page_Load(object sender, EventArgs e)
    {
        error.Visible = false;
        erroradd.Visible = false;
        Panel1.Visible = true;
        Panel2.Visible = false;
        if (Session["admin"] == null)
        {
            Response.Redirect("default.aspx");
        }
        else
        {
            String unm = Session["admin"].ToString();
            Label1.Text = "Hello " + unm + "!!! :-)";
        }
        //GridView1.Visible = false;
        if (GridView1.Rows.Count == 0)
        {
            Label3.Text = "kai nthi bhai aaya";

        }
        Label2.Text = "";
        LinkButton bb = (LinkButton)Master.FindControl("LinkButton1");
        bb.BackColor = System.Drawing.ColorTranslator.FromHtml("#47c9af");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String path = Server.MapPath("catimg");
        String upload_path = path + "/" + datetime + FileUpload1.FileName;
        Response.Write(upload_path);
        FileUpload1.SaveAs(upload_path);
        String nm = "~/admin/catimg/" + datetime + FileUpload1.FileName;

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "insert into cate values(@nm,@catimg)";
        com.Parameters.AddWithValue("@nm", TextBox1.Text);
        com.Parameters.AddWithValue("@catimg", nm);
        con.Open();
        try
        {
            com.ExecuteNonQuery();

            Response.Write("<script>alert('Category addedd successfully')</script>");
        }
        catch (SqlException sqle)
        {
            erroradd.Visible = true;
        }
        con.Close();
        TextBox1.Text = "";
        GridView1.DataBind();

        if (GridView1.Rows.Count != 0)
        {
            Label3.Text = "";

        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edd")
        {
            Response.Write(e.CommandArgument.ToString());
            catid.Text = e.CommandArgument.ToString();
            Panel1.Visible = false;
            Panel2.Visible = true;
            GridView1.Visible = false;

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        LinkButton nm = (LinkButton)GridView1.Rows[e.RowIndex].FindControl("linkbuttondelete");
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "delete from item where pcate=@pcate";
        com.Parameters.AddWithValue("@pcate", nm.Text);
        con.Open();
        int r = com.ExecuteNonQuery();

        con.Close();

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Write(catid.Text);
        Response.Write(Label3.Text);
        String nm;
        int index = e.Item.ItemIndex;
        Label prvnm = (Label)DataList1.Items[index].FindControl("prvnm");

        Image img1 = (Image)DataList1.Items[index].FindControl("Image1");
        TextBox catname = (TextBox)DataList1.Items[index].FindControl("cattext");
        FileUpload fileup1 = (FileUpload)DataList1.Items[index].FindControl("FileUpload2");
        String path = Server.MapPath("catimg");
        String upload_path = path + "/" + datetime + fileup1.FileName;
        fileup1.SaveAs(upload_path);
        if (fileup1.HasFile)
        {
            Response.Write("chhe");
            nm = "~/admin/catimg/" + datetime + fileup1.FileName;
        }
        else
        {
            Response.Write("nthi");
            nm = img1.ImageUrl.ToString();
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "update cate set catnm=@catnm,catimg=@catimg where catid=@id";
        com.Parameters.AddWithValue("@catnm", catname.Text);
        com.Parameters.AddWithValue("@catimg", nm);
        com.Parameters.AddWithValue("@id", catid.Text);
        con.Open();
        try
        {
            com.ExecuteNonQuery();
            con.Close();
            com.CommandText = "update item set pcate=@pcate where pcate=@uniqcnm";
            com.Parameters.AddWithValue("@pcate", catname.Text);
            com.Parameters.AddWithValue("@uniqcnm", prvnm.Text);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();

        }
        catch (SqlException sqler)
        {
            error.Visible = true;
            Panel2.Visible = true;
            Panel1.Visible = false;
        }

        GridView1.DataBind();
        GridView1.Visible = true;
        DataList1.DataBind();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {

    }
}