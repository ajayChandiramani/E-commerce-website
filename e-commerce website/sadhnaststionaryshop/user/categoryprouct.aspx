<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="categoryprouct.aspx.cs" Inherits="user_categoryprouct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #2874F0;
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: left;
            font-size: 25pt;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            text-align: center;
            font-size: 20pt;
            color: #2874F0;
        }
        .auto-style6 {
            color: #2874F0;
            text-align: center;
            font-size: 20pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    <asp:Label ID="catrgory" runat="server" Text="Displaying Catrgory:-"></asp:Label>
    &nbsp;<asp:Label ID="Label5" runat="server" style="color: #FFFFFF" Text="Label"></asp:Label>
    </h1>
    <asp:DataList ID="DataList2" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" CellSpacing="-1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" style="margin-left: 0px" Width="100%" BorderWidth="2px" OnItemCommand="DataList2_ItemCommand" HorizontalAlign="Center">
        <ItemTemplate>
                <div class="performdiv">
                    <table style="width:100%; ">
                        <tr>
                            <td class="auto-style1" colspan="2">
                                <asp:Image ID="Image2" runat="server" CssClass="prodimg" Height="250px" ImageUrl='<%# Eval("pimg") %>' Width="250px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">Product Name:-</td>
                            <td class="auto-style4">
                                <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text='<%# Eval("pname") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Product Price:-</td>
                            <td class="auto-style2">
                                <asp:Label ID="Label4" runat="server" CssClass="auto-style3" Text='<%# Eval("pprice") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center" colspan="2">
                                <asp:Button ID="Button9" runat="server" CommandArgument='<%# Eval("Id") %>' Text="View" CommandName="buy" CssClass="buynowbtn" OnClick="Button9_Click" />
                            
                                <asp:Button ID="Button10" runat="server" CommandArgument='<%# Eval("Id") %>' Text="Add to Cart" CommandName="cart" CssClass="addcartbtn" OnClick="Button10_Click" />
                            
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("Id") %>' Text="Add to my wishlist" CssClass="wishlistbtn" CommandName="wish" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
            <br />
            <br />
        </ItemTemplate>
        
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from item where pcate=@catnm">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="catnm" QueryStringField="catnm" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />

</asp:Content>

