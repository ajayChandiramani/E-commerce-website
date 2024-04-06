<%@ Page Title="" Language="C#" Theme="admin" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="manageorder.aspx.cs" Inherits="admin_manageorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="manageordergrid">
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,Expr1,Expr2" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" style="font-size: 20pt; text-align: center;" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="dilivered">
                <FooterTemplate>
                    <asp:Button ID="updateitemfot" runat="server" Text="Delivered" CssClass="manageorderbtn" OnClick="updateitem_Click" />
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:Button ID="updateitem" runat="server" OnClick="updateitem_Click" Text="Delivered" CssClass="manageorderbtn" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkupdate" runat="server" Text="Deliverd" />
                </ItemTemplate>
                <ItemStyle CssClass="manageordercell" />
            </asp:TemplateField>
            <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" />
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="reportimg" Height="80px" ImageUrl='<%# Eval("pimg") %>' Width="80px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="pname" HeaderText="Product Image" SortExpression="pname" />
            <asp:BoundField DataField="pprice" HeaderText="Product Price" SortExpression="pprice" />
            <asp:BoundField DataField="pcate" HeaderText="Category" SortExpression="pcate" />
            
            <asp:BoundField DataField="quan" HeaderText="quan" SortExpression="quan" />
            <asp:BoundField DataField="ptime" HeaderText="Delivery Time" SortExpression="ptime" />
            <asp:BoundField DataField="usernm" HeaderText="User Name" SortExpression="usernm" />
            <asp:BoundField DataField="addr" HeaderText="Address" SortExpression="addr" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="mob" HeaderText="mob" SortExpression="mob" />
            <asp:BoundField DataField="userimg" HeaderText="userimg" SortExpression="userimg" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
       </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT item.Id, item.pname, item.pprice, item.pcate, item.pimg, item.pdesc, item.ptime, cust.Id AS Expr1, cust.name, cust.usernm, cust.addr, cust.city, cust.pincode, cust.gen, cust.mob, cust.email, cust.pass, cust.userimg, buypro.Id AS Expr2, buypro.usernm AS Expr3, buypro.pid, buypro.status, buypro.reason, buypro.tempuse, buypro.date, buypro.quan, buypro.dd FROM item INNER JOIN buypro ON item.Id = buypro.pid INNER JOIN cust ON buypro.usernm = cust.usernm WHERE (buypro.tempuse = 'yes') AND (buypro.dd = 'no')"></asp:SqlDataSource>
</asp:Content>

