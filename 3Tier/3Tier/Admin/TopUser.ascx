<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopUser.ascx.cs" Inherits="_3Tier.Admin.TopUser" %>
<link href="../CSS/adminstyle.css" rel="stylesheet" />



      <table width="1200px" style="padding-top:168px;background-image:url(images/adminlogo.jpg); background-repeat:no-repeat;height:208px;text-align:center;" >
             <tr>
                <td   align="center"  >
                    <asp:Label ID="user" runat="server"  ForeColor="White" Font-Size="18px" Visible="false" Font-Bold="true"> </asp:Label>
                </td>
                 <td   align="center">
                   <asp:LinkButton ID="logout" runat="server" Text="Logout"  ForeColor="White" Font-Underline="false" Font-Size="18px"  
                       Visible="false" Font-Bold="true" OnClick="logout_Click"> </asp:LinkButton>
                </td>
             </tr>
          <tr>
              <td>&nbsp;</td>
          </tr>
      </table>
