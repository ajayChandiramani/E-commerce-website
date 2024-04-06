using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class admin_manageorder : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void updateitem_Click(object sender, EventArgs e)
    {
        CheckBox chk = new CheckBox();
        

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            chk =(CheckBox)GridView1.Rows[i].FindControl("chkupdate");
            if (chk.Checked == true)
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
                com = new SqlCommand();
                com = con.CreateCommand();
                com.CommandText = "update buypro set dd=@dd where id=@id";
                int id = int.Parse(GridView1.Rows[i].Cells[1].Text);
                Response.Write(id);
                com.Parameters.AddWithValue("@dd", "yes");
                com.Parameters.AddWithValue("@id", id);
               
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }

        }
        GridView1.DataBind();
    }
    protected void updateitemfot_Click(object sender, EventArgs e)
    {

    }
}