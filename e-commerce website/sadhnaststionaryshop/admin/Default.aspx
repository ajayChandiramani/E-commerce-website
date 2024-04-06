<%@ Page Language="C#" AutoEventWireup="true" Theme="admin" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="name">
            AHK Stationary Shop
        </div>
        
        <div class="userloginmain">
            <div class="userlogininnerdiv">
                <h2 class="txtajay">Login....<br />
                    Welcome to our website
                    <br />
                    and enjoy our valuable functionality :-) </h2>
            </div>
            <div class="userlogincontent">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="userlogintxt" placeholder="Enter UserName"></asp:TextBox>
               
                <br />
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="loginvalidation" ErrorMessage="Plese Enter Username"></asp:RequiredFieldValidator>
                
                <br />
                <br />
                <br />
                
                <asp:TextBox ID="TextBox2" runat="server" CssClass="userlogintxt" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                <br />
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="loginvalidation" ErrorMessage="Plese Enter Password"></asp:RequiredFieldValidator>
                
                <br />
                <br />
                <br />
                <b>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="cap" Enabled="False"></asp:TextBox>
                <br />
                </b>
                <br />
                <asp:TextBox ID="TextBox4" runat="server" CssClass="userlogintxt" placeholder="Enter above captcha code"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Captcha Code is invalid :-(" ForeColor="Red" SetFocusOnError="True" style="color: #FF0000;" CssClass="loginvalidation">Captcha Code is invalid :-(</asp:CompareValidator>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" CssClass="userloginbtn" OnClick="Button1_Click" Text="Login" />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </form>
    </body>
</html>
