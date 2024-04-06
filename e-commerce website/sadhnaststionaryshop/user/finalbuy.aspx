<%@ Page Title="" Language="C#" Theme="user" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="finalbuy.aspx.cs" Inherits="user_finalbuy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #999999;
            font-size: large;
        }

        .auto-style2 {
            color: #999999;
            margin-left: 30px;
            display: inline-block;
            margin-top: 30px;
            font-size: large;
        }

        .auto-style3 {
            font-size: large;
        }

        .finalbuyradio {
            font-size: x-large;
        }

        .buybtn {
            margin-left: 0px;
        }

        .userlogintxt {
            margin-left: 0px;
        }

        .message {
            background-color: #2874f0;
            height: 400px;
            width: 800px;
            margin-left: 350px;
            margin-top: 180px;
            border-radius: 20px;
            box-shadow: 20px 20px 40px black;
        }

        .auto-style4 {
            color: #999999;
            font-size: xx-large;
        }

        .auto-style5 {
            font-size: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="productdecri">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:DataList ID="DataList4" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
            <ItemTemplate>
                <asp:Image ID="Image2" CssClass="jjj" runat="server" ImageUrl='<%# Eval("pimg") %>' Height="300px" Width="300px" />

                <br />

                <br />
                <br />
                <span class="auto-style4">Product Name:</span>
                <asp:Label ID="Label4" runat="server" Style="color: #000000; font-size: 40px;" Text='<%# Eval("pname") %>'></asp:Label>
                <br />
                <span class="auto-style4">Product Price:</span>
                <asp:Label ID="Label5" runat="server" Style="color: #000000; font-size: 40px;" Text='<%# Eval("pprice") %>'></asp:Label>
                <span class="auto-style5">₹</span><br />
            </ItemTemplate>

        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [item]"></asp:SqlDataSource>

    </div>
    <div style="text-align: center">
        <asp:Panel ID="messagepanel3" runat="server">
            <div class="message">

                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <strong style="font-family: 'Comic Sans MS'; color: #FFFFFF; font-size: xx-large;">Order Placed Successfully.... :-) </strong>
            </div>
        </asp:Panel>
    </div>

    <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
    <div class="allmain">
        <asp:Panel ID="maincontent" runat="server">
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
                                    <asp:Label ID="Label4" runat="server" Style="color: #000000; font-size: 20px;" Text='<%# Eval("name") %>'></asp:Label>
                                    <br />
                                    <span class="auto-style1">Mobile Number:</span>
                                    <asp:Label ID="Label5" runat="server" Style="font-size: 20px;" Text='<%# Eval("mob") %>'></asp:Label><br />
                                    <asp:Button ID="continue" runat="server" CssClass="buybtn" Text="Continue" OnClick="continue_Click" />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="finalbuyloginfea">


                            <span class="auto-style2">Avantages of login...</span><br />
                            <br />
                            <span class="auto-style3">- Easily add product to add to cart and buy it</span><br class="auto-style3" />
                            <span class="auto-style3">- Grate user Exprince</span><br class="auto-style3" />
                            <span class="auto-style3">- Know Your privous order</span>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, name, usernm, addr, city, pincode, gen, mob, email, pass, userimg FROM cust WHERE (usernm = @usernm)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label3" Name="usernm" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="displayviews">
                        <span class="digit">1.</span>
                        <span class="txt">Login detail</span>
                        <asp:Button ID="Button2" runat="server" Text="View" Height="40px" Style="color: #2874F0; border: none; border-radius: 10px; margin-left: 280px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" />
                    </div>
                    <div class="finaluserinfobuy">
                        <div class="finalbuyheader">
                            <span class="digit">2.</span>
                            <span class="txt">DeliVery Address</span>
                        </div>
                        <asp:DataList ID="DataList2" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="naamemo">
                                    &nbsp;<asp:Label ID="Label4" runat="server" Style="color: #000000; font-size: 20px;" Text='<%# Eval("name") %>'></asp:Label>
                                    &nbsp;&nbsp;
                            <asp:Label ID="Label5" runat="server" Style="font-size: 20px;" Text='<%# Eval("mob") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label6" runat="server" Style="font-size: large" Text='<%# Eval("addr") %>'></asp:Label>
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
                        <asp:Button ID="Button3" runat="server" Text="View" Height="40px" Style="color: #2874F0; border: none; border-radius: 10px; margin-left: 300px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview1" />
                    </div>
                    <div class="displayviews">
                        <span class="digit">2.</span>
                        <span class="txt">Delivery detail</span>
                        <asp:Button ID="Button4" runat="server" Text="View" Height="40px" Style="color: #2874F0; border: none; border-radius: 10px; margin-left: 280px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview2" />
                    </div>
                    <div class="finaluserinfobuyview3">
                        <div class="finalbuyheader">
                            <span class="digit">3.</span>
                            <span class="txt">Order Summary</span>
                        </div>
                        <asp:DataList ID="DataList3" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" OnItemCommand="DataList3_ItemCommand1">
                            <ItemTemplate>
                                <div class="finalproimg">
                                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("pimg") %>' Width="200px" />

                                </div>
                                <div class="finalprodetail">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>' Style="font-size: x-large"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Style="color: #999999; font-size: large;" Text='<%# Eval("pdesc") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label8" runat="server" Style="font-size: xx-large" Text='<%# Eval("pprice") %>'></asp:Label>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("pprice") %>' Visible="False"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="plusbtn" runat="server" OnClick="plusbtn_Click" Text="+" CausesValidation="False" CssClass="finalbuyquanbtn" />
                                            <asp:TextBox ID="quantext" runat="server" Enabled="False">1</asp:TextBox>
                                            <asp:Button ID="minusbtn" runat="server" Text="-" CssClass="finalbuyquanbtn" OnClick="minusbtn_Click" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="plusbtn" />
                                            <asp:PostBackTrigger ControlID="minusbtn" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:Button ID="view3conti" runat="server" Text="Continue" CssClass="buybtn" OnClick="gotoview4" />
                                </div>

                            </ItemTemplate>
                        </asp:DataList>

                        <br />
                        <br />



                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from item where id=@id">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div class="displayviews">
                        <span class="digit">1.</span>
                        <span class="txt">Login detail</span>
                        <asp:Button ID="view4btn" runat="server" Text="View" Height="40px" Style="color: #2874F0; border: none; border-radius: 10px; margin-left: 300px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview1" CausesValidation="False" />
                    </div>
                    <div class="displayviews">
                        <span class="digit">2.</span>
                        <span class="txt">Delivery detail</span>
                        <asp:Button ID="view4btn2" runat="server" Text="View" Height="40px" Style="color: #2874F0; border: none; border-radius: 10px; margin-left: 280px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview2" CausesValidation="False" />
                    </div>
                    <div class="displayviews">
                        <span class="digit">3.</span>
                        <span class="txt">Product detail</span>
                        <asp:Button ID="viewbtn2" runat="server" Text="View" Height="40px" Style="color: #2874F0; border: none; border-radius: 10px; margin-left: 300px; background-color: #FFFFFF; margin-top: 12px;" Width="100px" OnClick="gotoview3" CausesValidation="False" />
                    </div>
                    <div class="finaluserinfobuy" style="height: 300px;">
                        <div class="finalbuyheader">
                            <span class="digit">4.</span>
                            <span class="txt">Payment detail</span>
                        </div>
                        <asp:RadioButton ID="RadioButton1" Text="Upi" GroupName="payment" runat="server" CssClass="finalbuyradio" Style="font-size: x-large" OnCheckedChanged="kk" AutoPostBack="True" />

                        <br />
                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                            <div class="finalbuypanel1">
                                <asp:TextBox ID="TextBox1" placeholder="Enter Upi id" CssClass="userlogintxt" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Plese enter upi id" Style="font-weight: 700; font-size: large; color: #FF0000"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Button ID="View4buy" CssClass="uniquebuybtn" runat="server" Text="Pay" OnClick="Button1_Click" />
                            </div>
                        </asp:Panel>


                        <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" CssClass="finalbuyradio" Checked="True" GroupName="payment" Text="Cash on delivery" OnCheckedChanged="RadioButton2_CheckedChanged" />


                        <br />
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Height="25px" Style="color: #FFFFFF; font-weight: 700; background-color: #006600; font-size: large; margin-left: 99px; margin-top: 6px;" Width="50px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter captcha code" CssClass="userlogintxt"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Plese Enter Valid captcha" Style="font-weight: 700; font-size: large; color: #FF0000"></asp:RequiredFieldValidator>
                            <br />
                            <br />

                            <asp:Button ID="Button1" runat="server" CssClass="uniquebuybtn" Text="Pay" OnClick="Button1_Click" Width="400px" />
                            <br />
                        </asp:Panel>


                        <br />
                        <br />
                        <br />
                        <br />


                    </div>



                </asp:View>
            </asp:MultiView>
        </asp:Panel>
    </div>
</asp:Content>

