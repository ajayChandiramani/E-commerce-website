using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class user_Default2 : System.Web.UI.Page
{
    SqlConnection con;
 SqlCommand com;
 SqlDataReader red;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtunm_TextChanged(object sender, 
EventArgs e)
 {
 string usrnm = txtunm.Text.ToUpper();
 con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
 com = con.CreateCommand();
 com.CommandText = "select * from cust where usernm=@usrnm";
 com.Parameters.AddWithValue("@usrnm", usrnm);
 con.Open();
 red = com.ExecuteReader();
 if (red.HasRows)
 {
 lblmsg.Text = "This Username is not available for you.";
 btncreate.Enabled = false;
 txtunm.Focus();
 }
 else
 {
 lblmsg.Text = "";
 btncreate.Enabled = true;
 }
 red.Close();
 con.Close();
 }
 protected void btncreate_Click(object sender, 
EventArgs e)
 {
 }
 protected void Button1_Click(object sender, 
EventArgs e)
 {
 txtunm.Text = "";
 txtpsw.Text="";
 lblmsg.Text = "";
 }
}