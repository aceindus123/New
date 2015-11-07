<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_3Tier.Admin.Home" %>
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
    <div  width="100%"  align="center">
     <ajx:ToolkitScriptManager ID="asp" runat="server"></ajx:ToolkitScriptManager>
        <table width="100%"  align="center">
            <tr>
                <td  align="center" width="100%">
                    <uc1:TopUser runat="server" ID="TopUser" />
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <uc1:Menu runat="server" ID="Menu1" />
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
