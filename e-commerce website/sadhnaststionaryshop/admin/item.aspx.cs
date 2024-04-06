using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class admin_item : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    bool flg = false;
    string datetime = System.DateTime.Now.ToString().Replace("/", "-").Replace(":", " ");

    protected void Page_Load(object sender, EventArgs e)
    {
        
        message.Text = ""; 
        
    }
    protected void uploadimg(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            String path = Server.MapPath("img");
            String upload_path = path + "/" + datetime + FileUpload1.FileName;
            FileUpload1.SaveAs(upload_path);
            Image1.ImageUrl = "img/" + datetime + FileUpload1.FileName;
            flg = true;
            ViewState["proimg"]=Image1.ImageUrl.ToString();

        }
        else
        {
            RequiredFieldValidator1.Validate();
        }
    }
    protected void uploadinfo(object sender, EventArgs e)
    {

        String path = Server.MapPath("img");
        String filenm = ViewState["proimg"].ToString();
        String upload_path = path + "/" + datetime + FileUpload1.FileName;
        FileUpload1.SaveAs(upload_path);
        String nm = "~/admin/"  + filenm;
        
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "insert into item values(@1,@2,@3,@4,@5,@6,@7)";

        com.Parameters.AddWithValue("@1", TextBox1.Text);
        com.Parameters.AddWithValue("@2", TextBox2.Text);
        com.Parameters.AddWithValue("@3", TextBox3.Text);
        com.Parameters.AddWithValue("@4", DropDownList1.SelectedItem.Text);

        com.Parameters.AddWithValue("@5", nm);

        com.Parameters.AddWithValue("@6", TextBox4.Text);

        com.Parameters.AddWithValue("@7", TextBox5.Text);
        con.Open();
        com.ExecuteNonQuery();
        con.Close();

    }
}