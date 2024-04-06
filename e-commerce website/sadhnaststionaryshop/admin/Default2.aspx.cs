using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{

    Label quan;
    int q;
    int d;

    String[] repo = new String[] { };
    String[] repodate = new String[] { };
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Web.UI.HtmlControls.HtmlGenericControl allmainreport = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        allmainreport.ID = "allmainreport";
        allmainreport.Attributes.Add("class", "reportmain");
        this.Controls.Add(allmainreport);
        string[] jhj = ViewState["k"] as string[];
        string[] jhj1 = ViewState["k1"] as string[];

        for (int i = 0; i <= DataList1.Items.Count - 1; i++)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl dda1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            dda1.ID = i.ToString();
            String repodate = jhj1[i];
            dda1.Attributes.Add("class", "reportchartbardate");
            dda1.InnerHtml = jhj1[i];
            allmainreport.Controls.Add(dda1);
            System.Web.UI.HtmlControls.HtmlGenericControl dda = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            dda.ID = i.ToString();
            //dda.Style.Add(HtmlTextWriterStyle.BackgroundColor, "blue");
            String reposell = jhj[i];
            repodate = jhj1[i];
            int temp = Convert.ToInt32(reposell);
            if (temp > 100)
            {
                reposell = "200";
            }
            dda.Style.Add(HtmlTextWriterStyle.Height, "30px");
            dda.Style.Add(HtmlTextWriterStyle.Width, reposell + "0px");
            dda.Style.Add(HtmlTextWriterStyle.MarginLeft, "100px");

            dda.Attributes.Add("class", "reportchartbar");
            dda.InnerHtml = reposell;

            allmainreport.Controls.Add(dda);
            if (i >= DataList1.Items.Count - 1)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl hhr = new System.Web.UI.HtmlControls.HtmlGenericControl("HR");
                allmainreport.Controls.Add(hhr);

            }


        }
        for (int i = 0; i <= DataList1.Items.Count - 1; i++)
        {
            //System.Web.UI.HtmlControls.HtmlGenericControl dda = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            //dda.ID = i.ToString();
            //String repodate = jhj1[i];
            //dda.Style.Add(HtmlTextWriterStyle.Height, "50px");
            //dda.Style.Add(HtmlTextWriterStyle.Width, "90px");
            //dda.Style.Add(HtmlTextWriterStyle.Display, "inline-block");
            //dda.Style.Add(HtmlTextWriterStyle.MarginRight, "70px");
            //dda.Style.Add(HtmlTextWriterStyle.VerticalAlign, "bottom");
            //dda.Attributes.Add("class", "reportchartbar");
            //dda.InnerHtml = jhj1[i];
            //allmainreport.Controls.Add(dda);
        }

    }
    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    {

    }
    protected void DataList1_ItemDataBound1(object sender, DataListItemEventArgs e)
    {
        int len = DataList1.Items.Count;
        String[] temp = new String[len + 1];
        String[] temp1 = new String[len + 1];
        for (int i = 0; i <= DataList1.Items.Count - 1; i++)
        {
            Label sell = (Label)DataList1.Items[i].FindControl("Label1");

            Label tarikh = (Label)DataList1.Items[i].FindControl("dateLabel");
            temp[i] = sell.Text;
            temp1[i] = tarikh.Text;
            //Response.Write(temp[i]);
            //Response.Write("<br>");
        }
        repo = temp;
        repodate = temp1;
        ViewState["k"] = repo;
        ViewState["k1"] = repodate;
    }
}