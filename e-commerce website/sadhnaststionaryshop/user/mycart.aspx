<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="mycart.aspx.cs" Inherits="user_Default3_aspxmycart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" BorderColor="Green" CellSpacing="-1">
        <FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterTemplate>
            <asp:Button ID="Button1" runat="server" CssClass="mycarbuybtn" OnClick="Button1_Click" Text="Buy Now" />
        </FooterTemplate>
        <ItemTemplate>
           <div class="myordermain">
                <div class="myorderimg">
                    <asp:Image ID="Image1" runat="server" Height="270px" ImageUrl='<%# Eval("pimg") %>' Width="270px" />
                
                    </div>
                <div class="myordercont">

                    <br />

                    <asp:Label ID="Label2" runat="server" style=" color: #2874F0; font-size: large;  font-weight: 700;" Text="Product Name:"></asp:Label>
                    :-
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>' style="font-size: x-large;font-family:'Comic Sans MS';"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" style=" color: #2874F0; font-size: large; font-weight: 700;" Text="Product Description:-"></asp:Label>
                    <asp:Label ID="Label4" runat="server" style="font-size: x-large;font-family:'Comic Sans MS';" Text='<%# Eval("pdesc") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" style=" color: #2874F0; font-size: large; font-weight: 700;" Text="Product Price:"></asp:Label>
                    <asp:Label ID="Label6" runat="server" style="font-size: x-large;font-family:'Comic Sans MS';" Text='<%# Eval("pprice") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" style=" color: #2874F0; font-size: large; font-weight: 700;" Text="Product Category:-"></asp:Label>
                    <asp:Label ID="Label8" runat="server" style="font-size: x-large;font-family:'Comic Sans MS';" Text='<%# Eval("pcate") %>'></asp:Label>
                </div>
            </div>

        </ItemTemplate>
        <SelectedItemStyle BackColor="Fuchsia" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
    </asp:DataList>
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT cartpro.pid, item.Id, item.pname, item.pprice, item.pquan, item.pcate, item.pimg, item.pdesc, item.ptime FROM cartpro INNER JOIN item ON cartpro.pid = item.Id WHERE (cartpro.usernm = @unm) AND (item.pquan &gt; 0)">
        <SelectParameters>
            <asp:SessionParameter Name="unm" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
</asp:Content>

