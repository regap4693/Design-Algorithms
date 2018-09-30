<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Location.aspx.cs" Inherits="Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 21px;
        }
        .style3
        {
        }
        .style4
        {
            height: 21px;
            width: 236px;
        }
        .style5
        {
            font-size: xx-large;
        }
        .style6
        {
            width: 763px;
        }
        .style7
        {
            width: 236px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:Panel ID="form" runat="server">
    <table class="style1">
        <tr>
            <td class="style5" colspan="2">
                <br />
                <strong>Enter Location Details :</strong></td>
        </tr>
        <tr>
            <td class="style7">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style7">
                Location Name:</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="201px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" 
                    ErrorMessage="*This feild is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Is Location available :</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Company Code:</td>
            <td class="style2">
                <asp:TextBox ID="TextBox4" runat="server" Width="202px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Personal Number of Owner:</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Width="202px"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="TextBox5" Display="Dynamic" 
                    ErrorMessage="*the field should be of 10 characters" MaximumValue="9999999999" 
                    MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Button ID="Button1" runat="server" Text= "Submit" onclick="Button1_Click" 
                    Height="25px" Width="60px" />
            </td>
            <td>
                <asp:Button ID="Button2"  runat="server" CausesValidation="False" Text="Reset" 
                    onclick="Button2_Click" Height="25px" Width="60px" />
            </td>
        </tr>
        <tr>
            <td class="style7"><a href="CreateInventory.aspx">Back to Create Inventory </a>
                </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    style="margin-bottom: 19px" />
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="success" runat="server">
<center> <h3>Submission was successful!</h3> </center> <br />
<table>
<tr>
<td align="left" class="style6">
<a href="CreateInventory.aspx">Back to Create Inventory </a>
</td>
<td align="right">
<a href="Location.aspx">Create another Location </a>
</td>
</tr>
</table>
</asp:Panel>

</asp:Content>


