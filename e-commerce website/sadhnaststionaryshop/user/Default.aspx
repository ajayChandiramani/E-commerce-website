<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="user_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 254px;
            text-align: center;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            text-align: center;
            color: #003366;
            font-size: 25pt;
        }

        .auto-style4 {
            text-align: center;
            color: #2874F0;
            font-size: 20pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="allcate">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="catid" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" CssClass="catimg" Height="80px" ImageUrl='<%# Eval("catimg") %>' Width="80px" />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("catnm") %>' Font-Underline="False" OnClick="LinkButton1_Click" Style="font-weight: 700; text-align: center; color: #000000; font-size: large" Text='<%# Eval("catnm") %>'></asp:LinkButton>
                <br />
                <br />
            </ItemTemplate>

        </asp:DataList>
    </div>
    <hr style="color: white; height: 1px; background-color: white" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [cate]"></asp:SqlDataSource>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/user/XMLFile.xml"></asp:XmlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
        </Triggers>
        <ContentTemplate>
            <asp:Timer ID="Timer1" Interval="800" runat="server"></asp:Timer>
            <asp:AdRotator ID="AdRotator2" runat="server" DataSourceID="XmlDataSource1" Height="200px" Width="100%" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:DataList ID="DataList2" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" CellSpacing="-1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="margin-left: 0px" Width="100%" BorderWidth="2px" OnItemCommand="DataList2_ItemCommand">
        <ItemTemplate>
            <div class="performdiv">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Image ID="Image2" runat="server" CssClass="prodimg" Height="250px" ImageUrl='<%# Eval("pimg") %>' Style="text-align: center" Width="250px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Product Name:-</td>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text='<%# Eval("pname") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Product Price:- </td>
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
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [item]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

