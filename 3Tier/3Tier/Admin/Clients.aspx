<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Clients.aspx.cs" Inherits="_3Tier.Admin.Clients" %>
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
                               <font size="5" color="#00277a"><strong>Clients List  </strong></font>
                              </td>
                             
                              <td align="right"> 
                                  <asp:ImageButton ID="btn1" runat="server" ImageUrl="~/images/cc.png" Font-Size="18px" OnClick="btn1_Click" /></td>
                          </tr>

                          <tr><td></td></tr>

                         <tr id="View1" runat="server">
                             <td height="100px" style="padding-left:0px; padding-right:0px" colspan="2" Width="100%" >            
                                    <asp:GridView ID="gvusers" runat="server"   Width="100%"  AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                                          BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  Font-Overline="False" Font-Size="12pt" Font-Strikeout="False"
                                          OnPageIndexChanging="PageIndexChanging" Font-Underline="False"   BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages"
                                          PagerStyle-BackColor="White"   PageSize="10" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." 
                                        EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" >

                                   <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                    <Columns>
                                      <asp:TemplateField>
                                      <HeaderTemplate>Register Id</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>'  /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>First Name</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate>
                                      <asp:LinkButton ID="linkname" runat="server" CssClass="simple1" CommandArgument='<%#Eval("rid") %>' 
                                         Text='<%# Eval("name") %>'  OnCommand="ListName" Font-Underline="false"></asp:LinkButton>
                                      </ItemTemplate>                     
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Last Name</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblname" runat="server" Text='<%# Eval("lname") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>EMail</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>PassWord</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpwd" runat="server" Text='<%# Eval("pwd") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Mobile</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpno" runat="server" Text='<%# Eval("mobile") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Register Date</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpdate" runat="server" Text='<%# Eval("posteddate") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                     <asp:TemplateField>
                                     <HeaderTemplate>Status</HeaderTemplate>
                                     <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="linkactive" runat="server" CssClass="simple1"  Text='<%# Eval("txtstatus") %>'
                                              CommandArgument='<%#Eval("rid") %>' OnCommand="ListName1" Font-Underline="false"></asp:LinkButton></ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField>
                                     <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lnkdelete" runat="server"  CssClass="simple1" 
                                              CommandArgument='<%#Eval("rid") %>' OnCommand="ListName2"  Font-Underline="false"
                                              OnClientClick="return confirm('are you sure you want to delete this')">Delete</asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                           </asp:GridView>
                        </td>
                      </tr>
                    </table>

                  

                    <table id="createuser" runat="server" visible="false" align="center" >
                        <tr>
                               <td align="center" colspan="2">
                                    <asp:Label ID="CreateClient" runat="server" Text="Create Client" Visible="false" ForeColor="#00277a" Font-Size="22px" Font-Bold="true">
                                    </asp:Label>
                                </td>

                        </tr>
                        <tr>
                            <td><br /></td>
                        </tr>
                       <tr>
                           <td   valign="top" align="right" class="style1">
                              <asp:Label ID="Literal3" runat="server" Text="First Name" Font-Names="Segoe UI" ForeColor="Black" />
                               <span  style="text-align:center;">*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                          </td>
                           <td align="left"  width="60%">
                              <asp:TextBox ID="utxtfname" runat="server"  Width="262px"  Height="22px" ></asp:TextBox>
                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="utxtfname"
                                 ErrorMessage="Provide First Name" ValidationGroup="RegForm" ForeColor="Red"><span >*</span></asp:RequiredFieldValidator>                
                             <br /> <br /> </td>
                        </tr>

                         <tr>
                        <td  class="style2" valign="top"  align="right">
                         <asp:Label ID="ltlsurname" runat="server" Text="Last Name" Font-Names="Segoe UI" ForeColor="Black" />
                            <span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                        </td>
                        <td align="left">
                        <asp:TextBox ID="utxtlname" runat="server" Width="262px"  Height="22px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="utxtlname"
                            ErrorMessage="Provide initial name" ValidationGroup="RegForm" ForeColor="Red"><span >*</span></asp:RequiredFieldValidator>                
                        <br /><br /></td>
                        </tr>

                        <tr>
                        <td  class="style2" valign="top"  align="right">
                        <asp:Label ID="Literal4" runat="server" Text="Email" Font-Names="Segoe UI" ForeColor="Black" />
                            <span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                        </td>
                        <td align="left">
                         <asp:TextBox ID="utxtemail" runat="server" Width="262px"  Height="22px" ></asp:TextBox>
                   <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="utxtemail" 
                        ErrorMessage="Provide email address" ValidationGroup="RegForm" ForeColor="Red"><span >*</span></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="utxtemail"
                            ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm"
                            ForeColor="Red"><span >*</span></asp:RegularExpressionValidator>
                        <asp:Label ID="regemail" runat="server" Visible="false"></asp:Label>
                       <br /><br /> </td>                
                        </tr>
                
                         <tr>
                    <td  class="style2" valign="top"  align="right">
                     <asp:Label ID="Literal8" runat="server" Text="Mobile Number" Font-Names="Segoe UI" ForeColor="Black" />
                        <span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                    </td>
                    <td  align="left">             
                      <asp:TextBox ID="utxtmobile" runat="server" MaxLength="10" Width="262px"  Height="22px" onkeypress="return onlyNos(event,this);" ></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="utxtmobile"
                        ErrorMessage="Provide a Phone number" ValidationGroup="RegForm" ForeColor="Red"><span >*</span></asp:RequiredFieldValidator>
                   <br />

                    <br /></td>
                    </tr>

                    <tr>
                    <td  class="style2" valign="top"  align="right">
                    <asp:Label ID="Literal6" runat="server" Text="Password" Font-Names="Segoe UI" ForeColor="Black"/>
                        <span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                    </td>
                    <td align="left">
                    <asp:TextBox ID="utxtpwd" runat="server"   Width="262px"  Height="22px">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="utxtpwd"
                        ErrorMessage="Provide a password" ValidationGroup="RegForm" ForeColor="Red"><span >*</span></asp:RequiredFieldValidator>
                 <br />  <br /> </td>
                    </tr>


                         <tr>
                    <td  class="style2" valign="top"  align="right">
                    <asp:Label ID="Literal2" runat="server" Text="Address" Font-Names="Segoe UI" ForeColor="Black" />
                        <span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                    </td>
                    <td  align="left">
                       
                     <asp:TextBox ID="utxtadd" runat="server"  TextMode="MultiLine"  Width="262px"  Height="40px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="utxtadd"
                        ErrorMessage="Provide Address" ValidationGroup="RegForm" ForeColor="Red"><span >*</span></asp:RequiredFieldValidator>
                    <br /><br />

                    </td>
                    </tr>

                     <tr>
                     <td></td>
                <td  align="left"  >
                
                <asp:ImageButton  ID="Create" ToolTip="Submit" runat="server"   
                        ImageUrl="~/images/submit.png" ValidationGroup="RegForm" OnClick="Create_Click" 
                        />
              <asp:ImageButton  ID="btncancel" runat="server" ImageUrl="~/images/cancel.png" OnClick="btncancel_Click" 
                        />

                <asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="RegForm" ShowMessageBox="True" ShowSummary="False"/>
                
                 </td>
                </tr>
                </table>

                </td>
            </tr>
         </table>

           <input type="button"  style="display: none;" id="btndummy" runat="server" />
                      <ajx:ModalPopupExtender ID="model1" runat="server" TargetControlID="btndummy" PopupControlID="pnledit" DropShadow="false" 
                          BackgroundCssClass="Modalpopup" CancelControlID="btnclose">      </ajx:ModalPopupExtender>
                      <div id="updateclient" runat="server">    
                        <asp:Panel runat="server" ID="pnledit" Width="800px" Height="450px" BorderColor="Black"   HorizontalAlign="Center" BackColor="#E6E6E6" >
                        <table width="80%" align="center"> 
                            <tr>
                                  <td width="100%" colspan="3">
                                    <table  align="center"  width="100%">
                                      <tr>
                                          <td align="center" >
                                             <asp:Label ID="Label1" runat="server" Text="Update Client"  ForeColor="#00277a" Font-Size="22px" Font-Bold="true">
                                             </asp:Label>
                                         </td>
                                          <td></td>
                                        <td  align="right"  >
                                             <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Larger" Width="30px" Height="30px"/>
                                        </td>
                                     </tr>
                                    </table>
                                </td>
                           </tr>

                               <tr><td><br /></td></tr>

                           <tr>
                              <td class="datab66" align="right" width="20%">
                                 First Name
                              </td>
                              <td width="5%">:</td>
                             <td align="left" width="20%">
                               <asp:TextBox ID="txtedfname" runat="server" Width="140px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtedfname" ErrorMessage="Please Enter First name" 
                                  ValidationGroup="UserIdCreation1" ToolTip="Please Enter First name" Display="Dynamic">*</asp:RequiredFieldValidator>  
                            </td>
                      
                         </tr>   
                            <tr>
                               <td class="datab66" align="right" width="20%">
                                 Last Name
                            </td>
                           <td width="5%">:</td>
                           <td align="left" width="30%">
                               <asp:TextBox ID="txtedlname" runat="server" Width="140px" ></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtedlname"
                                    ErrorMessage="Please Enter User name"  ValidationGroup="UserIdCreation1" ToolTip="Please Enter User name" Display="Dynamic">*</asp:RequiredFieldValidator>  
                          </td>
                            </tr>
                            <tr>
                                  <td class="datab66" align="right">
                                 Email Id
                              </td>
                              <td>:</td>
                              <td align="left">
                                <asp:TextBox ID="txtedmail" runat="server" Width="140px" Enabled="false"></asp:TextBox>                                                                           
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtedmail" ErrorMessage="Please Enter Email" 
                                ValidationGroup="UserIdCreation1" ToolTip="Please Enter Email" Display="Dynamic">*</asp:RequiredFieldValidator>  
                             </td>
                            </tr>

                            <tr>
                                 <td class="datab66" align="right">
                                   Mobile
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedmob" runat="server" Width="140px" MaxLength="10"></asp:TextBox>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="txtedmob" ErrorMessage="Please Enter Mobile Number" 
                                    ValidationGroup="UserIdCreation1" ToolTip="Please Enter Mobile Number" Display="Dynamic">*</asp:RequiredFieldValidator>  
                                </td>    
                            </tr>
                           <tr>
                                <td class="datab66" align="right">
                                   Address
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedaddress" runat="server" Width="140px"></asp:TextBox> 
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="txtedaddress" ErrorMessage="Please Enter Address" 
                                    ValidationGroup="UserIdCreation1" ToolTip="Please Enter Address" Display="Dynamic">*</asp:RequiredFieldValidator>  
                                </td>  
                            </tr>

                           <tr>
                               <td class="datab66" align="right">
                                 Password
                                </td>
                            <td>:</td>
                            <td align="left">                                        
                                <asp:TextBox ID="txtedcontact" runat="server"  Width="140px" ></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ControlToValidate="txtedcontact" ErrorMessage="Please Enter Password" 
                                ValidationGroup="UserIdCreation1" ToolTip="Please Enter Password" Display="Dynamic">*</asp:RequiredFieldValidator>  
                            </td>
                           </tr>

                           <tr>
                             <td>
                                &nbsp;
                             </td>
                           </tr>
                     
                        <tr>
                            <td><br /></td>
                        </tr>
                   
                     <tr>
                     <td>&nbsp;</td>
                         <td></td>

                    <td  align="left"  >
                
                <asp:ImageButton  ID="ImageButton1" ToolTip="Submit" runat="server"   
                        ImageUrl="~/images/update.png" ValidationGroup="RegForm1" OnClick="ImageButton1_Click" />
              <asp:ImageButton  ID="ImageButton2" runat="server" ImageUrl="~/images/cancel.png" OnClick="btncancel_Click" />

                <asp:ValidationSummary runat="server" ID="ValidationSummary2" ValidationGroup="RegForm" ShowMessageBox="True" ShowSummary="False"/>
                
                 </td>
                </tr>
                
                        </table>
                            </asp:Panel>
    </div>
        </div>
    </form>
</body>
</html>
