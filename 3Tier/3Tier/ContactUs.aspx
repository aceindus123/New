<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="_3Tier.ContactUs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajx:ToolkitScriptManager ID="as" runat="server"></ajx:ToolkitScriptManager>

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

                            <asp:Label ID="lbl" runat="server" Text="Select City"  Font-Size="18px"  ></asp:Label>
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
                  <td  align="center" style="font-family:Segoe UI;">We would be pleased to help you. If you have any queries or want to write a comment or suggestion, you can kindly write in on the form mentioned below.<br />
                           For any further queries, you can also contact us at the information provided below:
                 </td>
            </tr>


            <tr class="body2">
              <td>
                  <table width="100%" cellpadding="10px" cellspacing="10px">
                       <tr>
                          <td valign="top"  width="50%"  align="center">
                              <table>        
                                  <tr>
                                         <td style="padding-top:10px;"><p align="justify" style="font-size:15px;line-height:22px;color:#565656; font-family:Segoe UI;">Global Head Quarters - USA<br />
                                                Indus Group Incorporated,<br />
                                            1033 Sterling Road, Ste. 204 & 205,<br />
                                            Herndon-VA-20170. USA.<br />
                                            Washington DC Metro Area.<br />
                                            Voice:<font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px ">  <b> 703-957-7829 </b></font> <br />
                                            Fax:   <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none; line-height:22px"><b>  703-842-8746</b></font><br /><br /><br />


                                             <p align="justify" style="font-size:15px;line-height:20px;color:#565656;font-family:Segoe UI;">
                                            For general inquiries please email us 	 :<a href="mailto:info@.com">
                                                 <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>info@.com</b></font></a></p>
                                             <p align="justify" style="font-size:15px;line-height:20px;color:#565656;font-family:Segoe UI;">
                                            For Feedback, Please email us  :     <a href="mailto:feedback@.com"> 
                                                <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>feedback@.com</b></font></a></p>                       
                                           
                                             <p align="justify" style="font-size:15px;line-height:20px;color:#565656;font-family:Segoe UI;">
                                                For Technical Difficulties, please email us  :   <a href="mailto:support@.com"> 
                                                    <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>support@.com</b></font></a> </p>                       
                                            <p align="justify" style="font-size:15px;line-height:20px;color:#565656;font-family:Segoe UI;">
                                                For suggestions and Innovative Ideas to improve the portal, Please email us  : <a href="mailto:webmaster@.com">
                                                     <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>webmaster@.com</b></font></a> <br />                                 
                                            <p align="justify" style="font-size:15px;line-height:20px;color:#565656;font-family:Segoe UI;">
                                                For Sales Please email us  :  <a href="mailto:sales@.com"> 
                                                    <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none; line-height:22px"><b>sales@.com</b></font></a>  
                                            </p>
                                        </td>
                                 </tr>
                              </table>
                          </td>

                          <td align="left" width="40%" style="padding-right :100px;">
                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                     <ContentTemplate>
                                            <fieldset    style=" padding-left:20px;" > <legend  ><asp:Image ID="img1" runat="server"  ImageUrl="images/concontactdetails.jpg" /></legend>
                                                <table width="90%" border="0" align="center" >

                                                    <tr><td><br /></td></tr>
  
                                                    <tr>
                                                      <td class="tdlbl" align="right"  valign="top">
                                                         Full Name<strong>:</strong>
                                                      </td>

                                                       <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat;
 padding-left:6px; width:210px;height:28px; border-style:none;padding-top:5px;padding-right:5px" >
                                                          <asp:TextBox id="txtfname" runat="server" CssClass="textboxschcon"
                                                                ></asp:TextBox>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter fullname" ValidationGroup="ContactForm" ControlToValidate="txtfname"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                                                           <ajx:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtfname" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" >
                                                           </ajx:FilteredTextBoxExtender>
                                                       </td>
                                                     </tr>
                                                    <tr>
                                                      <td class="tdlbl" align="right" >
                                                         E-Mail&nbsp;<strong>:</strong>
                                                      </td>
                                                      <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat;
 padding-left:6px;height:30px;padding-top:5px;">
                                                      <asp:TextBox id="txtEmailid" runat="server" CssClass="textboxschcon"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmailid"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                                                         <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtEmailid"
                                                                               ErrorMessage="Enter valid emailaddress" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="ContactForm"><span style="color:Red">*</span></asp:RegularExpressionValidator>
                                                      </td>
                                                    </tr>

                                                    <tr>
                                                        <td  class="tdlbl" style="padding-top:5px;" align="right" valign="top">Address&nbsp;<strong>:</strong></td>
                                                        <td align="left" style="background: url(images/contextbox22.png); background-repeat:no-repeat; padding-left:6px; padding-top:10px;height:60px;">
                                                        <asp:TextBox id="txtAddress" runat="server" CssClass="textboxschcon1" TextMode="MultiLine" ></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter Address" ControlToValidate="txtAddress"><span style="color:Red">*</span></asp:RequiredFieldValidator></td>
                                                   </tr>
                  

                                                    <tr>
                                                      <td  class="tdlbl" align="right">Country&nbsp;<strong>:</strong></td>
                                                      <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat;
 padding-left:6px;height:30px;padding-top:5px;padding-right:5px">
                                                         <asp:DropDownList id="ddlcountry" runat="server"   Height="20px" CssClass="textboxschcon" appenddatabounditems="True" Width="210px"  
                                                                     AutoPostBack="true" onselectedindexchanged="ddlcountry_SelectedIndexChanged">             
                                                                            <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                                         </asp:DropDownList>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ContactForm" InitialValue="Select Country" ErrorMessage="Enter Country" ControlToValidate="ddlcountry"><span style="color:Red">*</span></asp:RequiredFieldValidator>   
                                                      </td>
                                                  </tr>
     
                                                    <tr>
                                                     <td class="tdlbl" align="right">
                                                        State&nbsp;<strong>:</strong>
                                                      </td>
                                                     <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat;
 padding-left:6px;height:30px;padding-top:2px">
                                                          <asp:DropDownList ID="ddlstate" runat="server" appenddatabounditems="True" Height="20px"
                                                           AutoPostBack="true" onselectedindexchanged="ddlstate_SelectedIndexChanged" Width="210px"   CssClass="textboxschcon">
                                                             <asp:ListItem Value="Select State">Select State</asp:ListItem>
                                                          </asp:DropDownList>
                                                    </td>
                                                 </tr>
        
                                                    <tr>
                                                     <td class="tdlbl" align="right">
                                                         City&nbsp;<strong>:</strong>
                                                     </td>
                                                     <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat; 
