<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Deals.aspx.cs" Inherits="_3Tier.Admin.Deals" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/Admin/TopUser.ascx" TagPrefix="uc1" TagName="TopUser" %>
<%@ Register Src="~/Admin/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div>
        <ajx:ToolkitScriptManager ID="asp" runat="server"></ajx:ToolkitScriptManager>
        <table width="100%" border="0" align="center">
            <tr>
                <td  align="center">
                    <uc1:TopUser runat="server" ID="TopUser" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <uc1:Menu runat="server" ID="Menu1" />
                </td>
            </tr>

              <tr>
                   <td align="center" Width="80%">
                      <table align="center" Width="90%">

                           <tr><td><br /></td></tr>
                            <tr>
                              <td align="center" id="View" runat="server"  Width="100%" >
                               <font size="5" color="#00277a"><strong>Deals</strong></font>
                              </td>
                          </tr>

                          <tr><td></td></tr>

                         <tr>
                             <td height="100px" style="padding-left:0px; padding-right:0px" colspan="2" Width="90%" >            
                                    <asp:GridView ID="gvusers" runat="server"   Width="100%"  AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                                          BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  Font-Overline="False" Font-Size="12pt" Font-Strikeout="False"
                                          OnPageIndexChanging="PageIndexChanging" Font-Underline="False"   BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages"
                                          PagerStyle-BackColor="White"   PageSize="10" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." 
                                        EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" >

                                   <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                    <Columns>
                                      <asp:TemplateField>
                                      <HeaderTemplate>Id</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>'  /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Seller</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate>
                                      <asp:Label ID="linkname" runat="server" CssClass="simple1"  
                                         Text='<%# Eval("seller") %>'   ></asp:Label>
                                      </ItemTemplate>                     
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate> Seller EMail</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblemail" runat="server" Text='<%# Eval("semail") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                        <asp:TemplateField>
                                      <HeaderTemplate>Seller Mobile </HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpno2" runat="server" Text='<%# Eval("smobile") %>' /></ItemTemplate>

                                      </asp:TemplateField>
                                         <asp:TemplateField>
                                      <HeaderTemplate>Title </HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblo3" runat="server" Text='<%# Eval("stitle") %>' 
                                          /></ItemTemplate>
                                      </asp:TemplateField>

                                        <asp:TemplateField>
                                      <HeaderTemplate>Buyer Email</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpno3" runat="server" Text='<%# Eval("bemail") %>' /></ItemTemplate>
                                      </asp:TemplateField>
                                        <asp:TemplateField>
                                      <HeaderTemplate>Buyer Mobile</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpno4" runat="server" Text='<%# Eval("bmobile") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                         <asp:TemplateField>
                                      <HeaderTemplate>Comment </HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblo2" runat="server" Text='<%# Eval("bcomment") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Posted Date</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpdate" runat="server" Text='<%# Eval("Postdate") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                     <asp:TemplateField>
                                      <HeaderTemplate>Status</HeaderTemplate>

                                     <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="linkactive" runat="server" CssClass="simple1" Text='<%# Eval("mail") %>'
                                              CommandArgument='<%#Eval("did") %>' OnCommand="ListName1" Font-Underline="false"></asp:LinkButton></ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField>
                                     <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lnkdelete" runat="server"  CssClass="simple1" 
                                              CommandArgument='<%#Eval("did") %>' OnCommand="ListName2"  Font-Underline="false"
                                              OnClientClick="return confirm('are you sure you want to delete this')">Delete</asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                           </asp:GridView>
                        </td>
                       </tr>
                      </table>
                  </td>
                  
                   
              </tr>
            </table>

         <input type="button"  style="display: none;" id="btndummy" runat="server" />
                      <ajx:ModalPopupExtender ID="model1" runat="server" TargetControlID="btndummy" PopupControlID="pnledit" DropShadow="false" 
                          BackgroundCssClass="Modalpopup" CancelControlID="btnclose"></ajx:ModalPopupExtender>

              <div id="updateclient" runat="server">    
                  <asp:Panel runat="server" ID="pnledit" Width="60%" Height="300px" BorderColor="Black"  Font-Size="17px"  HorizontalAlign="Center" BackColor="#E6E6E6" Visible="false" >
                        <table width="100%"> 
                            <tr>
                                  <td width="100%">
                                    <table  align="center"  width="100%">
                                      <tr>
                                          <td align="center" colspan="2">
                                             <asp:Label ID="Label1" runat="server" Text="Send Mail"  ForeColor="#00277a" Font-Size="22px" Font-Bold="true">
                                             </asp:Label>
                                         </td>
                                          <td></td>
                                        <td  align="right">
                                             <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Larger" Width="30px" Height="30px"/>
                                        </td>
                                     </tr>
                                   
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Buyer Mail : 
                                            </td>
                                            <td>
                                                <asp:Label ID="bmail" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Buyer Mobile : 
                                            </td>
                                            <td>
                                                <asp:Label ID="bmobile" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Buyer Comment : 
                                            </td>
                                            <td>
                                                <asp:Label ID="bcomment" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Seller Title : 
                                            </td>
                                            <td>
                                                <asp:Label ID="lblsellertitle" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                         <tr>
                                            <td>
                                                Seller Email : 
                                            </td>
                                            <td>
                                                <asp:Label ID="lblseller" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Seller Name : 
                                            </td>
                                            <td>
                                                <asp:Label ID="sname" runat="server"></asp:Label>
                                            </td>
                                        </tr>


                                         <tr>
                                            <td>
                                               
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="btnsend" runat="server" ImageUrl="~/Images/send1.png" OnClick="btnsend_Click" ValidationGroup="mail"></asp:ImageButton>
                                                 <asp:ImageButton ID="btncancel" runat="server" ImageUrl="~/Images/cancel.png" OnClick="btncancel_Click"></asp:ImageButton>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                               </tr>
                            </table>
                  </asp:Panel>
              </div>
    </div>
    </form>
</body>
</html>
