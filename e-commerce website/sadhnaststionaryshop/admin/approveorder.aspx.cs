using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
public partial class admin_vieworder : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    String aprostatus,cancelstatus;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DataList1.Items.Count <= 0)
        {
            message.Text = "You have Complete all operation.....:-)";
            message.ForeColor = System.Drawing.Color.Blue;
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;
        Label user = (Label)DataList1.Items[index].FindControl("usernm");
        TextBox txt = (TextBox)DataList1.Items[index].FindControl("TextBox1");
        Label buyproid = (Label)DataList1.Items[index].FindControl("buyproid");
        String pid = e.CommandArgument.ToString();
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "update buypro set status=@status,reason=@res,tempuse=@t where id=@id";
        if (e.CommandName == "approve")
        {
            txt.Text = "";
            aprostatus = "Your product is approve by admin";
            com.Parameters.AddWithValue("@status", aprostatus);
                
            com.Parameters.AddWithValue("@t", "yes");
            com.Parameters.AddWithValue("@pid", pid);
            com.Parameters.AddWithValue("@res", txt.Text);

            com.Parameters.AddWithValue("@id", buyproid.Text);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            message.ForeColor = System.Drawing.Color.Green;
            message.Text = "Item Approve successfully";
            DataList1.DataBind();

        }
        if (e.CommandName == "cancel")
        {

            if (txt.Text == "")
            {

                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "plese provide reason";

            }
            else
            {

                cancelstatus = "Your product is cancel by admin";
                com.Parameters.AddWithValue("@status", cancelstatus);
                com.Parameters.AddWithValue("@pid", pid);
                com.Parameters.AddWithValue("@t", "yes");

                com.Parameters.AddWithValue("@res", txt.Text);

                com.Parameters.AddWithValue("@id", buyproid.Text);

                con.Open();
                int r = com.ExecuteNonQuery();


                con.Close();

                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "Item Cancel successfully";
                DataList1.DataBind();
            }
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbl = (Label)e.Item.FindControl("Label15");
        

    }
}