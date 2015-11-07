<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopUser.ascx.cs" Inherits="_3Tier.UserControls.TopUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<div >

        <table  class="body" align="center">
            <tr>
                <td width="100%" align="center">
                   <table width="100%">
                        <tr>
                            <td align="left" width="30%">
                               <asp:ImageButton ID="ImageButton22" runat="server" ImageUrl="../Images/Logo.png" OnClick="ImageButton22_Click" />
                           </td>

                            <td align="right" width="60%" >
                                <table width="100%" >
                                     <tr>
                                         <td  width="10%" align="right">
                                            <%-- <asp:Label ID="lblcont" runat="server" Text="Choose Country : " CssClass="font1"></asp:Label>
                                        
                                             <asp:DropDownList ID="ddcont" runat="server" AutoPostBack="true" CssClass="font1" Width="80px">
                                                 <asp:ListItem>Select</asp:ListItem>             <asp:ListItem>IND</asp:ListItem>
                                                 <asp:ListItem>USA</asp:ListItem>         <asp:ListItem>UK</asp:ListItem>
                                             </asp:DropDownList>--%>
                                         </td>
                                         <td width="40%"  align="center">
                                             <asp:Label ID="lblip" runat="server" Text="Your IP Address : " CssClass="font1"></asp:Label>
                                       
                                             <asp:Label ID="lblipadd" runat="server"  CssClass="font1"></asp:Label>
                                         </td>
                                  
                                         <td  valign="top" align="center" width="20%" >
                                             Connect With Us
                                         </td>
                                  
                                         <td  valign="top" align="center" width="20%" >
                                             <asp:ImageButton ID="ImageButton23" runat="server" ImageUrl="../Images/fb.png" 
                                                AlternateText="Facebook" ToolTip="Facebook" OnClick="ImageButton23_Click"></asp:ImageButton>
                                              &nbsp;&nbsp;
                                             <asp:ImageButton ID="ImageButton24" runat="server" ImageUrl="../Images/twitter.png" 
                                               AlternateText="Twitter" ToolTip="Twitter" OnClick="ImageButton24_Click"></asp:ImageButton>
                                              &nbsp;&nbsp;
                                             <asp:ImageButton ID="ImageButton25" runat="server" ImageUrl="../Images/google.png" 
                                              AlternateText="Google+" ToolTip="Google+" OnClick="ImageButton25_Click"></asp:ImageButton>
                                         </td >
                                     </tr>
                               
                                     <tr>
                                         <td width="30%"  align="center" >
                                           <asp:Label ID="user" runat="server"  ForeColor="#6479E2" Font-Size="18px" Visible="false" Font-Bold="true"> </asp:Label>
                                        </td>
                                          <td width="20%"  align="center">
                                            <asp:LinkButton ID="logout" runat="server" Text="Logout"  ForeColor="#6479E2" Font-Underline="false" Font-Size="18px" Visible="false" Font-Bold="true" OnClick="logout_Click"> </asp:LinkButton>
                                        </td>

                                        <td align="right"  width="20%" >
                                            <asp:ImageButton ID="imgad" runat="server" ImageUrl="../Images/Buttonad.png" OnClick="imgad_Click" />
                                        </td>
                                       
                                       <td align="center" width="20%" >
                                           <asp:ImageButton ID="imgac" runat="server" ImageUrl="../Images/Buttonaccount.png" OnClick="imgac_Click" />
                                      </td>
                                   </tr>
                                 </table>
                            </td>
                        </tr>
                     </table>
                </td>
            </tr>
            </table>
      </div>