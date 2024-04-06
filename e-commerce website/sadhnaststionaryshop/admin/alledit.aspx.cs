using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

public partial class admin_alledit : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand com;
    string datetime = System.DateTime.Now.ToString().Replace("/", "-").Replace(":", " ");
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        Response.Write(id);
    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "img")
        {

            int index = e.Item.ItemIndex;
            FileUpload FileUpload1 = (FileUpload)DataList2.Items[index].FindControl("FileUpload1");
            Image img = (Image)DataList2.Items[index].FindControl("Image2");
            String path = Server.MapPath("img");
            String upload_path = path + "/" + datetime + FileUpload1.FileName;
            FileUpload1.SaveAs(upload_path);
            img.ImageUrl = "img/" + datetime + FileUpload1.FileName;
            ViewState["proimg"] = img.ImageUrl.ToString();

        }
        if (e.CommandName == "edit")
        {
            String nm, filenm;
            int index = e.Item.ItemIndex;
            TextBox TextBox1 = (TextBox)DataList2.Items[index].FindControl("TextBox1");
            TextBox TextBox2 = (TextBox)DataList2.Items[index].FindControl("TextBox2");
            TextBox TextBox3 = (TextBox)DataList2.Items[index].FindControl("TextBox3");
            TextBox TextBox4 = (TextBox)DataList2.Items[index].FindControl("TextBox4");
            TextBox TextBox5 = (TextBox)DataList2.Items[index].FindControl("TextBox5");
            DropDownList DropDownList1 = (DropDownList)DataList2.Items[index].FindControl("DropDownList1");
            FileUpload FileUpload1 = (FileUpload)DataList2.Items[index].FindControl("FileUpload1");
            Image Image2 = (Image)DataList2.Items[index].FindControl("Image2");
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            com = con.CreateCommand();
            if (FileUpload1.HasFile)
            {
                String path = Server.MapPath("img");
                filenm = ViewState["proimg"].ToString();
                String upload_path = path + "/" + datetime + FileUpload1.FileName;
                FileUpload1.SaveAs(upload_path);
            }
            else
            {
                nm = Image2.ImageUrl.ToString();
            }
            if (ViewState["proimg"] != null)
            {
                filenm = ViewState["proimg"].ToString();
                nm = "~/admin/" + filenm;
            }
            else
            {
                nm = Image2.ImageUrl.ToString();
            }

            com.CommandText = "update item set pname=@1,pprice=@2,pquan=@3,pcate=@4,pimg=@5,pdesc=@6,ptime=@7 where id=@id";
            com.Parameters.AddWithValue("@1", TextBox1.Text);
            com.Parameters.AddWithValue("@2", TextBox2.Text);
            com.Parameters.AddWithValue("@3", TextBox3.Text);
            com.Parameters.AddWithValue("@4", DropDownList1.SelectedItem.Text);
            com.Parameters.AddWithValue("@5", nm);
            com.Parameters.AddWithValue("@6", TextBox4.Text);
            com.Parameters.AddWithValue("@7", TextBox5.Text);
            com.Parameters.AddWithValue("@id", id);
            con.Open();
            int r = com.ExecuteNonQuery();
            if (r > 0)
            {
                Response.Write("<script>alert('item updated successfully')</script>");
                Response.Redirect("edititem.aspx");


            }
            con.Close();

        }
    }
}