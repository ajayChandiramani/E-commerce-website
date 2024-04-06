<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="user_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>
 <table style="width: 100%;" border="2">
 <tr><td align="right" style="width:50%;">
 <asp:Label ID="Label1"
runat="server" Text="User Name :"> </asp:Label>
 </td><td style="width:50%;">
 <asp:UpdatePanel ID="UpdatePanel1"
runat="server">
 <ContentTemplate>
 <asp:TextBox ID="txtunm"
runat="server" AutoPostBack="True"
ontextchanged="txtunm_TextChanged"></asp:TextBox>
 <asp:Label ID="lblmsg"
runat="server"></asp:Label>
 </ContentTemplate>
 </asp:UpdatePanel>
 </td></tr>
 <tr><td align="right">
 <asp:Label ID="Label3" runat="server"
Text="Password :"> </asp:Label>
 </td><td>
 <asp:TextBox ID="txtpsw"
runat="server" TextMode="Password"></asp:TextBox>
 </td></tr>
 <tr><td colspan="2" align ="center" >
 <asp:UpdatePanel ID="UpdatePanel2"
runat="server">
 <ContentTemplate>
 <asp:Button ID="btncreate"
runat="server" Text="Create Account"
onclick="btncreate_Click" />
 &nbsp;<asp:Button
ID="Button1" runat="server" OnClick="Button1_Click"
Text="cancel" />
 </ContentTemplate>
 </asp:UpdatePanel>
 </td></tr></table>    </form>
    </body>
</html>
