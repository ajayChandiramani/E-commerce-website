<%@ Page Title="" Language="C#"  Theme="admin" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="item_.aspx.cs" Inherits="item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    .auto-style2 {
            height: 29px;
        }
 
    
        .auto-style3 {
            color: #FFFFFF;
        }
        .auto-style4 {
            font-size: large;
            color: #FFFFFF;
            text-align: left;
        }
        .auto-style5 {
            height: 29px;
            font-size: large;
            color: #FFFFFF;
            text-align: left;
        }
        .auto-style6 {
            height: 26px;
            font-size: large;
            color: #FFFFFF;
            text-align: left;
        }
        .auto-style7 {
            font-size: medium;
        }
        .auto-style8 {
            font-weight: bold;
            font-size: large;
        }
 
    
        .auto-style9 {
            font-size: large;
            color: #FFFFFF;
            height: 33px;
            text-align: left;
        }
        .auto-style10 {
            height: 33px;
        }
 
    
        .auto-style11 {
            text-align: center;
        }
        .auto-style12 {
            height: 26px;
            text-align: center;
        }
 
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;" >    <tr>
            <td class="auto-style9">Enter Product Name:-</td>
            <td style="margin-left: 80px" class="auto-style10">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="resontxt"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Enter Product Price:-</td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="resontxt"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Enter Product Quantity:-</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="resontxt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Select&nbsp; Product Category:-</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="catnm" DataValueField="catnm" CssClass="auto-style7">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [cate]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Enter Product Image:-</td>
            <td class="auto-style2">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style7" />
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FileUpload1" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Enter Product Description:-</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="resontxt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Enter Estimeted Time To Deliver this product(in days):-</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="resontxt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" ErrorMessage="This Field is Required" ForeColor="Red" CssClass="auto-style8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
    
        <asp:Button ID="Button1" CssClass="btn1" runat="server" Height="38px" Text="Add item" Width="125px" style="color: #FFFFFF; font-weight: 700; font-size: large; background-color: #47C9AF" OnClick="Button1_Click" />
    
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Button ID="Button2" CssClass="btn1" runat="server" Height="38px" Text="View Uploaded Item" Width="246px" style="color: #FFFFFF; font-weight: 700; font-size: large; background-color: #47C9AF" OnClick="Button2_Click" CausesValidation="False" />
    
                <br />
        <asp:Label ID="Label1" runat="server" style="color: #0000FF; font-weight: 700; font-size: large;" Text="Item added successfully... :-) "></asp:Label>
    </td></tr></table>
    <hr style="height:2px; background-color: #FFFFFF;" />

                &nbsp;<br />
                <br />
                <br />
                <div class="itemdiv">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" Width="352px">
                        <ItemTemplate>
                            <div class="auto-style11">
                                <asp:Image ID="Image1" runat="server" CssClass="prodimg" Height="150px" ImageUrl='<%# Eval("pimg") %>' Width="150px" />
                                <br />
                            </div>
                            <hr />
                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style11">
                                        <asp:Label ID="Label2" runat="server" Style="font-weight: 700; color: #FFFFFF" Text='<%# Eval("pname") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11"><span class="auto-style3">Description:- </span>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("pdesc") %>' CssClass="auto-style3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11"><span class="auto-style3">Price:- </span>
                                    <asp:Label ID="Label4" runat="server" Style="font-size: x-large" Text='<%# Eval("pprice") %>' CssClass="auto-style3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11"><span class="auto-style3">Category:-</span><asp:Label ID="Label5" runat="server" Text='<%# Eval("pcate") %>' CssClass="auto-style3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12"><span class="auto-style3">Available Quantity:- </span>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("pquan") %>' CssClass="auto-style3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12"><span class="auto-style3">Estimated Delivery time:-&nbsp; </span>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ptime") %>' CssClass="auto-style3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <div class="auto-style11">
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, pname, pprice, pquan, pcate, pimg, pdesc, ptime FROM item WHERE (Id = (SELECT MAX(Id) AS Expr1 FROM item AS item_1))"></asp:SqlDataSource>
                <br />
                <br />
                <br />
    
        
    
</asp:Content>

