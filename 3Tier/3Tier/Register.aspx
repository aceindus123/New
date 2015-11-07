<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_3Tier.Register" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }
        </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <ajx:ToolkitScriptManager ID="tsm" runat="server"></ajx:ToolkitScriptManager>

     <table  class="body" align="center">
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
          <tr class="body2">
              <td width="70%" align="center" colspan="2">  
                <table width="70%" >
                    <tr>
                        <td colspan="2" ><br /><span style="text-align:center;font:20px arial;padding-left:300px;"><b>Create Account</b></span><br /><br /></td>
                    </tr>
                   <tr>
                     <td   valign="top" align="right" >
                         <asp:Label ID="lblname" runat="server" Text="First Name" Font-Names="Segoe UI" ForeColor="Black" /><span  style="text-align:center;">&nbsp;*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                     </td>
                      <td align="left"  width="60%">
                        <asp:TextBox ID="txtname" runat="server"  Width="262px"  Height="26px" CssClass="textboxsch4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="txtname"
                         ErrorMessage="Provide name" ValidationGroup="RegForm" ForeColor="Red" ><span >*</span></asp:RequiredFieldValidator>                
                     <br /> <br /> </td>
                 </tr>

                 <tr>
                     <td  valign="top" align="right">
                        <asp:Label ID="lbllname" runat="server" Text="Last Name"  Font-Names="Segoe UI" ForeColor="Black"/><span >&nbsp;*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                    </td>
                    <td align="left">
                       <asp:TextBox ID="txtlname" runat="server" Width="262px"  Height="26px" CssClass="textboxsch4">
                      </asp:TextBox>
                      <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtlname" ForeColor="Red"
                         ErrorMessage="Provide Initial Name" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>                
                       <br /><br />
                    </td>
                </tr>

                <tr>
                   <td  valign="top" align="right">
                        <asp:Label ID="lblemail" runat="server" Text="Email" Font-Names="Segoe UI" ForeColor="Black" ></asp:Label><span>&nbsp;*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                   </td>
                    <td align="left" >
                          <asp:TextBox ID="txtemail" runat="server" Width="262px"  Height="26px" CssClass="textboxsch4" 
                                 ValidationGroup="reg1"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="txtemail" ForeColor="Red"
                            ErrorMessage="Provide a valid email address" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail" ForeColor="Red"
                             ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm"><span >*</span></asp:RegularExpressionValidator>
                        <br /><br /> 
                    </td>                
                </tr>
                
                <tr>
                   <td  valign="top" align="right">
                      <asp:Label ID="lblphone" runat="server" Text="Phone" Font-Names="Segoe UI" ForeColor="Black" /><span >&nbsp;*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                   </td>
                    <td  align="left" >             
                        <asp:TextBox ID="txtphone" runat="server" MaxLength="10" Width="262px"  Height="26px" CssClass="textboxsch4"
                        onkeypress="return onlyNos(event,this);"></asp:TextBox> 
                       <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="txtphone" ForeColor="Red"
                            ErrorMessage="Provide a Phone number" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                       <br /><br />
                    </td>
                </tr>

                <tr>
                    <td  valign="top" align="right">
                          <asp:Label ID="lblpwd" runat="server" Text="Password" Font-Names="Segoe UI" ForeColor="Black" /><span >&nbsp;*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                   </td>
                    <td align="left">
                        <asp:TextBox ID="txtpwd" runat="server"  TextMode="Password" Width="262px"  Height="26px" CssClass="textboxsch4">
                       </asp:TextBox>
                         <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="txtpwd" ForeColor="Red"
                           ErrorMessage="Provide a password" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                       <%--   <asp:RegularExpressionValidator  ID="RegularExpressionValidator1"  ControlToValidate="txtpwd"
                              ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"  runat="server"
                              ErrorMessage="Password must contain: Minimum 8 characters atleast One Alphabet and One Number and one special Character"  
                                 ValidationGroup="RegForm"></asp:RegularExpressionValidator>--%>
                        <br /><br />
                    </td>
                </tr>

                <tr>
                    <td  valign="top" align="right">
                        <asp:Label ID="lblcpwd" runat="server" Text="Confirm Password"  Font-Names="Segoe UI" ForeColor="Black"/><span >&nbsp;*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                   </td>
                    <td  align="left" >
                        <asp:TextBox ID="txtcpwd" runat="server"  TextMode="Password" Width="262px"  Height="26px" CssClass="textboxsch4">
                       </asp:TextBox>
                       <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtcpwd" ForeColor="Red"
                           ErrorMessage="Provide a Confirm Password" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                       <asp:CompareValidator ID="Requiredfieldvalidator2" runat="server" ControlToCompare="txtpwd" ControlToValidate="txtcpwd"  ForeColor="Red"
                          ErrorMessage="Provide same Password" ValidationGroup="RegForm"><span >*</span></asp:CompareValidator>
                       <br /><br />
                    </td>
                </tr>
          
                <tr>
                   <td  valign="top" align="right">
                         <asp:Label ID="lbladdress" runat="server" Text="Address" Font-Names="Segoe UI" ForeColor="Black" /><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                   </td>
                   <td  align="left" >
                          <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Width="262px"  Height="70px" CssClass="textboxsch" >
                          </asp:TextBox>
                         <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtaddress" ForeColor="Red"
                           ErrorMessage="Provide Address" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator><br />
                    </td>
                </tr>

                  <tr>
                    <td colspan="2" align="center"  style="padding-left:15%;">
                      <asp:ImageButton  ID="Create" ToolTip="Submit" runat="server"   ImageUrl="images/submit.png" ValidationGroup="RegForm" OnClick="Create_Click" />
                      <asp:ImageButton  ID="btncancel" runat="server" ImageUrl="images/cancel.png" OnClick="btncancel_Click" />
                      <asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="RegForm" ShowMessageBox="True" ShowSummary="False"/>
                   </td>
                </tr>

                      <tr>
                    <td colspan="2">  <span> <asp:RegularExpressionValidator ID="mobilereg" runat="server"  ForeColor="Red"
                      ControlToValidate="txtphone" ErrorMessage="Enter phone number only ten digits(starting number should starts from 1 to 9 digits)"  ValidationGroup="RegForm"
                      ValidationExpression="^[01]?[- .]?(\([1-9]\d{2}\)|[1-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator></span>
                    </td>
                 </tr>
               </table>               
             </td>
          </tr>
      </table>
</asp:Content>
