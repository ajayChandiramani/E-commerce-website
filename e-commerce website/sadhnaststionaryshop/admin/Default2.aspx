<%@ Page Language="C#" AutoEventWireup="true" Theme="admin" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        
    </style>
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
    
    

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand1" OnItemDataBound="DataList1_ItemDataBound1" Height="16px" Width="514px">
            <ItemTemplate>
                &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr2") %>' Visible="False" />
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Visible="False" />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(pid) AS Expr2, date FROM buypro GROUP BY date"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" style="height: 29px" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" style="font-size: 15pt; margin-left:20px;font-family:'Comic Sans MS'; color: #2874F0;" Text="Category Name:-"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="itempageinfotxt" placeholder="Enter Product Name"></asp:TextBox>
        <br />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>

        <br />


    </form>

</body>
</html>
