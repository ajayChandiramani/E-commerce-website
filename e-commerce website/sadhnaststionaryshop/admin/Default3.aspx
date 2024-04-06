<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" Theme="admin" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="admin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand1" OnItemDataBound="DataList1_ItemDataBound1" Height="16px" Width="514px">
            <ItemTemplate>
                &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr2") %>' />
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(pid) AS Expr2, date FROM buypro GROUP BY date"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Genrate Report" CssClass="generatereportbtn" />
        <br />
        <br />
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="DataList2_ItemDataBound">
            <ItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Expr2") %>'></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Expr2") %>'></asp:Label>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(pid) AS Expr2, date FROM buypro GROUP BY date"></asp:SqlDataSource>
        SELECT COUNT(pid) AS Expr2, date FROM buypro GROUP BY date<br />
</asp:Content>

