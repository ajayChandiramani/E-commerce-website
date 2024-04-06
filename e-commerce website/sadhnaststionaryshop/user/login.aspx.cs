using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class user_login : System.Web.UI.Page
{
    string datetime = System.DateTime.Now.ToString().Replace("/", "-").Replace(":", " ");
    
    String usernm = "d";
    SqlConnection con;
    SqlCommand com;
    SqlDataReader red, red1;
    protected void Page_Load(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 0;
        Response.Write(usernm);
        if (Session["user"] == null)
        {

            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            MultiView1.ActiveViewIndex = 2;
            Label1.Text = Session["user"].ToString();
        }



        Button bb = (Button)Master.FindControl("Button1");
        bb.BackColor = System.Drawing.ColorTranslator.FromHtml("#47c9af");
        bb.CssClass = "selectedmenu";
        Random res = new Random();
        String str = "abcdefghijklmnopqrstuvwxyz1234567890";

        String cap = "";
        for (int i = 0; i <= 5; i++)
        {
            int x = res.Next(36);
            cap = cap + str[x];

        }
        TextBox3.Text = cap;
        Random col1 = new Random();
        int c1 = col1.Next(0, 255);
        int c2 = col1.Next(0, 255);
        int c3 = col1.Next(0, 255);
        TextBox3.BackColor = System.Drawing.Color.FromArgb(c1, c2, c3);
        TextBox3.ForeColor = System.Drawing.Color.FromArgb(c3, c1, c2);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox4.Text == "")
        {
            Response.Write("<script>alert('plese provide all information')</script>");
        }
        else
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            com = con.CreateCommand();
            com.CommandText = "select * from cust where usernm=@usernm and pass=@pass";
            com.Parameters.AddWithValue("@usernm", TextBox1.Text);
            com.Parameters.AddWithValue("@pass", TextBox2.Text);
            con.Open();
            red = com.ExecuteReader();

            if (red.HasRows)
            {
                //Response.Write("<script>alert('Successfully login into website')</script>");
                Session["user"] = TextBox1.Text;
                Response.Redirect("default.aspx");


            }
            else
            {

                Response.Write("<script>alert('Plese Check Your Usernameand Password again')</script>");
                TextBox1.Focus();
            }
        }
    }

    protected void LinkButton2_Click1(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 0;
    }
    protected void txtunm_TextChanged(object sender,
EventArgs e)
    {
        //    string usrnm = txtunm.Text.ToUpper();
        //    con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        //    com = con.CreateCommand();
        //    com.CommandText = "select * from cust where usernm=@usrnm";
        //    com.Parameters.AddWithValue("@usrnm", usrnm);
        //    con.Open();
        //    red = com.ExecuteReader();
        //    if (red.HasRows)
        //    {
        //        lblmsg.Text = "This Username is not available for you.";
        //        //btncreate.Enabled = false;
        //        txtunm.Focus();
        //    }
        //    else
        //    {
        //        lblmsg.Text = "";
        //        //btncreate.Enabled = true;
        //    }
        //    red.Close();
        //    con.Close();
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        String gender;
        if (RadioButton1.Checked == true)
        {
            gender = RadioButton1.Text.ToString();
        }
        else
        {

            gender = RadioButton2.Text.ToString();
        }
        String path = Server.MapPath("userimg");

        String upload_path = path + "/" + datetime + FileUpload1.FileName;
        Response.Write(upload_path);
        FileUpload1.SaveAs(upload_path);
        String nm = "~/user//userimg/" + datetime + FileUpload1.FileName;
        
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "insert into cust values(@a,@b,@c,@d,@e,@f,@g,@h,@i,@j);";
        com.Parameters.AddWithValue("@a", TextBox5.Text);
        com.Parameters.AddWithValue("@b", txtunm.Text);
        com.Parameters.AddWithValue("@c", TextBox7.Text);
        com.Parameters.AddWithValue("@d", TextBox8.Text);
        com.Parameters.AddWithValue("@e", TextBox9.Text);
        com.Parameters.AddWithValue("@f", gender);
        com.Parameters.AddWithValue("@g", TextBox10.Text);
        com.Parameters.AddWithValue("@h", TextBox11.Text);
        com.Parameters.AddWithValue("@i", TextBox12.Text);
        com.Parameters.AddWithValue("@j", nm);
        con.Open();
        try
        {
            Response.Write("<script>alert('you are register now you can login with your username and password')");

            int i = com.ExecuteNonQuery();
            
        }
        catch (SqlException sql)
        {
            lblmsg.Text = "This username is aleready taken";
            MultiView1.ActiveViewIndex = 1;
            txtunm.Focus();

        }

        Session["user"] = txtunm.Text;
        Response.Redirect("default.aspx");
        



        
    
    }
    protected void TextBox9_TextChanged(object sender, EventArgs e)
    {
        Response.Write("RSFGGGGGGGGGGGGGG");
    }
}   