<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="_3Tier.Admin.Users" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/Admin/TopUser.ascx" TagPrefix="uc1" TagName="TopUser" %>
<%@ Register Src="~/Admin/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/adminstyle.css" rel="stylesheet" />
      <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.tools.min.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

    <script language="Javascript" type="text/javascript">
                   Users_Information
                   function isNumberKey(evt) {
                       var charCode = (evt.which) ? evt.which : event.keyCode
                       if (charCode != 46 && charCode > 31
               && (charCode < 48 || charCode > 57))
                           return false;

                       return true;
                   }
    </script>

       <script type="text/javascript" language="javascript">
           function confirmMessageDelete(frm) {
               for (i = 0; i < frm.length; i++) {
                   if (frm.elements[i].checked) {
                       return confirm("Are you sure you want to delete the selected record?");
                       return true;
                   }
               }
               alert('select atleast one Checkbox for Delete!');
               return false;
           }
</script>

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
                <td>
                   <div id="createuser1" runat="server" visible="false">
                           <table border="0" width="100%">
                               <tr>
                                   <td>
                                      <table width="100%" border="0" id="create" runat="server" >      
                                        <tr>
                                           <td><br /></td>
                                        </tr>  
                                                      
                                        <tr>
                                           <td colspan="6" align="center">                                                
                                              <font size="5" color="#0e4860"><strong>Create User</strong></font>
                                          </td>
                                        </tr>

                                         <tr>
                                           <td></td>
                                        </tr>

                                        <tr><td colspan="6" style="height:25px" ></td></tr>

                                        <tr>
                                            <td class="datab" align="right" width="25%" height="30px" style="margin-top:-10px" valign="top" >
                                                Full Name
                                           </td>

                                           <td width="5%" style="margin-top:-5px"  valign="top" >:</td>

                                           <td align="left" width="20%"  style="margin-top:-5px"  valign="top">
                                                <asp:TextBox ID="txtFName" runat="server" Width="140px" ></asp:TextBox>
                                           </td>

                                           <td class="datab" align="right" width="10%" style="margin-top:-10px"  >
                                               User Name
                                           </td>

                                           <td width="5%" style="margin-top:-5px" valign="top" >:</td>

                                           <td align="left" width="35%" valign="top" >
                                               <asp:TextBox ID="txtLName" runat="server" Width="140px" AutoPostBack="true" OnTextChanged="txtLName_TextChanged"></asp:TextBox>
                                               <asp:Label ID="lblmsg" runat="server" Width="200px" ForeColor="Green" ></asp:Label>
                                           </td>
                                       </tr>  
                                     
                                       <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px"> 
                                            <asp:RequiredFieldValidator ID="rfvFName" runat="server"   ErrorMessage="Please enter First Name" ControlToValidate="txtFName" 
                                                ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName" ErrorMessage="Please enter User Name" 
                                                ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                      </tr>

                                      <tr>
                                          <td class="datab" align="right">
                                             Designation
                                         </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlUserType" runat="server" Width="140px">
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
                                        </td> 
                                         <td class="datab" align="right">
                                           Country
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlCountry" runat="server" Width="140px">
                                            <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                            <asp:ListItem Value="India">India</asp:ListItem>
                                            <asp:ListItem Value="USA">USA</asp:ListItem>
                                            </asp:DropDownList>                                                                                                                                                  
                                        </td>                                         
                                    </tr>   
                                                                                    
                                     <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvddlUserType" runat="server"  ControlToValidate="ddlUserType" ErrorMessage="Please select designation" 
                                                ValidationGroup="UserIdCreation" InitialValue="Select" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Please select Country" 
                                                ValidationGroup="UserIdCreation" InitialValue="Select Country" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                     </tr>
                                    
                                     <tr>
                                        <td class="datab" align="right">
                                           Password</td>
                                        <td>:</td>
                                        <td align="left">                                        
                                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                                        </td>
                                        <td class="datab" align="right">
                                          Confirm Password
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtconPwd" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" ErrorMessage="Please enter password" 
                                                ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rftxtconPwd" runat="server" ControlToValidate="txtconPwd" ErrorMessage="Please Confirm Password" 
                                                ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                            <asp:CompareValidator ID="cmvalPwd" runat="server" ErrorMessage="Please enter password correctly" ControlToCompare="txtPwd" 
                                                ControlToValidate="txtconPwd" ValidationGroup="UserIdCreation" ForeColor="Red"></asp:CompareValidator>
                                        </td>
                                     </tr>

                                     <tr>
                                        <td class="datab" align="right">
                                           Address
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtAddress" runat="server" Width="140px"></asp:TextBox>                                
                                        </td>  
                                         <td class="datab" align="right">
                                           Mobile
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtMobile" runat="server" Width="140px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>&nbsp;&nbsp; Eg:9xxxxxxxxx                               
                                        </td>                                       
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvtxtAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter address" 
                                                ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">                                            
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMobile"
                                              ErrorMessage="Please enter mobile number"  ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="datab" align="right">
                                           Contact Number
                                        </td>
                                        <td>:</td>
                                        <td align="left">                                        
                                            <asp:TextBox ID="txtConNumber" runat="server" onkeypress="return isNumberKey(event)" MaxLength="11" Width="140px"></asp:TextBox>                                                                                                                                                  
                                        </td>
                                        <td class="datab" align="right">
                                           Email Id
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtEmailId" runat="server" Width="140px"></asp:TextBox>                                                                           
                                        </td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvtxtConNumber" runat="server"  ForeColor="Red"
                                                ControlToValidate="txtConNumber" ErrorMessage="Please enter contact number" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                             <asp:RequiredFieldValidator ID="rfvtxtEmailId" runat="server"  ForeColor="Red"
                                                ControlToValidate="txtEmailId" ErrorMessage="Please enter Email Id" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator> <br />
                                            <asp:RegularExpressionValidator ID="rfvEmailid" runat="server"    ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx" 
                                                 ControlToValidate="txtEmailId"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                 ValidationGroup="UserIdCreation" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                       <td colspan="6"  width="90%" align="center">
                                           <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                               <ContentTemplate> 
                                                    <table  width="90%" align="center">
                                                          <tr>
                                                            <td width="15%">
                                                                  <asp:Label ID="lblclients" runat="server" Text="Clients" Font-Size="16px"></asp:Label>
                                                                   <asp:RadioButton ID="rdclientsyes" runat="server" Text="Yes"  GroupName="clients" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdclientsyes_CheckedChanged"/>
                                                                    <asp:RadioButton ID="rdclientsno" runat="server" Text="No" Checked="true"  GroupName="clients" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdclientsno_CheckedChanged" /> &nbsp;&nbsp;&nbsp;&nbsp;
                                                             </td>

                                                              <td width="15%">
                                                                   <asp:Label ID="lblada" runat="server" Text="Posted Ads" Font-Size="16px"></asp:Label>
                                                                   <asp:RadioButton ID="rdadsyes" runat="server" Text="Yes"  GroupName="ads"  Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdadsyes_CheckedChanged"/>
                                                                   <asp:RadioButton ID="rdadsno" runat="server" Text="No" Checked="true"  GroupName="ads"  Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdadsno_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                              </td>
    
                                                             <td width="15%"> 
                                                                   <asp:Label ID="lblus" runat="server" Text="Contact Us" Font-Size="16px"></asp:Label>
                                                                   <asp:RadioButton ID="rdusyes" runat="server" Text="Yes"   GroupName="us" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdusyes_CheckedChanged"/>
                                                                    <asp:RadioButton ID="rdusno" runat="server" Text="No" Checked="true"  GroupName="us" Font-Size="16px"  AutoPostBack="true" OnCheckedChanged="rdusno_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                              </td>
     
                                                               <td width="15%"> 
                                                                      <asp:Label ID="lblfeed" runat="server" Text="Feedback" Font-Size="16px"></asp:Label>
                                                                     <asp:RadioButton ID="rdfeedyes" runat="server" Text="Yes"  GroupName="feed" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdfeedyes_CheckedChanged"/>
                                                                    <asp:RadioButton ID="rdfeedno" runat="server" Text="No" Checked="true"  GroupName="feed" Font-Size="16px"  AutoPostBack="true" OnCheckedChanged="rdfeedno_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
    
                                                                <td width="15%"> 
                                                                      <asp:Label ID="lblsupport" runat="server" Text="Support" Font-Size="16px"></asp:Label>
                                                                     <asp:RadioButton ID="rdsupportyes" runat="server" Text="Yes"  GroupName="support" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdsupportyes_CheckedChanged"/>
                                                                      <asp:RadioButton ID="rdsupportno" runat="server" Text="No" Checked="true" GroupName="support" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdsupportno_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
       
                                                                 <td width="15%"> 
                                                                      <asp:Label ID="lblusers" runat="server" Text="Users" Font-Size="16px"></asp:Label>
                                                                       <asp:RadioButton ID="rdusersyes" runat="server" Text="Yes" GroupName="users" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdusersyes_CheckedChanged"/>
                                                                        <asp:RadioButton ID="rdusersno" runat="server" Text="No" Checked="true" GroupName="users" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="rdusersno_CheckedChanged"/>
                                                                </td>
                                                           </tr>
                                                    </table>
                                               </ContentTemplate>
                                           </asp:UpdatePanel>
                                       </td>
                                   </tr>

                                    <tr>
                                        <td  colspan="6"  width="100%" align="center">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                               <ContentTemplate> 
                                                   <table  width="90%" align="center">
                                                        <tr>
                                                          <td width="15%" valign="top">
                                                             <table id="client" runat="server">
                                                                <tr id="t1" runat="server" >
                                                                  <td>
                                                                    <asp:CheckBox ID="chkselectall" runat="server"  AutoPostBack="true" OnCheckedChanged="chkselectall_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                                                 <tr id="t2" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="chkview" runat="server"  AutoPostBack="true" OnCheckedChanged="chkview_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                                                 <tr id="t3" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="chkedit" runat="server"  AutoPostBack="true" OnCheckedChanged="chkedit_CheckedChanged"/>&nbsp; &nbsp;Update
                                                                  </td>
                                                                </tr>
                                                
                                                 
                                                                 <tr id="t4" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="chkstatus" runat="server" AutoPostBack="true" OnCheckedChanged="chkstatus_CheckedChanged"/>&nbsp; &nbsp;Status
                                                                  </td>
                                                                </tr>
                                               
                                                                 <tr id="t5" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkdelete_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>
                                          
                                                                 <tr id="t6" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="chkcreate" runat="server" AutoPostBack="true" OnCheckedChanged="chkcreate_CheckedChanged"/>&nbsp; &nbsp;Create Client 
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                        </td>

                                                        <td width="15%" valign="top">
                                                             <table id="2">
                                                                <tr id="t7" runat="server">
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                                                 <tr id="t8" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                               
                                                                 <tr id="t9" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox3_CheckedChanged"/>&nbsp; &nbsp;Status
                                                                  </td>
                                                                </tr>
                                            
                                                                 <tr id="t10" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox4_CheckedChanged" />&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>

                                                                  <tr id="t11" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox5_CheckedChanged" />&nbsp; &nbsp;Create Ad
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                         </td>

                                                         <td width="15%" valign="top">
                                                             <table id="3">
                                                                <tr id="t12" runat="server">
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox6" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox6_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                                                 <tr id="t13" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox7_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                                                 <tr id="t14" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox8" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox8_CheckedChanged"/>&nbsp; &nbsp;Email
                                                                  </td>
                                                                </tr>
                                                 
                                                                 <tr id="t15" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox9" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox9_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                          </td>

                                                         <td width="15%" valign="top">
                                                             <table id="4">
                                                                <tr id="t16" runat="server">
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox10" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox10_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                              
                                                                 <tr id="t17" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox11" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox11_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                              
                                                                 <tr id="t18" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox12" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox12_CheckedChanged"/>&nbsp; &nbsp;Email
                                                                  </td>
                                                                </tr>
                                                                 <tr id="t19" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox13" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox13_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                       </td>

                                                       <td width="15%" valign="top">
                                                         <table id="5">
                                                            <tr id="t20" runat="server">
                                                              <td>
                                                                <asp:CheckBox ID="CheckBox14" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox14_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                              </td>
                                                            </tr>
                                                             <tr id="t21" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox15" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox15_CheckedChanged"/>&nbsp; &nbsp;View
                                                              </td>
                                                            </tr>
                                                            <tr id="t22" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox16" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox16_CheckedChanged"/>&nbsp; &nbsp;Solution
                                                              </td>
                                                            </tr>
                                          
                                                             <tr id="t23" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox17" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox17_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                              </td>
                                                            </tr>
                                                         </table>
                                                      </td>

                                                     <td width="15%" valign="top">
                                                         <table id="6">
                                                            <tr id="t24" runat="server">
                                                              <td>
                                                                <asp:CheckBox ID="CheckBox18" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox18_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                              </td>
                                                            </tr>
                                                             <tr id="t25" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox19" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox19_CheckedChanged" />&nbsp; &nbsp;View
                                                              </td>
                                                            </tr>
                                                             <tr id="t26" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox20" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox20_CheckedChanged" />&nbsp; &nbsp;Update
                                                              </td>
                                                            </tr>
                                                             <tr id="t27" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox21" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox21_CheckedChanged"/>&nbsp; &nbsp;Status
                                                              </td>
                                                            </tr>
                                                             <tr id="t28" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox22" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox22_CheckedChanged" />&nbsp; &nbsp;Delete
                                                              </td>
                                                            </tr>
                                                             <tr id="t29" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox23" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox23_CheckedChanged"/>&nbsp; &nbsp;Create
                                                              </td>
                                                            </tr>
                                                         </table>
                                                    </td>
                                                 </tr>
                                                </table>
                                               </ContentTemplate>
                                            </asp:UpdatePanel>
                                       </td>
                                    </tr>
                                           
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                         <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="4" >
                                           <asp:ImageButton ID="btn1" runat="server" ImageUrl="~/images/create.png" Font-Size="15px"   
                                                ValidationGroup="UserIdCreation" OnClick="btn1_Click" />

                                          <asp:ImageButton ID="btncancel" runat="server" ImageUrl="~/images/cancel.png" Font-Size="15px" OnClick="btncancel_Click" /> 
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table >
                     </div>

                     <br />
                     <div id="gvdisplay" runat="server">
                       <table width="90%" align="center" >
                         
                            <tr align="left">
                               <td height="10px" style="padding-left:0px; padding-top:20px">
                                  <table id="Table1" width="100%"  runat="server">
                                    <tr>
                                       <td align="center" id="View" runat="server">
                                           <font size="5" color="#00277a"><strong>Users List</strong></font>
                                         </td>
                                       <td align="right">
                                          <asp:ImageButton ID="lnkcreate" runat="server" ForeColor="Blue"   ImageUrl="~/images/cu.png" Font-Size="18px" OnClick="lnkcreate_Click"  ></asp:ImageButton>                       
                                      </td>
                                    </tr>
                                  </table>
                               </td>
                            </tr>
                            <tr><td><br /></td></tr>

                            <tr id="View1" runat="server">
                                <td height="100px" style="padding-left:0px; padding-right:0px">                        
                                  <asp:GridView ID="gvusers" runat="server"   Width="100%" AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                                       DataKeyNames="id" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  Font-Overline="False" Font-Size="12pt"
                                       Font-Strikeout="False"  Font-Underline="False"   BackColor="White" AllowPaging="True" PagerStyle-Mode="NumericPages"  
                                      PagerStyle-BackColor="White"   PageSize="10" OnPageIndexChanging="PageIndexChanging" >
                                     <Columns>
                                   <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center" >
                                         <HeaderTemplate>
                                            User Name
                                         </HeaderTemplate>
                                        <ItemTemplate >
                                            <asp:LinkButton ID="lnkuname"  ForeColor="Blue" runat="server"   Text='<%#Eval("username")%>' Font-Underline="false"
                                                CommandArgument='<%#Eval("id") %>'   OnCommand="ListName"></asp:LinkButton>
                                        </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:BoundField DataField="password" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Password"    />            
                                     <asp:BoundField DataField="FName"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Full Name" SortExpression="FName" />
                                     <asp:BoundField DataField="usertype"  ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Usertype" />
                                     <asp:BoundField DataField="Country"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Country"/>
                                     <asp:BoundField DataField="Address"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Address"/>
                                     <asp:BoundField DataField="mobile"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Mobile"/>
                                     <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center" >
                                         <HeaderTemplate>
                                            Status
                                         </HeaderTemplate>
                                        <ItemTemplate >
                                            <asp:LinkButton ID="lblstatus"  ForeColor="Blue" runat="server"   Text='<%#Eval("txtStatus")%>' Font-Underline="false"
                                                CommandArgument='<%#Eval("id") %>'   OnCommand="ListName1" ></asp:LinkButton>
                                        </ItemTemplate>
                                     </asp:TemplateField>
                                           <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center" >
                                         
                                        <ItemTemplate >
                                            <asp:LinkButton ID="linkdelete"  ForeColor="Blue" runat="server"   Text="Delete" Font-Underline="false"
                                                CommandArgument='<%#Eval("id") %>'   OnCommand="ListName2"  OnClientClick="return confirm('are you sure you want to delete this')"></asp:LinkButton>
                                        </ItemTemplate>
                                     </asp:TemplateField>
                                   </Columns>
                                </asp:GridView>
                              </td>
                            </tr>

                            <tr>
                              <td>
                                <asp:Label ID="checked_label" runat="server"></asp:Label>&nbsp; 
                                <asp:Label ID="lblId" runat="server"></asp:Label>
                             </td>
                         </tr>
                       </table>
                     </div>
             
                      <input type="button"  style="display: none;" id="btndummy" runat="server" />
                      <ajx:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" PopupControlID="pnledit" DropShadow="false" 
                          BackgroundCssClass="Modalpopup" CancelControlID="btnclose">      </ajx:ModalPopupExtender>
                      <div>    
                        <asp:Panel runat="server" ID="pnledit" Width="1200px" Height="450px" BorderColor="Black"  HorizontalAlign="Center" BackColor="#E6E6E6" >
                        <table width="100%"> 
                            <tr>
                                  <td colspan="6">
                                    <table  align="right" >
                                      <tr>
                                        <td width="100%" align="right" style="padding-right:10px; padding-top:8px;" valign="middle"  >
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="txtedfname" ErrorMessage="Please Enter First name" 
                                  ValidationGroup="UserIdCreation1" ToolTip="Please Enter First name" Display="Dynamic">*</asp:RequiredFieldValidator>  
                            </td>
                            <td class="datab66" align="right" width="20%">
                                 User Name
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
                                   Designation
                            </td>
                             <td>:</td>
                             <td align="left">
                                <asp:DropDownList ID="ddleddesgn" runat="server" Width="140px">
                                         <asp:ListItem Text="Select" >Select</asp:ListItem>
                                        <asp:ListItem Text="Admin" >Admin</asp:ListItem>
                                        <asp:ListItem Text="Web Admin" >Web Admin</asp:ListItem>
                                        <asp:ListItem Text="Developer" >Developer</asp:ListItem>
                                        <asp:ListItem Text="Analyst" >Analyst</asp:ListItem>
                                        <asp:ListItem Text="Sales" >Sales</asp:ListItem>
                                        <asp:ListItem Text="Customer Service">Customer Service</asp:ListItem>
                                         <asp:ListItem Text="Support" >Support</asp:ListItem>
                                        <asp:ListItem Text="Business Development" >Business Development</asp:ListItem>
                                </asp:DropDownList>    
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddleddesgn" ErrorMessage="Please select Designation" 
                               ValidationGroup="UserIdCreation1" ToolTip="Please select Designation" Display="Dynamic" >*</asp:RequiredFieldValidator>                                                                                                                                               
                           </td> 

                            <td class="datab66" align="right">
                              Country
                           </td>
                           <td>:</td>
                           <td align="left">
                               <asp:DropDownList ID="ddledcountry" runat="server" Width="140px" >
                                    <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                    <asp:ListItem Value="India">India</asp:ListItem>
                                    <asp:ListItem Value="USA">USA</asp:ListItem>
                               </asp:DropDownList>   
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddledcountry" ErrorMessage="Please select Country" 
                                ValidationGroup="UserIdCreation1" >*</asp:RequiredFieldValidator>                                                                                                                                               
                              </td>                                         
                           </tr>     
                                                                     
                           <tr>
                                <td class="datab66" align="right">
                                   Address
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedaddress" runat="server" Width="140px"></asp:TextBox> 
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="txtedaddress" ErrorMessage="Please Enter Address" 
                                    ValidationGroup="UserIdCreation1" ToolTip="Please Enter Address" Display="Dynamic">*</asp:RequiredFieldValidator>  
                                </td>  
                                 <td class="datab66" align="right">
                                   Mobile
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedmob" runat="server" Width="140px" MaxLength="10"></asp:TextBox>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="txtedmob" ErrorMessage="Please Enter Mobile Number" 
                                    ValidationGroup="UserIdCreation1" ToolTip="Please Enter Mobile Number" Display="Dynamic">*</asp:RequiredFieldValidator>  
                                </td>                                       
                            </tr>

                           <tr>
                                   <td class="datab66" align="right">
                                 Password
                                </td>
                            <td>:</td>
                            <td align="left">                                        
                                <asp:TextBox ID="txtedcontact" runat="server"  Width="140px" ></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtedcontact" ErrorMessage="Please Enter Password" 
                                ValidationGroup="UserIdCreation1" ToolTip="Please Enter Password" Display="Dynamic">*</asp:RequiredFieldValidator>  
                            </td>
                              <td class="datab66" align="right">
                                 Email Id
                              </td>
                              <td>:</td>
                              <td align="left">
                                <asp:TextBox ID="txtedmail" runat="server" Width="140px" Enabled="false"></asp:TextBox>                                                                           
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtedmail" ErrorMessage="Please Enter Email" 
                                ValidationGroup="UserIdCreation1" ToolTip="Please Enter Email" Display="Dynamic">*</asp:RequiredFieldValidator>  
                             </td>
                           </tr>

                           <tr>
                             <td>
                                &nbsp;
                             </td>
                           </tr>

                           <tr> 
                               <td colspan="6"  width="100%" align="center">
                                      <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                         <ContentTemplate> 
                                              <table  width="100%" align="center">
                                                          <tr>
                                                            <td width="15%">
                                                                  <asp:Label ID="Label1" runat="server" Text="Clients" Font-Size="16px"></asp:Label>
                                                                   <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes"  GroupName="clients" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton1_CheckedChanged"/>
                                                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="No" Checked="true"  GroupName="clients" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton2_CheckedChanged" /> &nbsp;&nbsp;&nbsp;&nbsp;
                                                             </td>

                                                              <td width="15%">
                                                                   <asp:Label ID="Label2" runat="server" Text="Posted Ads" Font-Size="16px"></asp:Label>
                                                                   <asp:RadioButton ID="RadioButton3" runat="server" Text="Yes"  GroupName="ads"  Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton3_CheckedChanged"/>
                                                                   <asp:RadioButton ID="RadioButton4" runat="server" Text="No" Checked="true"  GroupName="ads"  Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton4_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                              </td>
    
                                                             <td width="15%"> 
                                                                   <asp:Label ID="Label3" runat="server" Text="Contact Us" Font-Size="16px"></asp:Label>
                                                                   <asp:RadioButton ID="RadioButton5" runat="server" Text="Yes"   GroupName="us" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton5_CheckedChanged"/>
                                                                    <asp:RadioButton ID="RadioButton6" runat="server" Text="No" Checked="true"  GroupName="us" Font-Size="16px"  AutoPostBack="true" OnCheckedChanged="RadioButton6_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                              </td>
     
                                                               <td width="15%"> 
                                                                      <asp:Label ID="Label4" runat="server" Text="Feedback" Font-Size="16px"></asp:Label>
                                                                     <asp:RadioButton ID="RadioButton7" runat="server" Text="Yes"  GroupName="feed" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton7_CheckedChanged"/>
                                                                    <asp:RadioButton ID="RadioButton8" runat="server" Text="No" Checked="true"  GroupName="feed" Font-Size="16px"  AutoPostBack="true" OnCheckedChanged="RadioButton8_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
    
                                                                <td width="15%"> 
                                                                      <asp:Label ID="Label5" runat="server" Text="Support" Font-Size="16px"></asp:Label>
                                                                     <asp:RadioButton ID="RadioButton9" runat="server" Text="Yes"  GroupName="support" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton9_CheckedChanged"/>
                                                                      <asp:RadioButton ID="RadioButton10" runat="server" Text="No" Checked="true" GroupName="support" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton10_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
       
                                                                 <td width="15%"> 
                                                                      <asp:Label ID="Label6" runat="server" Text="Users" Font-Size="16px"></asp:Label>
                                                                       <asp:RadioButton ID="RadioButton11" runat="server" Text="Yes" GroupName="users" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton11_CheckedChanged"/>
                                                                        <asp:RadioButton ID="RadioButton12" runat="server" Text="No" Checked="true" GroupName="users" Font-Size="16px" AutoPostBack="true" OnCheckedChanged="RadioButton12_CheckedChanged"/>
                                                                </td>
                                                           </tr>
                                                    </table>
                                        </ContentTemplate>
                                      </asp:UpdatePanel>
                               </td>
                            </tr>  

                           <tr>
                                <td  colspan="6"  width="100%" align="center">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                         <ContentTemplate> 
                                                   <table  width="100%" align="center">
                                                        <tr>
                                                          <td width="15%" valign="top">
                                                             <table id="Table2">
                                                                <tr id="Tr1" runat="server" >
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox24" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox24_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                                                 <tr id="Tr2" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox25" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox25_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                                                 <tr id="Tr3" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox26" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox26_CheckedChanged"/>&nbsp; &nbsp;Update
                                                                  </td>
                                                                </tr>
                                                 
                                                                 <tr id="Tr4" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox27" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox27_CheckedChanged"/>&nbsp; &nbsp;Status
                                                                  </td>
                                                                </tr>
                                               
                                                                 <tr id="Tr5" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox28" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox28_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>
                                          
                                                                 <tr id="Tr6" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox29" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox29_CheckedChanged"/>&nbsp; &nbsp;Create Client 
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                        </td>

                                                        <td width="15%" valign="top">
                                                             <table id="Table3">
                                                                <tr id="Tr7" runat="server">
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox30" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox30_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                                                 <tr id="Tr8" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox31" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox31_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                               
                                                                 <tr id="Tr9" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox32" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox32_CheckedChanged"/>&nbsp; &nbsp;Status
                                                                  </td>
                                                                </tr>
                                            
                                                                 <tr id="Tr10" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox33" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox33_CheckedChanged" />&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>

                                                                  <tr id="Tr11" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox34" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox34_CheckedChanged" />&nbsp; &nbsp;Create Ad
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                         </td>

                                                         <td width="15%" valign="top">
                                                             <table id="Table4">
                                                                <tr id="Tr12" runat="server">
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox35" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox35_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                                                 <tr id="Tr13" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox36" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox36_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                                                 <tr id="Tr14" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox37" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox37_CheckedChanged"/>&nbsp; &nbsp;Email
                                                                  </td>
                                                                </tr>
                                                 
                                                                 <tr id="Tr15" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox38" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox38_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                          </td>

                                                         <td width="15%" valign="top">
                                                             <table id="Table5">
                                                                <tr id="Tr16" runat="server">
                                                                  <td>
                                                                    <asp:CheckBox ID="CheckBox39" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox39_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                                  </td>
                                                                </tr>
                                              
                                                                 <tr id="Tr17" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox40" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox40_CheckedChanged"/>&nbsp; &nbsp;View
                                                                  </td>
                                                                </tr>
                                              
                                                                 <tr id="Tr18" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox41" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox41_CheckedChanged"/>&nbsp; &nbsp;Email
                                                                  </td>
                                                                </tr>
                                                                 <tr id="Tr19" runat="server">
                                                                  <td>
                                                                     <asp:CheckBox ID="CheckBox42" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox42_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                                  </td>
                                                                </tr>
                                                             </table>
                                                       </td>

                                                       <td width="15%" valign="top">
                                                         <table id="Table6">
                                                            <tr id="Tr20" runat="server">
                                                              <td>
                                                                <asp:CheckBox ID="CheckBox43" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox43_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                              </td>
                                                            </tr>
                                                             <tr id="Tr21" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox44" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox44_CheckedChanged"/>&nbsp; &nbsp;View
                                                              </td>
                                                            </tr>
                                                            <tr id="Tr22" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox45" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox45_CheckedChanged"/>&nbsp; &nbsp;Solution
                                                              </td>
                                                            </tr>
                                          
                                                             <tr id="Tr23" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox46" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox46_CheckedChanged"/>&nbsp; &nbsp;Delete
                                                              </td>
                                                            </tr>
                                                         </table>
                                                      </td>

                                                     <td width="15%" valign="top">
                                                         <table id="Table7">
                                                            <tr id="Tr24" runat="server">
                                                              <td>
                                                                <asp:CheckBox ID="CheckBox47" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox47_CheckedChanged"/>&nbsp; &nbsp;Select All
                                                              </td>
                                                            </tr>
                                                             <tr id="Tr25" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox48" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox48_CheckedChanged" />&nbsp; &nbsp;View
                                                              </td>
                                                            </tr>
                                                             <tr id="Tr26" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox49" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox49_CheckedChanged" />&nbsp; &nbsp;Update
                                                              </td>
                                                            </tr>
                                                             <tr id="Tr27" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox50" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox50_CheckedChanged"/>&nbsp; &nbsp;Status
                                                              </td>
                                                            </tr>
                                                             <tr id="Tr28" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox51" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox51_CheckedChanged" />&nbsp; &nbsp;Delete
                                                              </td>
                                                            </tr>
                                                             <tr id="Tr29" runat="server">
                                                              <td>
                                                                 <asp:CheckBox ID="CheckBox52" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox52_CheckedChanged"/>&nbsp; &nbsp;Create
                                                              </td>
                                                            </tr>
                                                         </table>
                                                    </td>
                                                 </tr>
                                                </table>
                                         </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                           </tr>

                           <tr>
                              <td align="center" colspan="6">
                                   <asp:ImageButton ID="btnupdate" runat="server" ImageUrl="~/images/update.png" ValidationGroup="UserIdCreation1" OnClick="btnupdate_Click"  />&nbsp;&nbsp;&nbsp;

                                   <asp:ImageButton ID="Button1" runat="server" ImageUrl="~/images/cancel.png" OnClick="Button1_Click" />
                             </td>
                           </tr>
                        </table>
                    </asp:Panel>         
                  </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
