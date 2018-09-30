<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 29px;
        }
        .style3
        {
            width: 230px;
        }
        .style4
        {
            height: 29px;
            width: 230px;
        }
        .style5
        {
            font-size: xx-large;
        }
        .style6
        {
            width: 747px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:Panel ID="form" runat="server">
    <table class="style1">
        <tr>
            <td class="style5" colspan="2">
                <br />
                <strong>Enter Department Details :</strong></td>
        </tr>
        <tr>
            <td class="style3">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" Text="Department Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="*This Field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Select Location</td>
            <td class="style2">
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="loc_name" 
                    DataValueField="loc_id" 
                    EnableViewState="False">
                    <asp:ListItem Value=" ">    Select....</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT * FROM t_im_loc_mst WHERE (loc_valid = 1) AND (loc_isDeleted = 0)">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="DropDownList2" Display="Dynamic" 
                    ErrorMessage="*Select a Location" InitialValue="Select...."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Select Sub-Location</td>
            <td class="style2">
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSource1" DataTextField="sloc_name" 
                    DataValueField="sloc_id" EnableViewState="False">
                    <asp:ListItem Value=" ">   Select....</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT *  FROM [t_im_subloc_mst] WHERE ([sloc_locId] = @loc_id and sloc_valid=1 and sloc_isDeleted=0)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="loc_id" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="DropDownList3" Display="Dynamic" 
                    ErrorMessage="*Select a Sub-Location" InitialValue=" Select...."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Is Department Available</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label6" runat="server" Text="Personal No. of Owner"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="*This field is madatory"></asp:RequiredFieldValidator>
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
                &nbsp;<asp:Button ID="Button1" runat="server" Text= "Submit" 
                    onclick="Button1_Click" Height="25px" Width="60px" />
            </td>
            <td>&nbsp;
                <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Reset" 
                    onclick="Button2_Click" Height="25px" Width="60px" />
                </td>
        </tr>
        <tr>
            <td class="style3">
                <a href="CreateInventory.aspx">Back to Create Inventory</a></td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
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
<a href="Department.aspx">Create another Department </a>
</td>
</tr>
</table>
</asp:Panel>

</asp:Content>

