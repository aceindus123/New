<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="_3Tier.Profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style type="text/css">
      .ModalPopupBG
{
    background-color: #666699;
    filter: alpha(opacity=50);
    opacity: 0.7;
}
      </style>
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
                     <ajx:modalpopupextender ID="Modalpopupextender1" runat="server" TargetControlID="txtloc" 
          CancelControlID="Button3" DropShadow="false" PopupControlID="pnlAtoZ"></ajx:modalpopupextender>
    
            <asp:Panel ID="Panel1" runat="server" Visible="false " style="width: 53%;height:auto;background-color:white;" HorizontalAlign="Center">
               <table border="0" cellpadding="0" cellspacing="0" style="width:  100%;padding-top:20px;">
                     <tr>       
                        <td  width="50%"  style="padding-left:10px;" >

                            <asp:Label ID="lbl" runat="server" Text="Select  City"  Font-Size="18px"  ></asp:Label>
                             </td>
                            <td   width="20%" align="right">
                            <asp:Button ID="Button1" runat="server" Text="X" Font-Size="Medium"  
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
            <tr class="body2">
                <td align="center" width="100%">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <table border="0" style="height:175px">
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                      <tr>
                                          <td colspan="3" align="center">
                                              <asp:Label ID="lablogin" runat ="server" Text="Log In" Font-Bold="True" Font-Names="Arial" Font-Size="14pt" ForeColor="#666666"></asp:Label>
                                          </td>
                                           <td colspan="3" align="right">
                                              <asp:Label ID="Label1" runat ="server" Text="New User ? " Font-Bold="True" Font-Names="Arial" Font-Size="14pt" ForeColor="#666666"></asp:Label>
                                          </td>
                                          <td colspan="3" align="right">
                                              <asp:LinkButton ID="Label2" runat ="server" Text="Sign Up Here"  Font-Names="Arial" 
                                                  Font-Underline="false" Font-Size="12pt" ForeColor="#666666" OnClick="Label2_Click"></asp:LinkButton>
                                          </td>
                                     </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                     <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="ltrlUserName" Text="User Name / Email Id *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:TextBox ID="txtuser" runat="server" Width="164px" Font-Size="12pt" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtuser" 
                                            ErrorMessage="Enter Username" ValidationGroup="login" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                  <tr>
                                       <td>
                                       <asp:Label ID="ltrlPwd" runat="server" Text="Password *" Font-Bold="True" 
                                               Font-Names="Arial" Font-Size="12pt" ForeColor="#006699"></asp:Label>
  
                                       </td>
                                       <td style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                       <td>
                                              <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Width="164px" Font-Size="12pt" />  
                                               <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server"  ForeColor="Red"
                                                   ControlToValidate="txtpwd" ErrorMessage="Enter Password" ValidationGroup="login" >*</asp:RequiredFieldValidator>      
                                       </td>
                               </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                               <tr>
                                 <td colspan="2"><br />
                                   <div style="float:right; padding-left:15px;">
                                        <asp:LinkButton ID="HyperLink1" runat="server" ToolTip="Forgot Password?" Text="Forgot Password?" OnClick="HyperLink1_Click"></asp:LinkButton> 
                                  </div>
                                </td>
                                 <td align="center"><br />
                                     <asp:ImageButton ID="Signin" runat="server"  ImageUrl="images/login.png" ValidationGroup="login" Height="23px" Width="64px" OnClick="Signin_Click"/>
                                 </td>            
                             </tr>
                                     <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                               <tr>
                                   <td colspan="3">
                                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="login" ShowMessageBox="true" ShowSummary="false" />
                                   </td>
                               </tr>
                                   
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                               </table>
                            </td>
                        </tr>
                     </table>
                 </td>
             </tr>
             <tr >
                <td valign="top" align="center">
                     <ajx:modalpopupextender ID="model" runat="server" TargetControlID="HyperLink1"  BackgroundCssClass="ModalPopupBG"
                            CancelControlID="Button3"  PopupControlID="pnlAtoZ"></ajx:modalpopupextender>

                      <asp:Panel ID="pnlAtoZ" runat="server" Visible="false" style="width: 85%;height:auto;background-color:white;" HorizontalAlign="Center">
                           <table border="0" cellpadding="0" cellspacing="0" style="width:  100%;padding-top:20px;background-position:center;
                                    background-image: url(images/Forgotpassword_bg1.png); background-repeat:no-repeat;"">
                         <tr>   
                        <td align="center" >
                                <asp:Label ID="Lbheading" runat="server" style="font-weight:bold;font-size:15pt" 
                                            Text="Forgot Password" ForeColor="#006666" Font-Bold="True"  Font-Names="Arial" Font-Size="14pt"></asp:Label>
                         </td>
                          <td   width="15%" align="center">
                            <asp:Button ID="Button3" runat="server" Text="X" Font-Size="Medium"  
                                BackColor="White" BorderStyle="None"  Width="15%"  ForeColor="Red" Font-Bold="true" />
                         </td>
                    </tr> 

                    <tr>
                        <td>
                           <table align="center" width="55%" height="220px" style="padding-left:80px;">
                                   <tr>
                                          <td>
                                             <asp:Label ID="ltrlEmail" runat="server" Text=" Enter your emailid" 
                                             Font-Bold="True" Font-Names="Arial" Font-Size="13px" ForeColor="#006666" ></asp:Label>
                                         </td>
                                         <td>
                                           <asp:TextBox ID="Emailid" runat="server" Width="200px" />
                                           <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="Emailid" Text="*" />
                                         </td>
                                    </tr>
                   
                                    <tr>
                                         <td align="right" colspan="2">
                                         <br />
                                             <asp:ImageButton ID="btnfpwd" runat="server" ImageUrl="images/send-password.png" OnClick="btnfpwd_Click"   />
                                        </td>
                                  </tr>
                            </table>
                        </td>
                    </tr>
              </table>
            </asp:Panel>
               </td>
            </tr>

              <tr class="body2">
                  <td width="98%"  align="left"  colspan="3">
                      <table width="100%" >
                          <tr>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="Images/indusnexus.png" OnClick="ImageButton11_Click" />
                              </td>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton26" runat="server" ImageUrl="Images/indusemail.png" OnClick="ImageButton26_Click" />
                              </td>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton18" runat="server" ImageUrl="Images/justcalluz.png" OnClick="ImageButton18_Click" />
                              </td>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton19" runat="server" ImageUrl="Images/industraining.jpg" OnClick="ImageButton19_Click" />
                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>

    </table>
</asp:Content>
