<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="_3Tier.History" %>

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
                            <asp:Label ID="Label2" runat="server" Text="Popular Cities" ForeColor="Orange" Font-Bold="true" Font-Size="14px"
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
            <td align="right">
                <asp:LinkButton ID="histor" runat="server" Font-Underline="false" Font-Size="18px" Text="History" OnClick="histor_Click" ></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="change" runat="server" Font-Underline="false" Font-Size="18px" Text="Change Password" OnClick="change_click"></asp:LinkButton>
            </td>
        </tr>
        <tr  class="body2" id="gv" runat="server">
               <td width="100%" align="center" valign="top">
                  <span><h3> Posted Ads </h3></span>
                 <asp:GridView ID="grid" runat="server" AllowPaging="true" AutoGenerateColumns="false" ShowFooter="true" CellPadding="4"
                       GridLines="None" ForeColor="#333333" Width="85%" OnPageIndexChanging="dlReports_PageIndexChanging" PageSize="10">
                 <EditRowStyle BackColor="#999999" />
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="25px"  />
                         <Columns>
                              <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                  <HeaderTemplate>
                                    <table width="100%" align="center">
                                       <tr>
                                         <td align="center" >
                                                <asp:Literal ID="cat" runat="server" Text="Category" />
                                         </td>
                                       </tr>
                                    </table>
                                    </HeaderTemplate>
                              
                                    <ItemTemplate>
                                        <asp:Label ID="lblcat" runat="server"  Text='<%#Eval("item_cat") %>' Font-Size="16px"></asp:Label>
                                    </ItemTemplate>
                                 </asp:TemplateField>

                              <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  >
                                 <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                           <td align="center" >
                                                <asp:Literal ID="title" runat="server" Text="Posted Title" />
                                                </td></tr></table>
                                 </HeaderTemplate>

                                 <ItemTemplate>
                                    <asp:LinkButton ID="lbltitle" font-Underline="False" runat="server" Text='<%#Eval("item_title") %>'  Font-Size="16px" ></asp:LinkButton>
                                 </ItemTemplate>
                             </asp:TemplateField>

                              <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"   >
                                 <HeaderTemplate>
                                    <table width="100%" align="center">
                                      <tr>
                                         <td align="center" > 
                                                <asp:Literal ID="pd" runat="server" Text="Posted Date" />
                                        </td>
                                      </tr>
                                     </table>
                               </HeaderTemplate>
                                   
                               <ItemTemplate>
                                   <asp:Label ID="lblpd" font-Underline="False" runat="server" Text='<%#Eval("posted_date") %>'  Font-Size="16px"  ></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>
                         </Columns>
                       <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="14px" Height="30px" /> 
                    <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="12px" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
              </asp:GridView>

                   <asp:Image runat="server" ID="nimageo" ImageUrl="Images/noads.png" Visible="false" />
             </td>
           </tr>

        <tr id="pwd" runat="server" visible="false">
            <td>
               <table align="center" width="80%" height="300px" style="padding-left:60px;" >
                 <tr>
                     <td align="center" >
                          <asp:Label ID="Label1" runat="server" style="font-weight:bold;font-size:18pt"  Text="Change Password" ForeColor="#006666" 
                              Font-Bold="True" ToolTip="Change Your Password"  Font-Names="Arial" Font-Size="14pt"></asp:Label>
                             <br />
                   </td>
               </tr>

                 <tr>
                <td>&nbsp;</td>
                </tr>

            <tr class="body2">
               <td align="center" width="60%" valign="top">
                    <table width="80%" align="center" >  
                        <tr>
                <td>&nbsp;</td>
                </tr>          
                      <tr>
                        <td align="right" style="padding-right:35px;">
                          <asp:Label ID="Labcurrentpwd" runat="server" Text=" Enter your Current Password " 
                                Font-Bold="True" Font-Names="Arial" Font-Size="15px" ForeColor="#006666" ></asp:Label>
                        </td>
                        <td align="center"><strong>&nbsp;:&nbsp;</strong></td>
                        <td align="left" style="padding-left:35px;" valign="top">
                         <asp:TextBox ID="txtprepwd" runat="server" Width="200px" TextMode="Password" AutoCompleteType="Disabled" Font-Size="15px"/>
                          <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtprepwd" Text="*" ValidationGroup="vg1" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                    <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right" style="padding-right:35px;">
                      <asp:Label ID="Label3" runat="server" Text="New Password " 
                            Font-Bold="True" Font-Names="Arial" Font-Size="15px" ForeColor="#006666" ></asp:Label>
                    </td>
                    <td align="center"><strong>&nbsp;:&nbsp;</strong></td>
                    <td align="left" style="padding-left:35px;" valign="top">
                     <asp:TextBox ID="Txtnewpwd" runat="server" Width="200px" TextMode="Password" Font-Size="15px"/>
                      <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="Txtnewpwd" Text="*"  ValidationGroup="vg1"  ForeColor="Red"/>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right" style="padding-right:35px;">
                      <asp:Label ID="Label4" runat="server" Text="Confirm Password " 
                            Font-Bold="True" Font-Names="Arial" Font-Size="15px" ForeColor="#006666" ></asp:Label>
                    </td>
                    <td align="center"><strong>&nbsp;:&nbsp;</strong></td>
                    <td align="left" style="padding-left:35px;" valign="top">
                     <asp:TextBox ID="Txtconfirmpwd" runat="server" Width="200px" TextMode="Password" Font-Size="15px"/>
                      <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="Txtconfirmpwd" Text="*"  ValidationGroup="vg1"  ForeColor="Red"/>
                      <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="Txtconfirmpwd" ControlToCompare="Txtnewpwd"  ForeColor="Red"
                          ValidationGroup="vg1" Text="Password must be match">*</asp:CompareValidator>
                    </td>
                   </tr>
                    <tr>
                    <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                    <td  colspan="3" align="center">
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" ValidationGroup="vg1" 
                            ImageUrl="images/submit.png" OnClick="ImageButton1_Click" 
                        />&nbsp; &nbsp;
                         <asp:ImageButton ID="ImageBtncancel" runat="server" ImageUrl="images/cancel.png" OnClick="ImageBtncancel_Click" />
                    </td>
                    </tr>
               </table>
             </td>
            </tr>
          </table>
            </td>
        </tr>
    </table>
</asp:Content>
