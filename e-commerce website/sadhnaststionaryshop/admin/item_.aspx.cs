using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class item : System.Web.UI.Page
{

    string datetime = System.DateTime.Now.ToString().Replace("/", "-").Replace(":"," ");
    
    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(datetime);
        DataList1.Visible = false;
        Label1.Visible = false;
        Button2.Visible = false;
        LinkButton bb = (LinkButton)Master.FindControl("LinkButton2");
        bb.BackColor = System.Drawing.ColorTranslator.FromHtml("#47c9af");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        String path = Server.MapPath("img");
       
        String upload_path = path + "/" + datetime+FileUpload1.FileName;
        FileUpload1.SaveAs(upload_path);
        String nm = "~/admin/img/" + datetime+FileUpload1.FileName;

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "insert into item values(@pname,@pprice,@pquan,@pcate,@pimg,@pdesc,@ptime)";

        com.Parameters.AddWithValue("@pname", TextBox1.Text);
        com.Parameters.AddWithValue("@pprice", TextBox2.Text);
        com.Parameters.AddWithValue("@pquan", TextBox3.Text);
        com.Parameters.AddWithValue("@pcate", DropDownList1.SelectedItem.Text);

        com.Parameters.AddWithValue("@pimg",nm);

        com.Parameters.AddWithValue("@pdesc", TextBox4.Text);

        com.Parameters.AddWithValue("@ptime", TextBox5.Text);
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        Label1.Visible = true;
        Button2.Visible = true;
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataList1.DataBind();

        DataList1.Visible = true;


    }
}