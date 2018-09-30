<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Payment_Details.aspx.cs" Inherits="Payment_Details" %>
<%@ MasterType VirtualPath="~/User.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 230px;
        }
        .style3
        {
            font-size: xx-large;
        }
        .style4
        {
            width: 230px;
            height: 29px;
        }
        .style5
        {
            height: 29px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <span class="style3">Enter the payment Details:</span><br />
   </br>

    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Payment Sequence No. :</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator4" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" 
                    ErrorMessage="* The Length should be of 10 characters" 
                    MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" 
                    ToolTip="* The Length should be of 10 characters" Type="Double">* The Length should be of 10 characters</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Type :</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem Value="RL">R / RL (Receipt Liability)</asp:ListItem>
                    <asp:ListItem Value="PL">P/PL (Payment Liability)</asp:ListItem>
                    <asp:ListItem> </asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Payer Name :</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="* This field is mandatory" 
                    SetFocusOnError="True" Display="Dynamic">* This field is mandatory</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Payee Name :</td>
            <td class="style5">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="* This field is mandatory" 
                    SetFocusOnError="True" Display="Dynamic">* This field is mandatory</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Signatory Name :</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Mode :</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="py_mode" 
                    DataValueField="py_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    SelectCommand="SELECT [py_mode], [py_id] FROM [t_im_paymentMode_mst]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Payment Due Date :</td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Payment Date :</td>
            <td>
                <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cheque/DD/Card No. :</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="TextBox9" Display="Dynamic" 
                    ErrorMessage="* The Length should be of 10 characters" 
                    MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" 
                    ToolTip="* The Length should be of 10 characters" Type="Double">* The Length should be of 10 characters</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Amount (in rupees) :</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Fine :</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Description :</td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Voucher No. :</td>
            <td>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator3" runat="server" 
                    ControlToValidate="TextBox13" Display="Dynamic" 
                    ErrorMessage="* The Length should be of 10 characters" 
                    MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" 
                    ToolTip="* The Length should be of 10 characters" Type="Double">* The Length should be of 10 characters</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox13" ErrorMessage="* This field is mandatory" 
                    SetFocusOnError="True" Display="Dynamic">* This field is mandatory</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Voucher Date :</td>
            <td>
                <asp:Calendar ID="Calendar3" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style2">
                SAP No. :</td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ControlToValidate="TextBox15" Display="Dynamic" 
                    ErrorMessage="* The Length should be of 10 characters" 
                    MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" 
                    ToolTip="* The Length should be of 10 characters" Type="Double">* The Length should be of 10 characters</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                SAP Date :</td>
            <td>
                <asp:Calendar ID="Calendar4" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Do you want the reciept to be printed ?</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="50px" >
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Do you want the reciept to be mailed ?</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Reset" runat="server" Text="Reset" CausesValidation="false" 
                    onclick="Reset_Click"/>
            </td>
            <td>
                <asp:Button ID="Submit" runat="server" Text="Submit" CausesValidation="true" 
                    onclick="Submit_Click1"/>
            </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;
                </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
    </table>
</asp:Content>

