<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="myorder.aspx.cs" Inherits="user_myorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
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
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" style=" color: #2874F0; font-size: large; font-weight: 700;" Text="Status:-"></asp:Label>
                    <asp:Label ID="Label10" runat="server" style="font-size: x-large;font-family:'Comic Sans MS';" Text='<%# Eval("status") %>'></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button10" runat="server" CssClass="wishlistbtn" Text="View Reason" />
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" style="font-size: x-large;font-family:'Comic Sans MS';" Text='<%# Eval("reason") %>' Visible="False"></asp:Label>
                    <br />
                </div>
            </div>

        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT item.Id, item.pname, item.pprice, item.pquan, item.pcate, item.pimg, item.pdesc, item.ptime, buypro.Id AS Expr1, buypro.* FROM item INNER JOIN buypro ON item.Id = buypro.pid WHERE (buypro.usernm = @uid)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="uid" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

