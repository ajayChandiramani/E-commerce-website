<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="cartbuy.aspx.cs" Inherits="user_cartbuy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .message {
            background-color:#2874f0;
            height:400px;
            width:800px;
            margin-left:350px;
            margin-top:180px;
            border-radius:20px;
            box-shadow:20px 20px 40px black;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
    <asp:Panel ID="messagepanel3" runat="server" Visible="False">
            <div class="message">
                
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <strong style="font-family:'Comic Sans MS';color: #FFFFFF;font-size: xx-large;">
                    Order Placed Successfully.... :-) </strong>
            </div>
        </asp:Panel>
   
    
    <asp:Panel ID="Panel3" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="finaluserinfobuy">
                <div class="finalbuyheader">
                    <span class="digit">1.</span>
                    <span class="txt">Login detail</span>
                </div>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="naamemo">
                            <span class="auto-style1">Name:</span>
                            <asp:Label ID="Label4" runat="server" style="color: #000000; font-size: 20px;" Text='<%# Eval("name") %>'></asp:Label>
                            <br />
                            <span class="auto-style1">Mobile Number:</span>
                            <asp:Label ID="Label5" runat="server" style="font-size: 20px;" Text='<%# Eval("mob") %>'></asp:Label><br />
                            <asp:Button ID="continue" runat="server" CssClass="buybtn" Text="Continue" OnClick="continue_Click" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <div class="finalbuyloginfea">


                    <span class="auto-style2">Avantages of login...</span><br />
                    <br />
                    <span class="auto-style3">- Easily add product to add to cart and buy it</span><br class="auto-style3" /> <span class="auto-style3">- Grate user Exprince</span><br class="auto-style3" /> <span class="auto-style3">- Know Your privous order</span></div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, name, usernm, addr, city, pincode, gen, mob, email, pass, userimg FROM cust WHERE (usernm = @usernm)">
                    <SelectParameters>
                        <asp:SessionParameter Name="usernm" SessionField="user" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
                <div class="displayviews">
                    <span class="digit">1.</span>
                    <span class="txt">Login detail</span>
                    <asp:Button ID="Button2" runat="server" Text="View"  Height="40px" style="color: #2874F0; border:none; border-radius:10px; margin-left: 280px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" />
                </div>
            <div class="finaluserinfobuy">
                <div class="finalbuyheader">
                    <span class="digit">2.</span>
                    <span class="txt">DeliVery Address</span>
                </div>
                <asp:DataList ID="DataList2" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="naamemo">
                            &nbsp;<asp:Label ID="Label4" runat="server" style="color: #000000; font-size: 20px;" Text='<%# Eval("name") %>'></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="Label5" runat="server" style="font-size: 20px;" Text='<%# Eval("mob") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label6" runat="server" style="font-size: large" Text='<%# Eval("addr") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="deliveryhear" runat="server" CssClass="buybtn" Text="DELIVER HERE" OnClick="deliver_click" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                
            
             </div>
            
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="displayviews">
                    <span class="digit">1.</span>
                    <span class="txt">Login detail</span>
                    <asp:Button ID="Button3" runat="server" Text="View" Height="40px" style="color: #2874F0; border:none; border-radius:10px; margin-left: 300px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview1" />
            </div>
            <div class="displayviews">
                    <span class="digit">2.</span>
                    <span class="txt">Delivery detail</span>
                    <asp:Button ID="Button4" runat="server" Text="View" Height="40px" style="color: #2874F0; border:none; border-radius:10px; margin-left: 280px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview2"  />
                </div>
            <div class="finaluserinfobuyview3">
                <div class="finalbuyheader">
                    <span class="digit">3.</span>
                    <span class="txt">Order Summary</span>
                </div>
                <asp:DataList ID="DataList3" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" OnItemCommand="DataList3_ItemCommand">
                    <FooterTemplate>
                        <asp:Button ID="view3conti" runat="server" CssClass="buybtn" OnClick="gotoview4" Text="Continue" />
                    </FooterTemplate>
                    <ItemTemplate>
                       <div class="finalproimg">
                            <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("pimg") %>' Width="200px" />

                        </div>
                        <div class="finalprodetail" >
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>' style="font-size: x-large"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label7" runat="server" style="color: #999999; font-size: large;" Text='<%# Eval("pdesc") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label8" runat="server" style="font-size: xx-large" Text='<%# Eval("pprice") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("pquan") %>'></asp:Label>
                        </div>
    
                    </ItemTemplate>
                </asp:DataList>
                        
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT cartpro.pid, item.Id, item.pname, item.pprice, item.pquan, item.pcate, item.pimg, item.pdesc, item.ptime FROM cartpro INNER JOIN item ON cartpro.pid = item.Id WHERE (cartpro.usernm = @unm)">
                    <SelectParameters>
                        <asp:SessionParameter Name="unm" SessionField="user" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        
            </div>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <div class="displayviews">
                    <span class="digit">1.</span>
                    <span class="txt">Login detail</span>
                    <asp:Button ID="view4btn" runat="server" Text="View" Height="40px" style="color: #2874F0; border:none; border-radius:10px; margin-left: 300px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview1" />
            </div>
            <div class="displayviews">
                    <span class="digit">2.</span>
                    <span class="txt">Delivery detail</span>
                    <asp:Button ID="view4btn2" runat="server" Text="View" Height="40px" style="color: #2874F0; border:none; border-radius:10px; margin-left: 280px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview2"  />
             </div>
            <div class="displayviews">
                    <span class="digit">3.</span>
                    <span class="txt">Product detail</span>
                    <asp:Button ID="viewbtn2" runat="server" Text="View" Height="40px" style="color: #2874F0; border:none; border-radius:10px; margin-left: 300px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview3" />
            </div>
            <div class="finaluserinfobuy" style="height:300px;">
                <div class="finalbuyheader">
                    <span class="digit">4.</span>
                    <span class="txt">Payment detail</span>
                </div>
                <asp:RadioButton ID="RadioButton1" Text="Upi" GroupName="payment" runat="server" CssClass="finalbuyradio" style="font-size: x-large" OnCheckedChanged="kk" AutoPostBack="True" />

                <br />
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <div class="finalbuypanel1">
                        <asp:TextBox ID="TextBox1" placeholder="Enter Upi id" CssClass="userlogintxt" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Plese enter upi id" style="font-weight: 700; font-size: large; color: #FF0000"></asp:RequiredFieldValidator>
                        <asp:Button ID="View4buy" CssClass="uniquebuybtn" runat="server" Text="Pay" OnClick="Button1_Click" />
                    </div>
                </asp:Panel>


              <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" CssClass="finalbuyradio" Checked="True" GroupName="payment" Text="Cash on delivery" OnCheckedChanged="RadioButton2_CheckedChanged" />


                <br />
                <asp:Panel ID="Panel2" runat="server">
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Height="25px" style="color: #FFFFFF; font-weight: 700; background-color: #006600; font-size: large; margin-left: 99px; margin-top: 6px;" Width="50px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter captcha code" CssClass="userlogintxt"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Plese Enter Valid captcha" style="font-weight: 700; font-size: large; color: #FF0000"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    
                    <asp:Button ID="Button1"  runat="server" CssClass="uniquebuybtn" Text="Pay" OnClick="Button1_Click" Width="100px" CommandName="realpay" />
                    <br />
                </asp:Panel>


                <br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <br />


            </div>
            
            

        </asp:View>
    </asp:MultiView>
    </asp:Panel>
</asp:Content>

