<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_3Tier.Admin.Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/Admin/TopUser.ascx" TagPrefix="uc1" TagName="TopUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <ajx:ToolkitScriptManager ID="asp" runat="server"></ajx:ToolkitScriptManager>
        <table width="1200px" border="0" align="center">
            <tr>
                <td width="100%" border="0" align="center">
                    <uc1:TopUser runat="server" ID="TopUser" />
                </td>
            </tr>

            <tr>
                <td width="100%" align="center">
                    <table  width="100%" border="0" align="center">
                          <tr>
                             <td  align="center"  width="100%"  >
                                <img src="Images/newsletters.gif" align="middle" alt=""/>
                                <asp:Label ID="lablogin" runat ="server" Text="Admin Login"   Font-Bold="True" Font-Names="Arial" Font-Size="14pt"
                                       ForeColor="#666666"></asp:Label>
                            </td>
                         </tr>
                          <tr>
                             <td>
                                 <br />
                             </td>
                          </tr>

                          <tr>
                             <td align="center"  width="100%">
                                 <table align="center"  width="40%">
                                     
                         <tr >
                              <td  style="font-size:15px " height="30" align="right"  > 
                                  <asp:Label ID ="ltrlUserName" Text="User Type :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"
                                       ForeColor="#006699" ></asp:Label>
                              </td>
                              <td  style="padding-left:15px; line-height:20px;" align="left" > 
                                    <asp:DropDownList ID="ddlUsertype" runat="server" Width="192px" Height="22px" Font-Names="Arial" Font-Size="11pt">
                                        <asp:ListItem Text="Select" Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="Admin" >Admin</asp:ListItem>
                                        <asp:ListItem Text="Web Admin" >Web Admin</asp:ListItem>
                                        <asp:ListItem Text="Developer" >Developer</asp:ListItem>
                                        <asp:ListItem Text="Analyst" >Analyst</asp:ListItem>
                                        <asp:ListItem Text="Sales" >Sales</asp:ListItem>
                                        <asp:ListItem Text="Customer Service">Customer Service</asp:ListItem>
                                         <asp:ListItem Text="Support" >Support</asp:ListItem>
                                        <asp:ListItem Text="Business Development" >Business Development</asp:ListItem>
                                      </asp:DropDownList>
                                      <asp:RequiredFieldValidator ID="rfvddlUsertype" runat="server" ErrorMessage="Select user type"  ForeColor="Red"
                                        ValidationGroup="login" ControlToValidate="ddlUsertype" InitialValue="Select">*</asp:RequiredFieldValidator>
                               </td>
                          </tr>

                          <tr >
                              <td  align="right" style="font-size:15px" height="30"><asp:Label ID ="Label1" Text="Country :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label></td>
                              <td colspan="4" style="padding-left:15px;"> 
                                 <asp:DropDownList ID="ddlCountry" runat="server" Width="192px" Height="22px" Font-Names="Arial" Font-Size="11pt">
                                        <asp:ListItem Text="Select" Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Text="India" >India</asp:ListItem>
                                        <asp:ListItem Text="USA" >USA</asp:ListItem>
                                        <asp:ListItem Text="UK" >UK</asp:ListItem>
                                        <asp:ListItem Text="Australia" >Australia</asp:ListItem>
                                        <asp:ListItem Text="Singapoor" >Singapore</asp:ListItem>
                                      </asp:DropDownList> 
                                      <asp:RequiredFieldValidator ID="rfvddlCountry" runat="server" ErrorMessage="Select country"   ForeColor="Red"
                                              ValidationGroup="login" ControlToValidate="ddlCountry" InitialValue="Select">*</asp:RequiredFieldValidator>
                              </td>
                            </tr>
      
                            <tr >
                               <td height="30" align="right" style="font-size:15px">
                                   <asp:Label ID ="Label2" Text="User Name :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" 
                                       ForeColor="#006699" ></asp:Label>
                               </td>
                               <td colspan="4" style="padding-left:15px;"> 
                                   <asp:TextBox ID="txtuname" runat="server" Width="186px" Height="18px" Font-Names="Arial" Font-Size="11pt"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" Enter User Name" ControlToValidate="txtuname"
                                        ValidationGroup="login"  ForeColor="Red">*</asp:RequiredFieldValidator>
                                   <ajx:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="true" TargetControlID="txtuname"
                                        WatermarkText="Enter User Name" WatermarkCssClass="watermarked">  </ajx:TextBoxWatermarkExtender>
                               </td>
                           </tr>
    
                           <tr>
                              <td align="right" style="font-size:15px">
                                  <asp:Label ID ="Label3" Text="Password :" runat ="server" Font-Bold="True" Font-Names="Arial"
                                   Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                              </td>
                              <td colspan="4" valign="top" style="padding-left:15px;">
                                <asp:TextBox ID="txtpwd" runat="server" Width="186px" Height="18px" TextMode="Password" CausesValidation="true"
                                     Font-Names="Arial" Font-Size="11pt"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvpwd" ControlToValidate="txtpwd"  
                                    runat="server" ErrorMessage="Enter the Password" ValidationGroup="login"  ForeColor="Red">*</asp:RequiredFieldValidator>
                                 <ajx:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="true" TargetControlID="txtpwd" 
                                     WatermarkText="Enter Password"  WatermarkCssClass="watermarked"> </ajx:TextBoxWatermarkExtender>
                              </td>
                            </tr>

                         <tr>
                              <td colspan="5" style="padding-top:23px;padding-right:10px" align="center">
                                   <asp:ImageButton ID="btnlogin" runat="server" ImageUrl="~/Images/login.png" OnClick="Signin_Click" ValidationGroup="login" />
                              </td>
                         </tr>
                                 </table>
                             </td>
                         </tr>

                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
