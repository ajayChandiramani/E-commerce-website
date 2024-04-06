<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .userlogincontent {
            background-color: #FFFFFF;
        }
        .cap {
            color: #000000;
        }
        .userloginlink {
            font-weight: 700;
        }   
        .registerlink {
            font-weight: 700;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />
    
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            
        <asp:ValidationSummary runat="server" ShowMessageBox="true" HeaderText="Error"></asp:ValidationSummary>
            <div class="userloginmain">
        
        <div class="userlogininnerdiv">
           <h2 class="txtajay"> Login...<br />
            Get access to buy product <br />
            and more facility..... :-)    </h2>

        </div>
        <div class="userlogincontent">
            
        <asp:TextBox ID="TextBox1" CssClass="userlogintxt" runat="server" placeholder="Enter UserName"></asp:TextBox>
        <asp:TextBox ID="TextBox2" CssClass="userlogintxt" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            <br />
           <b> <asp:TextBox ID="TextBox3" CssClass="cap" runat="server" Enabled="False"></asp:TextBox></b><br />
            <asp:TextBox ID="TextBox4" CssClass="userlogintxt" runat="server" placeholder="Enter above captcha code"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Captcha Code is invalid :-(" ForeColor="Red" SetFocusOnError="True" style="font-weight: 700; font-size: large">*</asp:CompareValidator>
           <br /> <asp:Button ID="Button1" CssClass="userloginbtn" runat="server" Text="Login" OnClick="Button1_Click" /><br /><br /><br /><br />
            <asp:LinkButton ID="LinkButton1" CssClass="userloginlink" runat="server" OnClick="LinkButton1_Click" CausesValidation="False">don&#39;t have account? create new account</asp:LinkButton>

        </div>
        
    </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            
                <div class="registercontent">
                    <h2 style="margin-left:80px;color:royalblue">Provide Your Valuable information:-</h2>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="registertxt" placeholder="Enter Name:-"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
 <asp:TextBox ID="txtunm" placeholder="Enter Username" CssClass="registertxt"
runat="server"
ontextchanged="txtunm_TextChanged"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtunm" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
 <asp:Label ID="lblmsg"
runat="server" CssClass="validationct" ForeColor="Red" style="font-size: medium"></asp:Label>
 
 
                    <br />
 
 
                    <br />
 
 
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="registertxt" TextMode="MultiLine" placeholder="Enter Address:-"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox7" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="registertxt" placeholder="Enter City:-"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox8" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="registertxt" placeholder=" Enter Pincode:-"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RadioButton ID="RadioButton1" Text="Male" runat="server" CssClass="registerrd" GroupName="gender" Checked="True" />
                    <asp:RadioButton ID="RadioButton2" Text="Female" runat="server" CssClass="registerrd" GroupName="gender" />
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="registertxt" placeholder="Enter Mobile Number:-"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox10" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="registertxt" placeholder="Enter Email Address:-"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox11" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="registertxt" placeholder="Enter Password:-" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox12" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBox13" runat="server" CssClass="registertxt" TextMode="Password" placeholder="Confrim Password:-"></asp:TextBox>
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox13" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="TextBox12" ControlToValidate="TextBox13" CssClass="validationct" ErrorMessage="Check both Password"></asp:CompareValidator>
                    <br />
                    <h2 style="margin-top:-20px;margin-left:70px; margin-bottom:0px">Upload Your Photo:-</h2> 
                    <br /> 
                    <asp:FileUpload ID="FileUpload1" class="registertxt" runat="server" placeholder="upload" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="FileUpload1" CssClass="validationct" ErrorMessage="*This Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="Button10" CssClass="userloginbtn" runat="server" Text="Register" OnClick="Button10_Click" />
                    <br />
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton2" CssClass="registerlink" runat="server" OnClick="LinkButton2_Click1" CausesValidation="False">Existing User? Log in</asp:LinkButton>
                    </div>
           
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="userloginmain">
                <div class="userlogininnerdiv">
                    <h2 class="txtajay"> Login...<br />
                        Get access to buy product <br />
                        and more facility..... :-)    
                    </h2>

               </div>
                <div class="userlogincontent">
                    <h1>
                        Hii     <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        !! You already have a account!!!
                    </h1>
                </div>
          </div>
            
        
        </asp:View>
    </asp:MultiView>
    
</asp:Content>

