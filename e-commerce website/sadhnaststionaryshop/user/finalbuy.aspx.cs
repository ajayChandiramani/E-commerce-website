using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class user_finalbuy : System.Web.UI.Page
{

    String pricetodisplay;
    SqlConnection con;
    SqlCommand com;
    SqlDataReader red;
    String pid, uid, quan;
    String status = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        messagepanel3.Visible = false;
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

            pid = Request.QueryString["id"].ToString();

            quan = Request.QueryString["quan"].ToString();
            uid = Session["user"].ToString();
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
        int q;
        q = Convert.ToInt32(quan);
        if (quantext.Text == "1")
        {
            q = q - 1;
        }
        else
        {
            int aj = Convert.ToInt32(quantext.Text);
            q = q - aj;

        }
        Response.Write(q);

        String date = System.DateTime.Today.Date.ToShortDateString();
        messagepanel3.Visible = true;
        maincontent.Visible = false;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        com = con.CreateCommand();
        com.CommandText = "insert into buypro values(@uid,@pid,@status,@reason,@tempuse,@date,@quan,@dd)";
        com.Parameters.AddWithValue("@uid", uid);
        com.Parameters.AddWithValue("@pid", pid);
        com.Parameters.AddWithValue("@status", "In Process");
        com.Parameters.AddWithValue("@reason", "");
        com.Parameters.AddWithValue("@tempuse", "no");
        com.Parameters.AddWithValue("@date", date);
        com.Parameters.AddWithValue("@quan", quantext.Text);
        com.Parameters.AddWithValue("@dd", "no");


        con.Open();

        com.ExecuteNonQuery();

        con.Close();
        com.CommandText = "update item set pquan=@pquan where id=@id";
        com.Parameters.AddWithValue("@pquan", q);
        com.Parameters.AddWithValue("@id", pid);
        con.Open();
        com.ExecuteNonQuery();
        con.Close();

    }
    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
    }



    protected void DataList3_ItemCommand1(object source, DataListCommandEventArgs e)
    {

        Response.Write("FS");
        int index = e.Item.ItemIndex;
        Label price = (Label)DataList3.Items[index].FindControl("Label8");
        Label t = (Label)DataList3.Items[index].FindControl("Label9");

        int t1 = Convert.ToInt32(quantext.Text);
        int t2 = Convert.ToInt32(t.Text);
        int tt = t1 * t2;
        price.Text = tt.ToString();
        pricetodisplay = tt.ToString();
        Button1.Text = "pay " + pricetodisplay + "₹";
        View4buy.Text = "pay " + pricetodisplay + "₹";
        //Response.Write("&#8377");
    }
    protected void plusbtn_Click(object sender, EventArgs e)
    {
        int q = Convert.ToInt32(Request.QueryString["quan"]);

        int quan = Convert.ToInt32(quantext.Text);
        if (quan < q)
        {
            quan = quan + 1;
            quantext.Text = quan.ToString();

            MultiView1.ActiveViewIndex = 2;
        }
        else
        {
            MultiView1.ActiveViewIndex = 2;
            Response.Write("<script>alert('Max Quantity');</script>");


        }

    }
    protected void minusbtn_Click(object sender, EventArgs e)
    {
        int q = Convert.ToInt32(Request.QueryString["quan"]);

        int quan = Convert.ToInt32(quantext.Text);
        if (quan > 1)
        {
            quan = quan - 1;
            quantext.Text = quan.ToString();
            MultiView1.ActiveViewIndex = 2;
        }
        else
        {

            MultiView1.ActiveViewIndex = 2;
        }
    }
}