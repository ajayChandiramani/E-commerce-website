using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_cartbuy : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    String[] arrcartpid=new String[]{};
    int cartprice=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Random res = new Random();
        String str = "abcdefghijklmnopqrstuvwxyz1234567890";

        String cap = "";
        for (int i = 0; i <= 3; i++)
        {
            int x = res.Next(36);
            cap = cap + str[x];

        }
        TextBox2.Text = cap;

        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            Label3.Text = Session["user"].ToString();

        }
        MultiView1.ActiveViewIndex = 0;

    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        //Response.Write(lbl.Text);

    }
    protected void kj(object source, DataListCommandEventArgs e)
    {

    }
    protected void DataList1_DataBinding(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {

    }
    protected void DataList1_ItemCreated(object sender, DataListItemEventArgs e)
    {

        //int index = e.Item.ItemIndex;
        //lbl = (Label)DataList1.Items[index].FindControl("pnameLabel");
        //Response.Write(lbl.Text);
    }
    protected void continue_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void deliver_click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void gotoview1(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void gotoview2(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void gotoview3(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void gotoview4(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 3;
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void kk(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;

    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        string[] jhj = ViewState["ajay"] as string[];
        string[] jhj1 = ViewState["quan"] as string[];
        for (int i = 1; i <= jhj.Length-1; i++)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            com = con.CreateCommand();

            com.CommandText = "update item set pquan=@ppquan where id=@id";

            com.Parameters.AddWithValue("@ppquan",jhj1[i]);
            com.Parameters.AddWithValue("@id", jhj[i]);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            
        }
        String date = System.DateTime.Today.Date.ToShortDateString();
        Response.Write(string.Join("*", jhj1));
        foreach (String id in jhj)
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            com = con.CreateCommand();
            com.CommandText = "insert into buypro values(@uid,@pid,@status,@reason,@tempuse,@date,@quan,@dd)";
            com.Parameters.AddWithValue("@uid", Label3.Text);
            com.Parameters.AddWithValue("@pid", id);
            com.Parameters.AddWithValue("@status", "In Process");
            com.Parameters.AddWithValue("@reason", "");
            com.Parameters.AddWithValue("@tempuse", "no");
            com.Parameters.AddWithValue("@quan", "1");
            com.Parameters.AddWithValue("@dd", "no");
            com.Parameters.AddWithValue("@date", date);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            com.CommandText = "delete from cartpro where usernm=@usernm";
            com.Parameters.AddWithValue("@usernm", Label3.Text);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();    
            
        }
        messagepanel3.Visible = true;
        Panel3.Visible = false;

        //Response.Write("RF");
        
    }
    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
            
        Response.Write("AJAY"); 
        int index = e.Item.ItemIndex;
        int d = DataList3.Items.Count;

        String[] temp = new String[d];

        String[] quan = new String[d];
        for (int i = 0; i <= d - 1; i++)
        {

            Label price = (Label)DataList3.Items[i].FindControl("Label8");

            Label cartpid = (Label)DataList3.Items[i].FindControl("Label9");
            Label proquan = (Label)DataList3.Items[i].FindControl("Label10");
            int q = Convert.ToInt32(proquan.Text);
            q = q - 1;

            //price.ID = "g.[i]";

            //Response.Write(price.Text + "<br>");
            cartprice += Convert.ToInt32(price.Text);
            //Response.Write(nm);
           temp[i] = cartpid.Text;
           quan[i] = q.ToString() ;            
        }
        Response.Write(cartprice);
        Button1.Text = "pay " + cartprice + " ₹";
        View4buy.Text = "pay " + cartprice + " ₹";
        arrcartpid = temp;
        ViewState["ajay"] = temp;
        ViewState["quan"] = quan;

        //Response.Write(String.Join("*",arrcartpid));

    }
}