<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad.aspx.cs" Inherits="_3Tier.Admin.ad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/Admin/TopUser.ascx" TagPrefix="uc1" TagName="TopUser" %>
<%@ Register Src="~/Admin/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
                   <td align="center" Width="80%" id="addata" runat="server">
                      <table align="center" Width="90%">

                           <tr><td><br /></td></tr>
                           <tr>
                              <td align="center" id="View" runat="server"  Width="100%" >
                               <font size="5" color="#00277a"><strong>Posted Ads  </strong></font>
                              </td>
                             
                              <td align="right"> 
                                  <asp:ImageButton ID="btn1" runat="server" ImageUrl="~/images/ca.png" Font-Size="18px" OnClick="btn1_Click" /></td>
                          </tr>

                          <tr><td></td></tr>

                         <tr>
                             <td height="100px" style="padding-left:0px; padding-right:0px" colspan="2" Width="90%"  >            
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
                                      <ItemTemplate><asp:Label ID="lblpno3" runat="server" Text='<%# Eval("seller") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Catagory</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate>
                                      <asp:Label ID="linkname" runat="server" CssClass="simple1"  
                                         Text='<%# Eval("item_cat") %>'   Font-Underline="false"></asp:Label>
                                      </ItemTemplate>                     
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Sub Catagory</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblemail" runat="server" Text='<%# Eval("item_subacat") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                        <asp:TemplateField>
                                      <HeaderTemplate>Title</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate>
                                          <asp:LinkButton ID="lblpno2" runat="server" Text='<%# Eval("item_title") %>'  Font-Underline="false"
                                              CommandArgument='<%#Eval("sid") %>' OnCommand="ListName" /></ItemTemplate>

                                      </asp:TemplateField>
                                         <asp:TemplateField>
                                      <HeaderTemplate>Email</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblo2" runat="server" Text='<%# Eval("email") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                       

                                      <asp:TemplateField>
                                      <HeaderTemplate>Mobile</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpno4" runat="server" Text='<%# Eval("mobile") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                         <asp:TemplateField>
                                      <HeaderTemplate>Cost</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpno5" runat="server" Text='<%# Eval("item_cost") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                      <HeaderTemplate>Posted Date</HeaderTemplate>
                                      <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                      <ItemTemplate><asp:Label ID="lblpdate" runat="server" Text='<%# Eval("posted_date") %>' /></ItemTemplate>
                                      </asp:TemplateField>

                                     <asp:TemplateField>
                                      <HeaderTemplate>Status</HeaderTemplate>

                                     <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="linkactive" runat="server" CssClass="simple1"  Text='<%# Eval("txtstatus") %>' 
                                              CommandArgument='<%#Eval("sid") %>' OnCommand="ListName1" Font-Underline="false"></asp:LinkButton></ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField>
                                     <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lnkdelete" runat="server"  CssClass="simple1" 
                                              CommandArgument='<%#Eval("sid") %>' OnCommand="ListName2"  Font-Underline="false"
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

        

                      <div id="updateclient" runat="server" align="center" visible="false">    
                        <table width="70%" align="center"> 
                            <tr>
                                  <td width="100%" colspan="3">
                                    <table  align="center"  width="100%">
                                      <tr>
                                          <td align="center" >
                                             <asp:Label ID="Label1" runat="server" Text="Post Free ad"  ForeColor="#00277a" Font-Size="22px" Font-Bold="true">
                                             </asp:Label>
                                         </td>
                                          <td></td>
                                        <td  align="right"  >
                                        </td>
                                     </tr>
                                    </table>
                                </td>
                            </tr>
                     
                            <tr>
                              <td><br /></td>
                            </tr>
     
                            <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblcat" Text="Category *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:DropDownList ID="ddcat" runat="server" Width="252px" Font-Size="12pt"  AutoPostBack="true"
                                            OnSelectedIndexChanged="ddcat_SelectedIndexChanged" >
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="ddcat" 
                                            ErrorMessage="Select Category" ValidationGroup="submit" InitialValue="Select" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                            <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblsub" Text="Sub Category *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:DropDownList ID="ddsub" runat="server" Width="252px" Font-Size="12pt" >
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator14" runat="server" ControlToValidate="ddsub"
                                             ErrorMessage="Select Sub category" ValidationGroup="submit" InitialValue="Select" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                                    <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lbltitle" Text="Title  *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:TextBox ID="txttitle" runat="server" Width="250px" Font-Size="12pt" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txttitle"
                                             ErrorMessage="Enter Title" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                    <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lbldis" Text="Discription *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:TextBox ID="txtdis" runat="server" Width="248px" Font-Size="12pt" TextMode="MultiLine" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="txtdis"
                                             ErrorMessage="Enter Discription" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                    <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblname" Text="Name *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:TextBox ID="txtname" runat="server" Width="250px" Font-Size="12pt" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="txtname" 
                                            ErrorMessage="Enter Name" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                          <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblcost" Text="Cost *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:TextBox ID="txtcost" runat="server" Width="250px" Font-Size="12pt" MaxLength="9" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="txtcost" 
                                            ErrorMessage="Enter Cost" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblemail" Text="Email Id *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:TextBox ID="txtemail" runat="server" Width="250px" Font-Size="12pt" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="txtemail" 
                                            ErrorMessage="Enter Email" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>  
                              <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail" ForeColor="Red"
                    ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="submit">*</asp:RegularExpressionValidator>  
                                      </td>            
                                  </tr>
                                  <tr>
                                       <td>
                                       <asp:Label ID="lblmobile" runat="server" Text="Mobile Number *" Font-Bold="True" 
                                               Font-Names="Arial" Font-Size="12pt" ForeColor="#006699"></asp:Label>
  
                                       </td>
                                       <td style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                       <td>
                                              <asp:TextBox ID="txtmobile" runat="server"  Width="250px" Font-Size="12pt" MaxLength="10" onkeypress="return onlyNos(event,this);" />  
                                               <asp:RequiredFieldValidator ID="Requiredfieldvalidator13" runat="server" ControlToValidate="txtmobile"
                                                    ErrorMessage="Enter Mobile Number" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>  
                                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmobile"  ForeColor="Red" 
                    ErrorMessage="Enter Max 10 digits number" Display="dynamic" ValidationExpression="^[0-9]{10}$" ValidationGroup="submit">*</asp:RegularExpressionValidator>    
                                       </td>
                                  </tr>

                                      <tr>
                                       <td>
                                       <asp:Label ID="lblloc" runat="server" Text="Location *" Font-Bold="True" 
                                               Font-Names="Arial" Font-Size="12pt" ForeColor="#006699"></asp:Label>
  
                                       </td>
                                       <td style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                       <td>
                                              <asp:TextBox ID="txtloc" runat="server"  Width="250px" Font-Size="12pt" />  
                                               <asp:RequiredFieldValidator ID="Requiredfieldvalidator15" runat="server" ForeColor="Red"
                                                   ControlToValidate="txtloc" ErrorMessage="Enter Location" ValidationGroup="submit">*</asp:RequiredFieldValidator>      
                                       </td>
                                  </tr>
                       
                            

                                                   <tr>
                                        <td class="style1">
                                              <asp:Label ID ="Label10" Text="Country *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:DropDownList ID="ddc" runat="server" Width="252px" Font-Size="12pt"  AutoPostBack="true" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                            
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator16" runat="server" ControlToValidate="ddc" 
                                            ErrorMessage="Select Country" ValidationGroup="submit" InitialValue="Select Country" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                                           <tr>
                                        <td class="style1">
                                              <asp:Label ID ="Label11" Text="State *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:DropDownList ID="dds" runat="server" Width="252px" Font-Size="12pt"  AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator17" runat="server" ControlToValidate="dds" 
                                            ErrorMessage="Select State" ValidationGroup="submit" InitialValue="Select State" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                                            <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblcity" Text="City*" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                       <asp:DropDownList ID="ddlcity" runat="server" Width="252px" Font-Size="12pt">

                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator18" runat="server" ControlToValidate="ddlcity" InitialValue="Select City"
                                             ErrorMessage="Select City" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                                          <tr>
                                       <td>
                                       <asp:Label ID="Label12" runat="server" Text="Zip Code *" Font-Bold="True" 
                                               Font-Names="Arial" Font-Size="12pt" ForeColor="#006699"></asp:Label>
  
                                       </td>
                                       <td style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                       <td>
                                              <asp:TextBox ID="txtzip" runat="server"  Width="250px" Font-Size="12pt" MaxLength="6" onkeypress="return onlyNos(event,this);" />  
                                               <asp:RequiredFieldValidator ID="Requiredfieldvalidator19" runat="server" ControlToValidate="txtzip"
                                                    ErrorMessage="Enter Zip code" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>  
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtzip"  ForeColor="Red" 
                    ErrorMessage="Enter Max 6 digits number" Display="dynamic" ValidationExpression="^[0-9]{6}$" ValidationGroup="submit">*</asp:RegularExpressionValidator>    
                                       </td>
                                  </tr>

                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblfile1" Text="Upload Image 1*" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:FileUpload ID="upload1" runat="server" Width="250px" Font-Size="12pt" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator20" runat="server" ControlToValidate="upload1" 
                                            ErrorMessage="Upload First Image" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblfile2" Text="Upload Image 2*" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:FileUpload ID="upload2" runat="server" Width="250px" Font-Size="12pt" />  
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator21" runat="server" ControlToValidate="upload2"
                                             ErrorMessage="Upload Second Image" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblfile3" Text="Upload Image 3" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:FileUpload ID="upload3" runat="server" Width="250px" Font-Size="12pt" />  
                                     <%--   <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="upload3" 
                                            ErrorMessage="Upload third Image Username" ValidationGroup="submit">*</asp:RequiredFieldValidator>  --%>  
                                      </td>            
                                  </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblfile4" Text="Upload Image 4" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:FileUpload ID="upload4" runat="server" Width="250px" Font-Size="12pt" />  
                                      <%--  <asp:RequiredFieldValidator ID="Requiredfieldvalidator11" runat="server" 
                                            ControlToValidate="UserID" ErrorMessage="Enter Username" ValidationGroup="login">*</asp:RequiredFieldValidator> --%>   
                                      </td>            
                                  </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblfile5" Text="Upload Image 5" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:FileUpload ID="upload5" runat="server" Width="250px" Font-Size="12pt" />  
                                  <%--      <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server"
                                             ControlToValidate="UserID" ErrorMessage="Enter Username" ValidationGroup="login">*</asp:RequiredFieldValidator>  --%>  
                                      </td>            
                                  </tr>
                                     <tr>
                                        <td class="style1">
                                              <asp:Label ID ="lblfile6" Text="Upload Image 6" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:FileUpload ID="upload6" runat="server" Width="250px" Font-Size="12pt" />  
                                        <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator13" runat="server" ControlToValidate="UserID"
                                             ErrorMessage="Enter Username" ValidationGroup="login">*</asp:RequiredFieldValidator>   --%> 
                                      </td>            
                                  </tr>

                                     <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                     <tr>
                                        <td class="style1"  colspan="3" align="center">
                                              <asp:ImageButton ID ="imgsubmit"  runat="server" ImageUrl="~/Images/create.png" ValidationGroup="submit" OnClick="imgsubmit_Click" ></asp:ImageButton>
                                              <asp:ImageButton ID ="imgcancel"  runat="server" ImageUrl="~/Images/cancel.png" OnClick="imgcancel_Click" ></asp:ImageButton>

                                       </td>
                                                
                                  </tr>
                             
                               <tr>
                                   <td colspan="3">
                                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="submit" ShowMessageBox="true" ShowSummary="false" />
                                   </td>
                               </tr>
                        </table>
    </div>

         <input type="button"  style="display: none;" id="btndummy" runat="server" />
                      <ajx:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" PopupControlID="pnledit" DropShadow="false" 
                          BackgroundCssClass="Modalpopup" CancelControlID="btnclose">      </ajx:ModalPopupExtender>
                      <div>    
                        <asp:Panel runat="server" ID="pnledit" Width="1000px" Height="600px" BorderColor="Black"  HorizontalAlign="Center" BackColor="#E6E6E6" >
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
                                <tr>
                                    <td align="center" width="80%">
                                         <asp:DataList ID="ddtop" runat="server" width="100%"  RepeatColumns="1"   BorderWidth="1"
                                                  CellPadding="1" CellSpacing="0" >
                                             <ItemTemplate>
                                               <table width="100%"  align="center"   >
                                                        <tr>
                                                             <td  align="center"   >  
                                                                <span style="font:bold 15px arial">     Seller Name :   </span>  
                                                                  <asp:Label ID="Label13" runat="server" Text='<%# Eval("seller") %>' 
                                                                Font-Names="arial" Font-Size="16px" Height="25px" Font-Bold="true"></asp:Label>
                                                            </td>
                                                            <td  align="center"   >  
                                                              <span style="font:bold 15px arial">     Cost : Rs  : </span>  
                                                                 <asp:Label ID="lnk" runat="server" Text='<%# Eval("Item_cost") %>' 
                                                             Font-Names="arial" Font-Size="16px" Height="25px" Font-Bold="true"></asp:Label>
                                                          </td>
                                                        </tr>

                                                   <tr>
                                                      <td align="center"   >
                                                            <span style="font:bold 15px arial">  Category : </span> <asp:Label runat="server" 
                                                                ID="lnkcat" Text='<%# Eval("Item_Cat") %>' 
                                                             Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"/>
                                                      </td>
                                                       <td align="center" >
                                                           <span style="font:bold 15px arial">   Sub Category :  </span>  
                                                              <asp:Label runat="server" ID="lnksubcat" Text='<%# Eval("Item_Subacat") %>'
                                                            Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"/>
                                                      </td>
                                                  </tr>
                                                  
                                                   <tr><td>&nbsp;</td></tr>

                                                   <tr>
                                                      <td align="left" >
                                                          <asp:Label runat="server" ID="lnktitle" Text='<%# Eval("Item_Title") %>' Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="18px" Height="28px"/>
                                                      </td>
                                                       <td align="center"   >
                                                          <asp:Label runat="server" ID="Label9" Text='<%# Eval("address") %>' Font-Underline="false" 
                                                              Font-Names="arial" Font-Size="18px" Height="28px"/>
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>

                                                    <tr>
                                                      <td align="left"   >
                                                         <asp:Label runat="server" ID="lnkdis" Text='<%# Eval("Item_Dis") %>'
                                                              Font-Names="arial" Font-Size="16px"/>
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>

                                                   <tr>
                                                      <td align="left" style="background-image:url(../images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:Image runat="server"  ID="Label1"  ImageUrl='<%#"../ImageHandler.ashx?imgID="+ Eval("sid") %>'  
                                                             Height="70px" Width="80px" CommandArgument='<%# Eval("sid") %>' CommandName="aa" />
                                                      </td>
                                                       <td align="left" style="background-image:url(../images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:Image runat="server" ID="Label2" ImageUrl='<%#"../ImageHandler1.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa1" Height="70px" Width="80px"  />
                                                      </td>
                                                       </tr>
                                                   <tr>
                                                       <td align="left"style="background-image:url(../images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:Image runat="server" ID="Label3" ImageUrl='<%#"../ImageHandler2.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa2" Height="70px" Width="80px" />
                                                      </td>
                                                       <td align="left" style="background-image:url(../images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:Image runat="server" ID="Label4" ImageUrl='<%#"../ImageHandler3.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa3" Height="70px" Width="80px" />
                                                      </td>
                                                        </tr>
                                                   <tr>
                                                       <td align="left" style="background-image:url(../images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:Image runat="server" ID="Label5" ImageUrl='<%#"../ImageHandler4.ashx?imgID="+ Eval("sid") %>' 
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa4" Height="70px" Width="80px"/>
                                                      </td>
                                                       <td align="left" style="background-image:url(../images/noimage.png);background-repeat:no-repeat;" >
                                                         <asp:Image runat="server" ID="Label6" ImageUrl='<%#"../ImageHandler5.ashx?imgID="+ Eval("sid") %>'
                                                              CommandArgument='<%# Eval("sid") %>' CommandName="aa5" Height="70px" Width="80px" />
                                                      </td>
                                                  </tr>

                                                   <tr><td>&nbsp;</td></tr>

                                                   <tr >
                                                       <td  align="left"  >  
                                                   <span style="font:bold 15px arial">    City  : </span>   <asp:Label ID="Label8" runat="server" Text='<%# Eval("city") %>' 
                                                            Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"></asp:Label>
                                                     </td>

                                                       <td  align="center"  >  
                                                 <span style="font:bold 15px arial">      Posted Date :  </span>  <asp:Label ID="Label7" runat="server" Text='<%# Eval("posted_date") %>' 
                                                            Font-Names="arial" Font-Size="15px" Height="25px" Font-Italic="true"></asp:Label>
                                                     </td>
                                                   </tr>
                                              </table>
                                                 <br />
                                             </ItemTemplate>
                                          </asp:DataList>
                                    </td>
                                </tr>
                          </table>
                    </asp:Panel>         
                  </div>
    </div>
    </form>
</body>
</html>
