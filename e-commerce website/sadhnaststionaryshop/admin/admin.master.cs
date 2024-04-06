using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{

    System.Drawing.Color col = System.Drawing.ColorTranslator.FromHtml("#47c9af");
    System.Drawing.Color defcol = System.Drawing.ColorTranslator.FromHtml("#2874F0");

    protected void Page_Load(object sender, EventArgs e)
    {
        
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Menu1.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {   
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

        
    }
    protected void LinkButton15_Click(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {   
    }
    protected void LinkButton13_Click(object sender, EventArgs e)
    {   
    }
    protected void LinkButton16_Click(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Write("<script>alert('are you sure')</script>");
        Session["admin"] = null;
        Response.Redirect("default.aspx");
    }
}
