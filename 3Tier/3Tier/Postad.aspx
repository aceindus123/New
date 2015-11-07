<%@ Page Title="" Language="C#" MasterPageFile="Default.Master" AutoEventWireup="true" CodeBehind="Postad.aspx.cs" Inherits="_3Tier.Postad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajx:ToolkitScriptManager ID="as" runat="server"></ajx:ToolkitScriptManager>

    <table class="body">
         <tr>
                <td width="100%" align="center">
                    <table align="center" style="background-color:#730528; width:100%; height:32px;" >
                        <tr >
                            <td align="center"  width="30%">
                                <asp:TextBox ID="TextBox1" runat="server" Width="60%" Height="32px" CssClass="border" Font-Size="17px" AutoPostBack="true"
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
                            <asp:Label ID="Label4" runat="server" Text="Popular Cities" ForeColor="Orange" Font-Bold="true" Font-Size="14px"
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
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <table border="0" >
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                      <tr>
                                          <td colspan="3" align="center">
                                              <asp:Label ID="lblhead" runat ="server" Text="Post Free Ad" Font-Bold="True" Font-Names="Arial" Font-Size="14pt" ForeColor="#666666"></asp:Label>
                                          </td>
                                       
                                     </tr>
                                     <tr>
                                        <td>&nbsp;</td>
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

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="ddcat" 
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txttitle"
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtdis"
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtname" 
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtemail" 
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
                                               <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtmobile"
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
                                              <asp:Label ID ="Label2" Text="Country *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:DropDownList ID="ddc" runat="server" Width="252px" Font-Size="12pt"  AutoPostBack="true" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                            
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="ddc" 
                                            ErrorMessage="Select Country" ValidationGroup="submit" InitialValue="Select Country" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                                           <tr>
                                        <td class="style1">
                                              <asp:Label ID ="Label1" Text="State *" runat ="server" Font-Bold="True" 
                                                         Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                                       </td>
                                      <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                      <td class="style1">  
                                        <asp:DropDownList ID="dds" runat="server" Width="252px" Font-Size="12pt"  AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator11" runat="server" ControlToValidate="dds" 
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="ddlcity" InitialValue="Select City"
                                             ErrorMessage="Select City" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>    
                                      </td>            
                                  </tr>

                                          <tr>
                                       <td>
                                       <asp:Label ID="Label3" runat="server" Text="Zip Code *" Font-Bold="True" 
                                               Font-Names="Arial" Font-Size="12pt" ForeColor="#006699"></asp:Label>
  
                                       </td>
                                       <td style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
                                       <td>
                                              <asp:TextBox ID="txtzip" runat="server"  Width="250px" Font-Size="12pt" MaxLength="6" onkeypress="return onlyNos(event,this);" />  
                                               <asp:RequiredFieldValidator ID="Requiredfieldvalidator13" runat="server" ControlToValidate="txtzip"
                                                    ErrorMessage="Enter Zip code" ValidationGroup="submit" ForeColor="Red">*</asp:RequiredFieldValidator>  
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtzip"  ForeColor="Red" 
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="upload1" 
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
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" ControlToValidate="upload2"
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
                                              <asp:ImageButton ID ="imgsubmit"  runat="server" ImageUrl="Images/submit.png" ValidationGroup="submit" OnClick="imgsubmit_Click" ></asp:ImageButton>
                                              <asp:ImageButton ID ="imgcancel"  runat="server" ImageUrl="Images/cancel.png" OnClick="imgcancel_Click" ></asp:ImageButton>

                                       </td>
                                                
                                  </tr>
                             
                               <tr>
                                   <td colspan="3">
                                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="submit" ShowMessageBox="true" ShowSummary="false" />
                                   </td>
                               </tr>
                               </table>
                            </td>
                        </tr>
                     </table>
                 </td>
             </tr>

        <tr class="body2">
                  <td width="98%"  align="left"  colspan="3">
                      <table width="100%" >
                          <tr>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="Images/indusnexus.png" OnClick="ImageButton11_Click" />

                              </td>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton26" runat="server" ImageUrl="Images/industimes.png" OnClick="ImageButton26_Click" />

                              </td>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton18" runat="server" ImageUrl="Images/justcalluz.png" OnClick="ImageButton18_Click" />

                              </td>
                              <td align="center">
                                  <asp:ImageButton ID="ImageButton19" runat="server" ImageUrl="Images/indusemail.png" OnClick="ImageButton19_Click" />

                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>
    </table>
</asp:Content>