padding-left:6px;height:30px;padding-top:5px">
                                                          <asp:DropDownList id="ddlcity" runat="server" Height="20px"  CssClass="textboxschcon" Width="210px"
                                                                appenddatabounditems="True" >
                                                                       <asp:ListItem Value="Select City">Select City</asp:ListItem>
                                                          </asp:DropDownList>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="Select City" ValidationGroup="ContactForm" ErrorMessage="Enter city" ControlToValidate="ddlcity"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                                                      </td>
                                                  </tr>

                                                    <tr>
                                                      <td class="tdlbl" align="right">
                                                          Zip Code<strong>:</strong>
                                                      </td>
                                                      <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat; 
padding-left:6px;height:30px;padding-top:5px">
                                                         <asp:TextBox id="txtzipcode" runat="server" CssClass="textboxschcon" MaxLength="6"  
                                                              ></asp:TextBox>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter zipcode" ControlToValidate="txtzipcode"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                                                          <ajx:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtzipcode" FilterType="Numbers">
                                                          </ajx:FilteredTextBoxExtender>
                                                      </td>
                                                  </tr>
   
                                                    <tr>
                                                      <td class="tdlbl"style="padding-top:5px;" align="right">
                                                         PhoneNumber&nbsp;<strong>:</strong>
                                                      </td>
                                                      <td align="left" style="background: url(images/contextbox.png); background-repeat:no-repeat;
 padding-left:6px; height:30px;padding-top:5px" >
                                                         <asp:TextBox id="txtphno" runat="server" CssClass="textboxschcon"  MaxLength="10"></asp:TextBox>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter phonenumber" ControlToValidate="txtphno"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                                                          <ajx:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtphno" FilterType="Numbers">
                                                          </ajx:FilteredTextBoxExtender>
                                                      </td>
                                                   </tr>

                                                    <tr>
                                                      <td  class="tdlbl"  align="right" valign="top">
                                                         Comments&nbsp;<strong>:</strong>
                                                      </td>
                                                      <td align="left" style="background: url(images/contextbox22.png); background-repeat:no-repeat;
 padding-left:6px; padding-top:10px;height:60px;" >
                                                         <asp:TextBox id="txtcomments" runat="server"  CssClass="textboxschcon1" TextMode="MultiLine" ></asp:TextBox>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter your comments" ControlToValidate="txtcomments"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                                                      </td>
                                                   </tr>
                                                   <tr><td><br /></td></tr>
                                                    <tr>
                                                     <td align="right" colspan="2">
                                                       <asp:ImageButton ID="btnsubmit" runat="server" ValidationGroup="ContactForm" 
                                                           OnClick="btnsubmit_Click" ImageUrl="images/submit.png" />
                                                            <asp:ImageButton ID="btnreset" runat="server"
                                                           onclick="btnreset_Click" ImageUrl="images/cancel.png" />
                                                     </td>
                                                 </tr>

                                                    <tr>
                                                       <td align="center" valign="middle" style="padding-right:10px;"  colspan="2">
                                                          <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="ContactForm" ShowMessageBox="true" ShowSummary="false"/>
                                                          </td>
                                                    </tr>
                                            </table>
                                            </fieldset>
                                     </ContentTemplate>
                                 </asp:UpdatePanel>
                          </td>
                       </tr>
                 </table>
             </td>
           </tr>
      </table>
</asp:Content>
