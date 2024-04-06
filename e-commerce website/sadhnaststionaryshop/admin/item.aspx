<%@ Page Title="" Language="C#" Theme="admin" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="item.aspx.cs" Inherits="admin_item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="itemmain">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h1 style="text-align: center">
            <asp:Label ID="Label8" runat="server" Text="Add New Item" Style="color: #0000CC"></asp:Label>
        </h1>
        <div class="itemaddimg">
            <asp:Label ID="Label1" runat="server" Style="font-size: 20pt" Text="Add Image"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="resontxt" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:Label ID="message" runat="server" Style="color: #FF0000;"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="uploadbtn" OnClick="uploadimg" Text="Upload" />
                    <br />
                    <asp:Image ID="Image1" runat="server" CssClass="itempageimage" Height="250px" Width="250px" />
                    <br />
                    <br />
                </ContentTemplate>

                <Triggers>
                    <asp:PostBackTrigger ControlID="Button1" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="itemaddimfo">

            <br />
            <asp:Label ID="Label2" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Product Name:-"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Product Name" CssClass="itempageinfotxt"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Product Price:-"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Product Name" CssClass="itempageinfotxt"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" CssClass="validationct" ErrorMessage="You can only enter number" ForeColor="Red" MaximumValue="1000000" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="proinfo"></asp:RangeValidator>
            <br />
            <asp:Label ID="Label4" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Product Quantity:-"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Product Name" CssClass="itempageinfotxt"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox3" CssClass="validationct" ErrorMessage="You can only enter number" ForeColor="Red" MaximumValue="5000" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="proinfo"></asp:RangeValidator>
            <br />
            <asp:Label ID="Label5" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Product Category:-"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="itempageinfotxt" DataSourceID="SqlDataSource1" DataTextField="catnm" DataValueField="catnm">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Product Description:-"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Product Name" CssClass="itempageinfotxt" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox4" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label7" runat="server" Style="font-size: 15pt; margin-left: 20px; font-family: 'Comic Sans MS'; color: #2874F0;" Text="Enter Estimeted Time To Deliver this product(in days):-"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server" CssClass="itempageinfotxt" placeholder="Enter Product Name"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox5" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="proinfo"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TextBox5" CssClass="validationct" ErrorMessage="You can only enter number" ForeColor="Red" MaximumValue="10" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="proinfo"></asp:RangeValidator>
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="itempublishbtn" Text="Publish Item" OnClick="uploadinfo" ValidationGroup="proinfo" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [cate]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

