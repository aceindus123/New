<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="_3Tier.Feedback" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajx:ToolkitScriptManager ID="as" runat="server"></ajx:ToolkitScriptManager>

    <table class="body">

         <tr>
                <td width="100%" align="center">
                    <table align="center" style="background-color:#730528; width:100%; height:32px;" >
                        <tr >
                            <td align="center"  width="30%">
                                <asp:TextBox ID="txtloc" runat="server" Width="60%" Height="32px" CssClass="border" Font-Size="17px" AutoPostBack="true"
                                     placeholder="State" OnTextChanged="txtloc_TextChanged" ></asp:TextBox>
                                 <ajx:AutoCompleteExtender ID="autoCompleteExtender2" runat="server" TargetControlID="txtloc"
                                     Enabled="true"  ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
                                     CompletionSetCount="5" EnableCaching="false" />
                            </td>
                            <td  width="50%">
                                <asp:TextBox ID="txtsearch" runat="server" Width="85%" Height="32px"  CssClass="border"   
                                     Font-Size="17px" placeholder="Search Category/ Sub Category"></asp:TextBox>
                                  <ajx:AutoCompleteExtender ID="autoCompleteExtender1" runat="server" TargetControlID="txtsearch"
                                     Enabled="true"  ServiceMethod="GetCompletionList1" MinimumPrefixLength="1"
                                     CompletionSetCount="5" EnableCaching="false" />
                            </td>
                           <td align="center" width="20%">
                                 <asp:ImageButton ID="imgsearch" runat="server" ImageUrl="~/Images/Buttonasearch.png"  OnClick="imgsearch_Click" />
                             </td>
                        </tr>
                    </table>
                </td>
            </tr>

             <tr>
                <td valign="top">
                     <ajx:modalpopupextender ID="model" runat="server" TargetControlID="txtloc" 
          CancelControlID="Button3" DropShadow="false" PopupControlID="pnlAtoZ"></ajx:modalpopupextender>
    
            <asp:Panel ID="pnlAtoZ" runat="server" Visible="false " style="width: 53%;height:auto;background-color:white;" HorizontalAlign="Center">
               <table border="0" cellpadding="0" cellspacing="0" style="width:  100%;padding-top:20px;">
                     <tr>       
                        <td  width="50%"  style="padding-left:10px;" >

                            <asp:Label ID="lbl" runat="server" Text="Select  City"  Font-Size="18px"  ></asp:Label>
                             </td>
                            <td   width="20%" align="right">
                            <asp:Button ID="Button3" runat="server" Text="X" Font-Size="Medium"  
                                BackColor="White" BorderStyle="None"
                                Width="10%"  ForeColor="Red" Font-Bold="true" />
                         </td>
                    </tr>

                    <tr><td>&nbsp;</td></tr>

                     <tr>
                        <td align="left" style="padding-left:5px;" colspan="2" width=" 65%">
                            <asp:Label ID="Label3" runat="server" Text="Popular Cities" ForeColor="Orange" Font-Bold="true" Font-Size="14px"
                                 Font-Names="Arial, Helvetica, sans-serif"></asp:Label>
                            &nbsp; &nbsp; &nbsp; &nbsp;
                     
                   <asp:LinkButton ID="A" runat="server" Text="A" Font-Underline="true" Font-Overline="false" CommandArgument="A" OnCommand="get_city" 
                        CssClass="color" Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px"/>&nbsp;&nbsp;
                      
                    <asp:LinkButton ID="B" runat="server" Text="B" Font-Overline="false"  Font-Underline="true" CommandArgument="B" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                       
                    <asp:LinkButton ID="C" runat="server" Text="C" Font-Overline="false" Font-Underline="true" CommandArgument="C" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                          
                     <asp:LinkButton ID="D" runat="server" Text="D" Font-Overline="false"  Font-Underline="true" CommandArgument="D" OnCommand="get_city"
                        CssClass="color" Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                    
                    <asp:LinkButton ID="E" runat="server" Text="E" Font-Overline="false"  Font-Underline="true" CommandArgument="E" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
            
                    <asp:LinkButton ID="F" runat="server" Text="F" Font-Overline="false"  Font-Underline="true" CommandArgument="F" OnCommand="get_city"
                       CssClass="color" Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                       
                    <asp:LinkButton ID="G" runat="server" Text="G" Font-Overline="false"  Font-Underline="true" CommandArgument="G" OnCommand="get_city"
                        CssClass="color" Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                        
                    <asp:LinkButton ID="H" runat="server" Text="H" Font-Overline="false"  Font-Underline="true" CommandArgument="H" OnCommand="get_city"
                        CssClass="color" Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
        
                    <asp:LinkButton ID="I" runat="server" Text="I" Font-Overline="false"  Font-Underline="true" CommandArgument="I" OnCommand="get_city"
                        CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                   
                    <asp:LinkButton ID="J" runat="server" Text="J" Font-Overline="false" Font-Underline="true" CommandArgument="J" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
          
                    <asp:LinkButton ID="K" runat="server" Text="K" Font-Overline="false" Font-Underline="true" CommandArgument="K" OnCommand="get_city"
                      CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true" Font-Size="12px" />&nbsp;&nbsp;
                       
                    <asp:LinkButton ID="L" runat="server" Text="L" Font-Overline="false"  Font-Underline="true" CommandArgument="L" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                      
                    <asp:LinkButton ID="M" runat="server" Text="M" Font-Overline="false"  Font-Underline="true" CommandArgument="M" OnCommand="get_city"
                      CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                        
                    <asp:LinkButton ID="N" runat="server" Text="N" Font-Overline="false"  Font-Underline="true" CommandArgument="N" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                      
                    <asp:LinkButton ID="O" runat="server" Text="O" Font-Overline="false"  Font-Underline="true" CommandArgument="O" OnCommand="get_city"
                      CssClass="color"   Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                          
                    <asp:LinkButton ID="P" runat="server" Text="P" Font-Overline="false"  Font-Underline="true" CommandArgument="P" OnCommand="get_city"
                       CssClass="color" Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                           
                    <asp:LinkButton ID="Q" runat="server" Text="Q" Font-Overline="false"  Font-Underline="true" CommandArgument="Q" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                          
                    <asp:LinkButton ID="R" runat="server" Text="R" Font-Overline="false"  Font-Underline="true" CommandArgument="R" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                        
                    <asp:LinkButton ID="S" runat="server" Text="S" Font-Overline="false"  Font-Underline="true" CommandArgument="S" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                       
                    <asp:LinkButton ID="T" runat="server" Text="T" Font-Overline="false"  Font-Underline="true" CommandArgument="T" OnCommand="get_city"
                      CssClass="color"   Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                          
                    <asp:LinkButton ID="U" runat="server" Text="U" Font-Overline="false"  Font-Underline="true" CommandArgument="U" OnCommand="get_city"
                      CssClass="color"   Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                       
                    <asp:LinkButton ID="V" runat="server"  Text="V"  Font-Bold="true"  Font-Underline="true" CommandArgument="V" OnCommand="get_city"
                       CssClass="color" Font-Overline="false"  Font-Names="Arial, Helvetica, sans-serif" Font-Size="12px" />&nbsp;&nbsp;
                       
                    <asp:LinkButton ID="W" runat="server" Text="W" Font-Overline="false"  Font-Underline="true" CommandArgument="W" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                      
                   <asp:LinkButton ID="X" runat="server" Text="X" Font-Overline="false"  Font-Underline="true" CommandArgument="X" OnCommand="get_city"
                       CssClass="color"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;
                          
                    <asp:LinkButton ID="Y" runat="server" Text="Y" Font-Overline="false"  Font-Underline="true" CommandArgument="Y" OnCommand="get_city"
                      CssClass="color"   Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />&nbsp;&nbsp;

                      <asp:LinkButton ID="Z" runat="server" Text="Z" Font-Overline="false"  Font-Underline="true" CommandArgument="Z" OnCommand="get_city"
                      CssClass="color"   Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />
                </td>

                    </tr>

                    <tr><td  height="10"></td></tr>
              </table>

              <table border="0" cellpadding="0" cellspacing="0" Width="90%" align="center"> 
                <tr>
                    <td style="width:80%; padding-left:30px;" valign="top">
                        <asp:Panel ID="pnl_othcities" runat="server" Width="90%">
        
                            <asp:DataList ID="dl_bindcities" runat="server" RepeatColumns="4" Height="0px">
                            <ItemTemplate>
                            <asp:Button ID="lnkothcities" runat="server" Text='<%#Eval("cityname")%>' BorderStyle="None" BackColor="White" CssClass="pointer" 
                                CommandArgument='<%#Eval("cityname")%>' OnCommand="selectcity" Font-Size="Medium" Font-Underline="false" />&nbsp;&nbsp;&nbsp;
                            </ItemTemplate>
                            </asp:DataList>
                        </asp:Panel>
                    </td>
               </tr>

                  <tr>
                      <td>
                          <asp:Label ID="LinkButton1" runat="server" Text="No Cities Found" 
                               Visible="false"  Font-Names="Arial, Helvetica, sans-serif" Font-Bold="true"  Font-Size="12px" />
                      </td>
                  </tr>
               </table>
            </asp:Panel>

         </td>
            </tr>

             <tr>
        <td style="background-image:url(images/middle_strip.png); background-position:center; background-repeat:repeat-Y;">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="100%" align="left" valign="top" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
              <tr>
                <td align="center" valign="middle" style="background-color:#f4f4f4; border-radius:5px; padding-top:5px;">
                    <table width="95%" border="0" align="center">
                              <tr>
                                <td colspan="3" align="center" valign="middle"><font style="font-weight:normal; font-size:22px; color:#006600; text-decoration:none; font-family:vani;">
                                    Feed Back Form</font></td>
                              </tr>
                              <tr>

                              <td style="font-family:Arial; font-size:17px;color: #1e5784;" align="center" colspan="4">
                                 Your valuable feedback will elevate our team spirit to work even harder for providing well-organized services.  
                              </td>

                              </tr>

                              <tr>
                              <td>
                                  &nbsp;
                              </td>
                              </tr>

                              <tr>

                              <td align="left" colspan="1" width="25%"> 
                                <asp:Image ID="feed1" runat="server" ImageUrl="images/feedback.jpg"  />
                              </td>

                           <td align="left" valign="middle" width="75%">
                                <table width="95%" border="0" align="left">
                                  <tr>
                                    <td width="30%" align="left" valign="middle" class="content" ><b>Your Name </b></td>
                                    <td width="5%" align="center" valign="middle" class="content"><b>:</b></td>
                                    <td height="20" align="left" valign="middle">
                                    <asp:TextBox id="txtfname" runat="server" style="width:250px; height:20px;" Font-Size="12"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ForeColor="Red"
                                            ErrorMessage="Enter fullname" ValidationGroup="ContactForm" ControlToValidate="txtfname">*</asp:RequiredFieldValidator>
                                    </td>
                                  </tr>
                                  <tr>
                                  <td>
                                      &nbsp;
                                  </td>
                                  </tr>
                                  <tr>
                                    <td align="left" valign="middle" class="content" style="padding-top:5px;"><b>E-Mail 
                                        Id </b></td>
                                    <td align="center" valign="middle" class="content"><b>:</b>&nbsp;</td>
                                    <td height="20" align="left" valign="middle">
                                       <asp:TextBox id="txtEmailid" runat="server" style="width:250px; height:20px;" Font-Size="12"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ForeColor="Red"  ValidationGroup="ContactForm" ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmailid">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtEmailid"
                                              ErrorMessage="Enter valid emailaddress" Display="dynamic" ValidationExpression=".*@.*\..*" ForeColor="Red"
                                             ValidationGroup="ContactForm">*</asp:RegularExpressionValidator>
                                    </td>
                                  </tr>
                                  <tr>
                                  <td>
                                      &nbsp;
                                  </td>
                                  </tr>
                                   <tr>
                                    <td align="left" valign="middle" class="content" style="padding-top:5px;"><b>Subject </b></td>
                                    <td align="center" valign="middle" class="content"><b>:</b>&nbsp;</td>
                                    <td height="20" align="left" valign="middle">
                                       <asp:TextBox id="Txtsubject" Font-Size="12" runat="server" style="width:250px; height:20px;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ContactForm" ForeColor="Red"
                                            ErrorMessage="Enter Your Subject" ControlToValidate="Txtsubject">*</asp:RequiredFieldValidator>
                                        </td>
                                  </tr>
                                      <tr>
                                      
                                    <td align="left" valign="middle" class="content" style="padding-top:5px;"><br /><b>Country</b></td>
                                    <td align="center" valign="middle" class="content"><b>:</b></td>
                                    <td height="25" align="left" valign="middle">
                                       <asp:DropDownList id="ddlcountry" runat="server" style="width:250px; height:20px;" appenddatabounditems="True"  AutoPostBack="true"  onselectedindexchanged="ddlcountry_SelectedIndexChanged">
                                       
                                            <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ContactForm" ForeColor="Red"
                                             InitialValue="Select Country" ErrorMessage="Enter Country" ControlToValidate="ddlcountry">*</asp:RequiredFieldValidator>
                                         
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="left" valign="middle" class="content" style="padding-top:5px;"><b>State</b></td>
                                    <td align="center" valign="middle" class="content"><b>:</b></td>
                                    <td height="30" align="left" valign="middle">
                                        <asp:DropDownList id="ddlstate" runat="server" style="width:250px; height:20px;" appenddatabounditems="True"  AutoPostBack="true"  onselectedindexchanged="ddlstate_SelectedIndexChanged">
                                         <asp:ListItem Value="Select State">Select State</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ContactForm"  ForeColor="Red"
                                            InitialValue="Select State" ErrorMessage="Enter state" ControlToValidate="ddlstate">*</asp:RequiredFieldValidator>
                                        
                                        
                                   </td>
                                  </tr>
                                  <tr>
                                    <td align="left" valign="middle" class="content" style="padding-top:5px;"><b>City</b></td>
                                    <td align="center" valign="middle" class="content"><b>:</b></td>
                                    <td height="25" align="left" valign="middle">
                                       <asp:DropDownList id="ddlcity" runat="server" style="width:250px; height:20px;" appenddatabounditems="True">
                                       <asp:ListItem Value="Select City">Select City</asp:ListItem>
                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="Select City"  ForeColor="Red"
                                            ValidationGroup="ContactForm" ErrorMessage="Enter city" ControlToValidate="ddlcity">*</asp:RequiredFieldValidator>
                                    </td>
                                  </tr>
                                  <tr>
                                  <td>
                                      &nbsp;
                                  </td>
                                  </tr>
                                  <tr>
                                    <td align="left" valign="middle" class="content" style="padding-top:5px;"><b>Your 
                                        Message  </b></td>
                                    <td align="center" valign="middle" class="content"><b>:</b></td>
                                    <td height="25" align="left" valign="middle">
                                       <asp:TextBox id="txtcomments" runat="server" Height="150px" Width="250px" TextMode="MultiLine" Font-Size="12"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ContactForm" ForeColor="Red"
                                             ErrorMessage="Enter your comments" ControlToValidate="txtcomments">*</asp:RequiredFieldValidator>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <br />
                                      </td>
                                  </tr>
                                </table>
                                </td>
                                </tr>
                                <tr>
                                <td width="30%">
                                &nbsp;
                                </td>
                                <td align="center" valign="middle" class="style1"><table width="90%" border="0" align="center">
                                  <tr>                               
                                    <td width="50%" align="right" valign="middle" style="padding-right:10px;">
                                        <asp:ImageButton id="imgSubmit" runat="server" 
                                            ImageUrl="images/submit.png" ValidationGroup="ContactForm" 
                                            onclick="imgSubmit_Click" />&nbsp;</td>
                                    <td align="left" valign="middle"><asp:ImageButton id="imgReset" runat="server" 
                                            ImageUrl="images/cancel.png" onclick="imgReset_Click" /></td>
                                  </tr>
                                   <tr>
                                    <td align="center" valign="middle" style="padding-right:10px;" colspan="3">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="ContactForm" ShowMessageBox="true" ShowSummary="false"/>
                                    </td>
                                  </tr>
                                </table></td>
                              </tr>
                              <tr>
                              <td>&nbsp;</td>
                              </tr>
                              
                            </table></td>
                </tr>
              </table>
             
             
             
              </td>
      
          </tr>
          </table></td>
      </tr>
    </table>
</asp:Content>
