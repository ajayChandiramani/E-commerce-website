<%@ Page Title="" Language="C#" Theme="admin" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="approveorder.aspx.cs" Inherits="admin_vieworder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="message" runat="server" Style="font-size: x-large; margin-left: 600px; text-align: center"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div class="vieworde_main">
                <div class="vieworder_header">
                    <div class="vieworder_orderino">
                        <asp:Label ID="Label1" runat="server" Text="Customer Name:-" Style="color: #666666; font-size: medium;"></asp:Label>
                        <asp:Label ID="usernm" runat="server" Text='<%# Eval("Expr3") %>' Style="font-size: large"></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Style="color: #666666; font-size: medium;" Text="City:-"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Style="font-size: large" Text='<%# Eval("city") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label8" runat="server" Style="color: #666666; font-size: medium;" Text="Email:-"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Style="font-size: large" Text='<%# Eval("email") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label10" runat="server" Style="color: #666666; font-size: medium;" Text="City:-"></asp:Label>
                        <asp:Label ID="Label11" runat="server" Style="font-size: large" Text='<%# Eval("mob") %>'></asp:Label>
                        <br />
                    </div>

                    <asp:Image ID="Image1" runat="server" class="vieworder_custimg" Height="100px" ImageUrl='<%# Eval("userimg") %>' Width="100px" />

                </div>
                <div class="vieworder_orderinfoimg">
                    <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl='<%# Eval("pimg") %>' Width="100px" CssClass="vieworder_proimg" />

                </div>
                <div class="vieworder_orderinfo">
                    <asp:Label ID="Label12" runat="server" Style="color: #666666; font-size: medium;" Text="Product Name:-"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("pname") %>' Style="font-size: 16pt; font-weight: 700"></asp:Label>
                    <br />
                    <asp:Label ID="Label13" runat="server" Style="color: #666666; font-size: medium;" Text="Product Description:-"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Style="font-size: 14pt; color: #000000; font-weight: 700;" Text='<%# Eval("pdesc") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label16" runat="server" Style="color: #666666; font-size: medium;" Text="Product quantity:-"></asp:Label>
                    <asp:Label ID="quanlabel" runat="server" Style="font-size: 14pt; font-weight: 700; color: #000000;" Text='<%# Eval("quan") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label14" runat="server" Style="color: #666666; font-size: medium;" Text="Price:-"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Style="font-size: x-large; font-weight: 700" Text='<%# Eval("pprice") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="provide reson to cancel order" CssClass="resontxt" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("tempuse") %>' Visible="False"></asp:Label>
                    <br />
                </div>
                <div class="vieworder_footer">

                    <asp:Button ID="Button1" runat="server" BackColor="#006600" Text="Approve" BorderColor="Green" Height="75px" Style="background-color: #BEFBBB" Width="75px" CssClass="vieworderbtn" CommandArgument='<%# Eval("pid") %>' CommandName="approve" CausesValidation="False" />
                    <asp:Button ID="Button2" runat="server" Height="75px" Text="Cancel" Width="75px" BorderColor="Red" Style="background-color: #FFB7B7" CssClass="vieworderbtn" CommandArgument='<%# Eval("pid") %>' CommandName="cancel" OnClick="Button2_Click" />
                    <asp:Label ID="buyproid" runat="server" Text='<%# Eval("Expr2") %>'></asp:Label>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <div style="margin-left: 40px">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT item.Id, item.pname, item.pprice, item.pquan, item.pcate, item.pimg, item.pdesc, item.ptime, cust.Id AS Expr1, cust.name, cust.usernm, cust.addr, cust.city, cust.pincode, cust.gen, cust.mob, cust.email, cust.pass, cust.userimg, buypro.Id AS Expr2, buypro.usernm AS Expr3, buypro.pid, buypro.status, buypro.reason, buypro.tempuse, buypro.date, buypro.quan FROM buypro INNER JOIN cust ON buypro.usernm = cust.usernm INNER JOIN item ON buypro.pid = item.Id WHERE (buypro.tempuse = 'no')"></asp:SqlDataSource>
    </div>

</asp:Content>

