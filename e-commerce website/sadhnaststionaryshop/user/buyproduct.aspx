<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="buyproduct.aspx.cs" Inherits="user_buyproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

    <br />
    <br />
    <br />
    <asp:Label ID="outofstock" runat="server" style="font-weight: 700; color: #000000;margin-left:400px; font-size: 50px" Text="Sorry!!! This Item is out of stock!!! :-("></asp:Label>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
           <div class="buyproductimgdiv">
               <asp:Image ID="Image1" runat="server" CssClass="proimg" ImageUrl='<%# Eval("pimg") %>' />
               <asp:Button ID="Button1" CssClass="addtocartbtn" runat="server" Text="Add to cart" />
               <asp:Button ID="Button2" CssClass="buybtn" runat="server" Text="Buy Now" CommandArgument='<%# Eval("Id") %>' CommandName="view"  />
               
           </div>
            <div class="buyproductinfodiv">
                <br /><br />
                <asp:Label ID="Label4" runat="server" CssClass="contlbl" Text="Product Name:-"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("pname") %>' CssClass="continfolbl"></asp:Label>
                <br /><br /><br />
                 <asp:Label ID="Label5" runat="server" CssClass="contlbl" Text="Description:-"></asp:Label>
                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("pdesc") %>' CssClass="continfolbl"></asp:Label>
                <br /><br /><br />
                <asp:Label ID="Label6" runat="server" CssClass="contlbl" Text="Price:-"></asp:Label>
                <asp:Label ID="Label7" runat="server" CssClass="continfolbl" Text='<%# Eval("pprice") %>'></asp:Label>
                <br /><br /><br />
                <asp:Label ID="Label8" runat="server" CssClass="contlbl" Text="Estimated Dilivery time:-"></asp:Label>
                <asp:Label ID="Label9" runat="server" CssClass="continfolbl" Text='<%# Eval("ptime") %>'></asp:Label>
                <br /><br /><br />
                <asp:Label ID="Label12" runat="server" CssClass="contlbl" Text="Category:-"></asp:Label>
                <asp:Label ID="Label13" runat="server" CssClass="continfolbl" Text='<%# Eval("pcate") %>'></asp:Label>
                <br /><br /><br />
                <asp:Label ID="Label10" runat="server" CssClass="contlbl" Text="Available Quantity:-"></asp:Label>
                <asp:Label ID="Label11" runat="server" CssClass="continfolbl" Text='<%# Eval("pquan") %>'></asp:Label>
                <br /><br /><br />
               
            </div>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, pname, pprice, pquan, pcate, pimg, pdesc, ptime FROM item WHERE (Id = @id and pquan&gt;0)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="1" Name="id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>

