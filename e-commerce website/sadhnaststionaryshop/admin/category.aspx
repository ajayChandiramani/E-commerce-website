<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" Theme="admin" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .maindiv {
            text-align: center;
        }

        .grid {
            margin-left: 0px;
            font-size: x-large;
            text-align: center;
        }

        .auto-style2 {
            font-size: large;
            font-weight: 700;
            height: 41px;
            font-family: 'MS Gothic';
        }

        .auto-style3 {
            font-size: large;
            height: 41px;
            font-family: 'MS Gothic';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <hr />
    <asp:Label ID="Label1" runat="server" Text="Label" Style="font-weight: 700; margin-left: 150px; font-size: xx-large; color: #FFFFFF; text-align: center"></asp:Label>


    <div class="maindiv">
        <asp:Panel ID="Panel1" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style3"><strong>Enter Name of category:--</strong></td>
                    <td>
                        <asp:TextBox ID="TextBox1" CssClass="tt1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Plese Enter Category" ForeColor="Red" ControlToValidate="TextBox1" CssClass="validationct"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="auto-style2">Select category image:--</span></td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="resontxt" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Plese Select image" ForeColor="Red" ControlToValidate="FileUpload1" CssClass="validationct"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">

                        <asp:Button ID="Button4" CssClass="btn1" runat="server" Height="38px" Text="Add" Width="102px" Style="color: #FFFFFF; font-weight: 700; font-size: large; background-color: #47C9AF" OnClick="Button1_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br />
                        <asp:Label ID="Label2" runat="server" Style="color: #0000FF" Text="Category added successfully..."></asp:Label>

                        <br />
                        <asp:Label ID="erroradd" runat="server" Style="font-size: xx-large; color: #FF0000; text-align: center" Text="Plese Provide unique name"></asp:Label>

                    </td>
                </tr>
            </table>

        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Style="text-align: left">
            <asp:Label ID="error" runat="server" Text="Plese Provide unique name" Style="font-size: xx-large; color: #FF0000; text-align: center"></asp:Label>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="catid" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Category Name:-"></asp:Label>
                    <br />
                    <asp:TextBox ID="cattext" runat="server" CssClass="itempageinfotxt" placeholder="Enter Product Name" Text='<%# Eval("catnm") %>'></asp:TextBox>
                    <asp:Label ID="prvnm" runat="server" Text='<%# Eval("catnm") %>'></asp:Label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cattext" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Label5" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Category Image:-"></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="Image1" runat="server" CssClass="prodimg" Height="100px" ImageUrl='<%# Eval("catimg") %>' Width="100px" />
                    <br />
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="itempageinfotxt" />
                    <br />
                    <br />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Update Category" CausesValidation="False" CommandName="dofinalupdate" CssClass="uploadbtn" Width="160px" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:Label ID="catid" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT catid, catnm, catimg FROM cate WHERE (catid = @catid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="catid" DefaultValue="0" Name="catid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        </asp:Panel>
    </div>

    <br />
    <hr />



    &nbsp;<br />
    <asp:Label ID="Label3" runat="server" Style="color: #FF0000; font-weight: 700; font-size: x-large"></asp:Label>
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="catid" DataSourceID="SqlDataSource2" ForeColor="#333333" CssClass="grid" GridLines="None" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" Width="1097px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="prodimg" Height="100px" ImageUrl='<%# Eval("catimg") %>' Width="100px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="catid" HeaderText="catid" InsertVisible="False" ReadOnly="True" SortExpression="catid" />
            <asp:BoundField DataField="catnm" HeaderText="catnm" SortExpression="catnm" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton17" runat="server" CausesValidation="False" CommandArgument='<%# Eval("catid") %>' CommandName="edd">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="linkbuttondelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("catid") %>' CommandName="delete">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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
    &nbsp;&nbsp;&nbsp;
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="delete from cate where catid=@catid
"
           SelectCommand="SELECT * FROM [cate]">
           <DeleteParameters>
               <asp:Parameter Name="catid" />
           </DeleteParameters>
       </asp:SqlDataSource>

    <br />



</asp:Content>

