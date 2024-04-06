<%@ Page Title="" Language="C#" Theme="admin" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="admin_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="reportmain">
        <h1 style="text-align: center">
         <asp:Label ID="Label1" runat="server" Text="Product Report" style="color: #0000CC"></asp:Label>
         </h1>
        <asp:Button ID="Button1" runat="server" Text="View Sales Report" CssClass="viewsalesrepbtn" PostBackUrl="~/admin/salesrepot.aspx" style="text-align: center" />
          
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center; font-weight: 700; font-size: large" Width="80%" CssClass="reportgridview">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("pimg") %>' Width="100px" CssClass="reportimg" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                <asp:BoundField DataField="pprice" HeaderText="pprice" SortExpression="pprice" />
                <asp:BoundField DataField="pquan" HeaderText="pquan" SortExpression="pquan" />
                <asp:BoundField DataField="pcate" HeaderText="pcate" SortExpression="pcate" />
                <asp:BoundField DataField="pdesc" HeaderText="pdesc" SortExpression="pdesc" />
                <asp:BoundField DataField="ptime" HeaderText="ptime" SortExpression="ptime" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />

          
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [item]"></asp:SqlDataSource>

          
    </div>
</asp:Content>

