<%@ Page Language="C#" AutoEventWireup="true" Theme="user" CodeFile="message.aspx.cs" Inherits="user_message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .message {
            background-color:#2874f0;
            height:400px;
            width:800px;
            margin-left:350px;
            margin-top:180px;
            border-radius:20px;
            box-shadow:20px 20px 40px black;


        }
        .auto-style1 {
            background-color: #2874f0;
            height: 400px;
            width: 800px;
            margin-left: 350px;
            margin-top: 180px;
            border-radius: 20px;
            box-shadow: 20px 20px 40px black;
            color: #FFFFFF;
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <asp:Panel ID="Panel1" runat="server">
            <div class="auto-style1">
                <br />
                <br />
                <br />
                <br />
                <strong style="font-family:'Comic Sans MS';">Order Placed Successfully.... :-) </strong>
            </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
