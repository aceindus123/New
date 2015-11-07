<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeFile="DetailedAds.aspx.cs" Inherits="_3Tier.DetailedAds" %>
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
    
            <asp:Panel ID="pnlAtoZ" runat="server" Visible="false " style="width: 70%;height:60%;background-color:white;" HorizontalAlign="Center">
               <table border="0" cellpadding="0" cellspacing="0" style="width:100%;padding-top:20px;">
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
                        <td align="left" style="padding-left:5px;" colspan="2" width="65%">
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
                    <table align="center" width="100%">
                        <tr>
                            <td align="center" width="20%" valign="middle"  valign="middle">
                                <table   height="120px"  style="border:solid 1px green; ">
                                    <tr>
                                        <td align="center">
                                           <b><i> Instructions To Buyers</i></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>
                                                1. Your aim should be to collect the full payment at a safe and secure location.<br />
                                                2. You should identify at the spot if there is any fake currency involved, because afterwards bank will held you responsible.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" >
                                            <asp:LinkButton ID="lnkmore" runat="server" Text="More..." Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="17px" OnClick="lnkmore_Click"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                            <td align="center" width="60%"  valign="top">
                                     <table width="100%"  >
                                         <tr> <td>&nbsp;</td></tr>

                                         <tr>
                                             <td colspan="3">
                                                <span style="font:bold 16px arial;"> Search Results For : </span><b> <i><asp:LinkButton ID="lnk1" runat="server" Font-Underline="false">
                                                     </asp:LinkButton>   </i></b>
                                             </td>
                                         </tr>

                                         <tr> <td>&nbsp;</td></tr>

                                        <tr>
                                            <td width="2%">&nbsp;</td>
                                           <td align="center" width="90%" style="background: -webkit-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); background: -moz-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); background: -ms-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); "
}>
                                                <asp:DataList ID="ddtop" runat="server" width="100%"  RepeatColumns="1"  BorderStyle="Dashed" BorderWidth="1"
                                                 onitemcommand="DataList1_ItemCommand3"         CellPadding="1" CellSpacing="0" >
                                             <ItemTemplate>
                                               <table width="100%"  align="center"   >
                                                   <tr>
                                                      <td align="left"  colspan="4" >
                                                      <span style="font:bold 15px arial">  Category : </span> <asp:Label runat="server" ID="lnkcat" Text='<%# Eval("Item_Cat") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"/>
                                                   
                                                    <span style="font:bold 15px arial">   Sub Category :  </span>     <asp:Label runat="server" ID="lnksubcat" Text='<%# Eval("Item_Subacat") %>'
                                                           Font-Underline="false" Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"/>
                                                      </td>
                                                        <td  align="center"  colspan="2"  >  
                                                   <span style="font:bold 15px arial">     Cost : Rs  </span>   <asp:Label ID="lnk" runat="server" Text='<%# Eval("Item_cost") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="16px" Height="25px" Font-Bold="true"></asp:Label>
                                                     </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>

                                                   <tr>
                                                      <td align="left" colspan="4" >
                                                          <asp:Label runat="server" ID="lnktitle" Text='<%# Eval("Item_Title") %>' Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="18px" Height="28px"/>
                                                      </td>
                                                       <td align="center"  colspan="2" >
                                                          <asp:Label runat="server" ID="Label9" Text='<%# Eval("address") %>' Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="18px" Height="28px"/>
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>


                                                    <tr>
                                                      <td align="left"   colspan="6">
                                                         <asp:Label runat="server" ID="lnkdis" Text='<%# Eval("Item_Dis") %>' Font-Underline="false" Font-Names="arial" Font-Size="16px"/>
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>

                                                   <tr>
                                                      <td align="left" style="background-image:url(images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:ImageButton runat="server"  ID="Label1"  ImageUrl='<%#"ImageHandler.ashx?imgID="+ Eval("sid") %>'  
                                                             Height="60px" Width="60px" CommandArgument='<%# Eval("sid") %>' CommandName="aa" />
                                                      </td>
                                                       <td align="left" style="background-image:url(images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:ImageButton runat="server" ID="Label2" ImageUrl='<%#"ImageHandler1.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa1" Height="60px" Width="60px"  />
                                                      </td>
                                                       <td align="left"style="background-image:url(images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:ImageButton runat="server" ID="Label3" ImageUrl='<%#"ImageHandler2.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa2" Height="60px" Width="60px" />
                                                      </td>
                                                       <td align="left" style="background-image:url(images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:ImageButton runat="server" ID="Label4" ImageUrl='<%#"ImageHandler3.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa3" Height="60px" Width="60px" />
                                                      </td>
                                                       <td align="left" style="background-image:url(images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:ImageButton runat="server" ID="Label5" ImageUrl='<%#"ImageHandler4.ashx?imgID="+ Eval("sid") %>' 
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa4" Height="60px" Width="60px"/>
                                                      </td>
                                                       <td align="left" style="background-image:url(images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:ImageButton runat="server" ID="Label6" ImageUrl='<%#"ImageHandler5.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa5" Height="60px" Width="60px" />
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>

                                                   <tr >
                                                       <td  align="left" colspan="3"  >  
                                                   <span style="font:bold 15px arial">    City  : </span>   <asp:Label ID="Label8" runat="server" Text='<%# Eval("city") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"></asp:Label>
                                                     </td>

                                                       <td  align="center"  colspan="3">  
                                                 <span style="font:bold 15px arial">      Posted Date :  </span>  <asp:Label ID="Label7" runat="server" Text='<%# Eval("posted_date") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"></asp:Label>
                                                     </td>
                                                   </tr>
                                              </table>
                                                 <br />
                                             </ItemTemplate>
                                          </asp:DataList>
                                           </td>
                                             <td width="2%">&nbsp;</td>
                                        </tr>

                                                  <%-- <tr>
                                                       <td>
                                                           <ajx:ModalPopupExtender ID="model1" runat="server" TargetControlID="ddtop" 
                                                              CancelControlID="button1" DropShadow="false" PopupControlID="pnl1"></ajx:ModalPopupExtender>
                                                           <asp:Panel ID="pnl1" runat="server"  style="width: 300px;height:200px;background-color:white;" HorizontalAlign="Center">
                                                                  <table border="0" cellpadding="0" cellspacing="0" style="width: 300px;padding-top:20px;">
                                                                       <tr>
                                                                          <td>
                                                                             <asp:Image runat="server" ID="Image2" ImageUrl='<%#"ImageHandler.ashx?imgID="+ Eval("sid") %>' Height="200px" Width="200px"  />
                                                                          </td>
                                                                           <td>
                                                                                <asp:Button ID="Button1" runat="server" Text="X" Font-Size="Medium"       BackColor="White" BorderStyle="None"
                                                                                  Width="33px"  ForeColor="Red" Font-Bold="true" />
                                                                           </td>
                                                                      </tr>
                                                                  </table>
                                                               </asp:Panel>
                                                       </td>
                                                   </tr>--%>


                                        <tr> <td>&nbsp;</td></tr>

                                        <tr   >
                                           <td width="2%">&nbsp;</td>
                                           <td align="center" width="80%"  colspan="1" >
                                            <asp:DataList ID="DataList2" runat="server" Visible="false" width="100%"  RepeatColumns="1"  BorderStyle="Dashed" BorderWidth="1"
                                             onitemcommand="DataList1_ItemCommand2" CellPadding="1" CellSpacing="0"  >
                                             <ItemTemplate>
                                               <table width="100%"  align="center" style="background: -webkit-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); background: -moz-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); background: -ms-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); "
}>
                                                   <tr>
                                                      <td align="left" style="padding-top:10px;" width="70%">
                                                          <asp:LinkButton runat="server" ID="lnktitle" Text='<%# Eval("Item_Title") %>' Font-Underline="false"  
                                                              CommandName="sale" CommandArgument='<%# Eval("sid") %>'
                                                              Font-Names="arial" Font-Size="18px" Height="28px"  />
                                                      </td>
                                                       <td align="center" style="padding-top:10px;" width="30%">
                                                          <asp:LinkButton runat="server" ID="lnkcity" Text='<%# Eval("address") %>' Font-Underline="false"
                                                               Font-Names="arial" Font-Size="18px" Height="28px" />
                                                      </td>
                                                  </tr>
                                                    <tr>
                                                      <td align="left" >
                                                       <span style="font:bold 15px arial" > Discription : </span>   <asp:Label runat="server" ID="lnkdis" Text='<%# Eval("Item_Dis") %>' 
                                                           Font-Underline="false" Font-Names="arial" Font-Size="16px"/>
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>
                                                    <tr >
                                                      <td align="left"  >
                                                    <span style="font:bold 15px arial">     Category :  </span> <asp:LinkButton runat="server" ID="lnkcat" Text='<%# Eval("Item_Cat") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px" />
                                                      
                                                   <span style="font:bold 15px arial">    Sub Category :  </span>    <asp:LinkButton runat="server" ID="lnksubcat" Text='<%# Eval("Item_Subacat") %>'
                                                           Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px"   />
                                                      </td>
                                                        <td  align="center"  >  
                                                 <span style="font:bold 15px arial">      City :  </span>   <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("city") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px"
                                                             CommandName="sale" CommandArgument='<%# Eval("sid") %>'></asp:LinkButton>
                                                     </td>
                                                  </tr>
                                                  <tr>
                                                      <td  align="left"  >  
                                               <span style="font:bold 15px arial">        Seller Name : </span>  <asp:LinkButton ID="lbltitle" runat="server" Text='<%# Eval("seller") %>'  
                                                           Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px"
                                                             CommandName="sale" CommandArgument='<%# Eval("sid") %>'></asp:LinkButton>
                                                     </td>
                                                      <td  align="center" >  
                                                <span style="font:bold 15px arial">       Mobile Number : </span> <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("mobile") %>'
                                                             Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px"
                                                             CommandName="sale" CommandArgument='<%# Eval("sid") %>'></asp:LinkButton>
                                                     </td>
                                                  </tr>
                                              </table>
                                                 <br />
                                             </ItemTemplate>
                                          </asp:DataList>
                                           </td>
                                       </tr>

                                         <tr>
                                             <td align="center" id="nolabel" runat="server" visible="false" colspan="2">
                                                 <asp:Label ID="norocord" runat="server" Text="No Other Ads Found From This User" Font-Bold="true" ></asp:Label>
                                             </td>
                                         </tr>
                                  </table>
                            </td>

                            <td align="center" width="20%"    valign="middle">
                                <table height="120px" style="border:solid 1px green;" >
                                   <tr>
                                         <td align="center" width="90%">
                                                <asp:DataList ID="DataList1" runat="server" width="100%"  RepeatColumns="1"  
                                              CellPadding="1" CellSpacing="0" >
                                             <ItemTemplate>
                                               <table width="100%"  align="center">
                                                    <tr>
                                                      <td align="left" >
                                                          <asp:Image ID="img" runat="server" ImageUrl="Images/seller.png" />
                                                          </td>
                                                          <td align="center" >
                                                          <asp:Label runat="server" ID="lnktitle" Text='<%# Eval("seller") %>' Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="18px" Height="28px"/>
                                                      </td>
                                                  </tr>
                                                   <tr>
                                                        <td align="right" >
                                                          <asp:Image ID="Image1" runat="server" ImageUrl="Images/call.jpg" />
                                                        </td>
                                                          <td align="center" >
                                                          <asp:Label runat="server" ID="lnkcity" Text='<%# Eval("mobile") %>' Font-Underline="false"
                                                               Font-Names="arial" Font-Size="18px" Height="28px" />
                                                      </td>
                                                   </tr>
                                              </table>
                                                 <br />
                                             </ItemTemplate>
                                          </asp:DataList>
                                           </td>
                                   </tr>

                                    <tr>
                                        <td align="center">
                                             <asp:LinkButton ID="lnkseller" runat="server" Text="More Ads From this Seller" Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="17px" OnClick="lnkseller_Click"></asp:LinkButton>
                                        </td>
                                    </tr>

                                     <tr><td>&nbsp;</td></tr>

                                    <tr>
                                        <td  align="center">
                                            <asp:Label ID="lblemail" runat="server" Text="Email To Seller"  Font-Bold="true" Font-Size="16px"></asp:Label>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td  align="center">
                                            <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" placeholder="Comments"
                                                  Font-Size="16px" Height="80px"></asp:TextBox>
                                        </td>

                                    </tr>

                                    <tr>
                                         <td align="center">  
                                        <asp:TextBox ID="txtemail" runat="server" Width="200px" Font-Size="12pt" placeholder="Your Email" />  
                                        <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtemail" 
                                            ErrorMessage="Enter Email" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>  --%>
                              <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail" ForeColor="Red"
                    ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="submit">*</asp:RegularExpressionValidator>  
                                      </td>
                                    </tr>

                                    
                                    <tr>
                                        <td  align="center" style="padding-top:10px;">
                                            <asp:TextBox ID="txtmobile" runat="server"    Font-Size="16px" placeholder="Your Mobile Number" 
                                                onkeypress="return onlyNos(event,this);"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmobile"  ForeColor="Red" 
                    ErrorMessage="Enter Max 10 digits number" Display="dynamic" ValidationExpression="^[0-9]{10}$" ValidationGroup="submit">*</asp:RegularExpressionValidator>  

                                        </td>
                                    </tr>

                                    <tr>
                                        <td  align="center">
                                            <asp:ImageButton ID="Label10" runat="server" ImageUrl="Images/send.png" OnClick="Label10_Click" ValidationGroup="submit"> </asp:ImageButton>
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
