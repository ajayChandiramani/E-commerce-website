using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "select * from admin where unm=@unm and pass=@pass";
        com.Parameters.AddWithValue("@unm", TextBox1.Text);
        com.Parameters.AddWithValue("@pass", TextBox2.Text);
        con.Open();
        red = com.ExecuteReader();

        if (red.HasRows)
        {

            Session["admin"] = TextBox1.Text;
            Response.Redirect("category.aspx");
        }
        else
        {

            Response.Write("<script>alert('Plese Check Your Usernameand Password again')</script>");
            TextBox1.Focus();
        }
    }
}