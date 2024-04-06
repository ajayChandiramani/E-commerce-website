<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" Theme="admin" AutoEventWireup="true" CodeFile="edititem.aspx.cs" Inherits="edititem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [item]"></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="performdiv">
                    <table style="width: 100%;" class="hovereff">
                        <tr>
                            <td class="auto-style1" colspan="2">
                                <asp:Image ID="Image1" runat="server" Height="150px" CssClass="prodimg" ImageUrl='<%# Eval("pimg") %>' Style="text-align: center" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Product Name:-</td>
                            <td class="auto-style4">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>' CssClass="auto-style3"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Product Price:- </td>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("pprice") %>' CssClass="auto-style3"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:LinkButton ID="LinkButton17" runat="server" CssClass="edit" CommandArgument='<%# Eval("Id") %>' Style="font-size: x-large; text-decoration: none; color: #FFFFFF; background-color: #663399; border-radius: 20px; text-align: center;" Width="90px" CommandName="edit">Edit</asp:LinkButton>
                                &nbsp;&nbsp;
                            </td>
                            <td class="auto-style1">
                                <asp:LinkButton ID="LinkButton18" CssClass="delete" runat="server" CommandArgument='<%# Eval("Id") %>' Style="font-size: x-large; text-decoration: none; color: #FFFFFF; background-color: #FF0000; border-radius: 20px; text-align: center;" Width="100px" CommandName="delete">Delete</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:Label ID="Label3" runat="server"></asp:Label>
    </div>
</asp:Content>

