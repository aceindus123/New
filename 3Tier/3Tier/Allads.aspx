<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeBehind="Allads.aspx.cs" Inherits="_3Tier.Allads" %>
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
                <td align="center" width="100%">
                    <table align="center" width="100%">
                        <tr>
                            <td align="left" width="20%" valign="middle"> 
                                <table align="center" width="100%"  valign="middle">
                                    <tr>
                                        <td >
                                            <script type="text/javascript" language="javascript"> var aax_size = '300x250'; var aax_pubname = 'pridcoup-21'; var aax_src = '302'; </script><script type="text/javascript" language="javascript" src="http://c.amazon-adsystem.com/aax2/assoc.js"></script>
                                       </td>
                                    </tr>
                                </table>
                            </td>

                            <td align="center" width="60%"  valign="top">
                                     <table width="100%"  >
                                         <tr> <td>&nbsp;</td></tr>

                                         <tr>
                                             <td colspan="3">
                                                <span style="font:bold 16px arial;"> Search Results For : </span><b> <i>
                                                    <asp:Label ID="lnk1" runat="server">
                                                     </asp:Label> <asp:Label ID="lbla" runat="server" Text="-->" ></asp:Label> 
                                                     <asp:Label ID="lnk2" runat="server" ></asp:Label>
                                                                         </i></b>
                                             </td>
                                         </tr>
                                         <tr> <td>&nbsp;</td></tr>
                                        <tr>
                                            <td width="2%">&nbsp;</td>
                                           <td align="center" width="90%" >
                                                <asp:DataList ID="ddtop" runat="server" width="100%"  RepeatColumns="1"  BorderStyle="Dashed" BorderWidth="1"
                                             onitemcommand="DataList1_ItemCommand1" CellPadding="1" CellSpacing="0" >
                                             <ItemTemplate>
                                               <table width="100%"  align="center" style="background: -webkit-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); background: -moz-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); background: -ms-linear-gradient(top, rgba(2, 252, 88, 0.11) 0%,rgba(236, 219, 79, 0.78) 52%,rgba(168, 101, 31, 0.13) 100%); "
}  >
                                                   <tr>
                                                      <td align="left" style="padding-top:10px;" width="70%">
                                                          <asp:LinkButton runat="server" ID="lnktitle" Text='<%# Eval("Item_Title") %>' Font-Underline="false"  
                                                              CommandName="sale" CommandArgument='<%# Eval("sid") %>'
                                                              Font-Names="arial" Font-Size="18px" Height="28px"  />
                                                      </td>
                                                       <td align="center" style="padding-top:10px;" width="30%">
                                                          <asp:LinkButton runat="server" ID="lnkcity" Text='<%# Eval("address") %>' Font-Underline="false"
                                                              CommandName="sale1" CommandArgument='<%# Eval("sid") %>'
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
                                                            Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px"
                                                         CommandName="sale3" CommandArgument='<%# Eval("sid") %>' />
                                                      
                                                   <span style="font:bold 15px arial">    Sub Category :  </span>    <asp:LinkButton runat="server" ID="lnksubcat" Text='<%# Eval("Item_Subacat") %>'
                                                           Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px" 
                                                        CommandName="sale4" CommandArgument='<%# Eval("sid") %>'  />
                                                      </td>
                                                        <td  align="center"  >  
                                                 <span style="font:bold 15px arial">      City :  </span>   <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("city") %>' 
                                                            Font-Underline="false" Font-Names="arial" Font-Size="14px" Height="25px"
                                                             CommandName="sale2" CommandArgument='<%# Eval("sid") %>'></asp:LinkButton>
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
                                                
                                             </ItemTemplate>
                                          </asp:DataList>
                                           </td>
                                             <td width="2%">&nbsp;</td>
                                        </tr>

                                         <tr>
                                             <td colspan="3" align="center" >
                                                  <asp:Image ID="Label1" runat="server" ImageUrl="images/no.jpg" Visible="false" ></asp:Image>
                                             </td>
                                         </tr>
                                  </table>
                            </td>

                            <td align="center" width="20%"    >
                                <table  style="border:solid 1px green; height:150px;"  valign="middle"  >
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
                                        <td align="right">
                                            <asp:LinkButton ID="lnkmore" runat="server" Text="More..." Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="17px" OnClick="lnkmore_Click"></asp:LinkButton>
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
