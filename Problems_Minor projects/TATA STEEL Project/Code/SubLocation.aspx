<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SubLocation.aspx.cs" Inherits="SubLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 236px;
        }
        .style4
        {
            height: 29px;
        }
        .style5
        {
            height: 29px;
        }
        .style6
        {
            height: 29px;
            font-size: xx-large;
        }
        .style7
        {
            width: 740px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:Panel ID="form" runat="server">
    <table class="style1">
        <tr>
            <td class="style6" colspan="2">
                <strong>
                <br />
                Enter Sub-Location Details :</strong></td>
        </tr>
        <tr>
            <td class="style4">&nbsp;
                </td>
            <td class="style5">&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style4">
                Sub-Location Name:</td>
            <td class="style5">
                <asp:TextBox ID="TextBox2" runat="server" Width="201px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Select Location:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    CausesValidation="True" DataSourceID="SqlDataSource1" DataTextField="loc_name" 
                    DataValueField="loc_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT loc_id, loc_name, loc_valid, loc_compCode, loc_admin, loc_isDeleted FROM t_im_loc_mst WHERE (loc_valid = 1) AND (loc_isDeleted = 0)"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Is Sub-Location Available:</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style3">
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
            <td class="style3">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text= "Submit" onclick="Button1_Click" 
                    Height="25px" Width="60px" />
            </td>
            <td>
                <asp:Button ID="Button2"  runat="server" CausesValidation="False" Text="Reset" 
                    onclick="Button2_Click" Height="25px" Width="60px" />
            </td>
        </tr>
        <tr>
            <td class="style3"><a href="CreateInventory.aspx">Back to Create Inventory </a>
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
<td align="left" class="style7">
<a href="CreateInventory.aspx">Back to Create Inventory </a>
</td>
<td align="right">
<a href="SubLocation.aspx">Create another Sub-Location </a>
</td>
</tr>
</table>
</asp:Panel>

</asp:Content>


