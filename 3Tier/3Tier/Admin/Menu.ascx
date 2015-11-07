<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="_3Tier.Admin.Menu" %>

<table align="center" width="80%" >
                      <tr>
                            <td align="center" width="13%"  >    
                                <asp:LinkButton ID="lnkhome" runat="server" Text="Home" Font-Underline="false"  
                                     class="datalp9" OnClick="lnkhome_Click" ></asp:LinkButton>
                             </td>
                      
                        <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"   width="13%" >    
                                <asp:LinkButton ID="lnkclient" runat="server" Text="Clients" Font-Underline="false"  
                                     class="datalp9" OnClick="lnkclient_Click"  ></asp:LinkButton>
                             </td>

                        <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"  id="new1" runat="server"  width="13%" >
                              <asp:LinkButton ID="lnkad" runat="server" Text="Posted Ads" Font-Underline="false" 
                                 CssClass="datalp9" OnClick="lnkad_Click"  ></asp:LinkButton>
                        </td>
                       
                       <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"   width="13%">    
                                <asp:LinkButton ID="lnkcontact" runat="server" Text="Contact Us" Font-Underline="false"  
                                     class="datalp9" OnClick="lnkcontact_Click"  ></asp:LinkButton>
                             </td>
                       
                         <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                          <td align="center"  width="13%" >    
                                <asp:LinkButton ID="lnkfeed" runat="server" Text="Feedback" Font-Underline="false"  
                                     class="datalp9" OnClick="lnkfeed_Click" ></asp:LinkButton>
                             </td>

                           <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                          <td align="center"  width="13%" >    
                                <asp:LinkButton ID="lnksupport" runat="server" Text="Support" Font-Underline="false"  
                                     class="datalp9" OnClick="lnksupport_Click" ></asp:LinkButton>
                             </td>
                           <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                          <td align="center"  width="13%" >    
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Users" Font-Underline="false"  
                                     class="datalp9" OnClick="LinkButton1_Click"  ></asp:LinkButton>
                             </td>

                           <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                          <td align="center"  width="13%" >    
                                <asp:LinkButton ID="lnkdeals" runat="server" Text="Deals" Font-Underline="false"  
                                     class="datalp9" OnClick="lnkdeals_Click" ></asp:LinkButton>
                             </td>
                          </tr>

  </table>

