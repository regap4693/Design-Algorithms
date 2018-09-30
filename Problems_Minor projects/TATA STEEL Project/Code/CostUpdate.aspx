<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CostUpdate.aspx.cs" Inherits="CostUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 267px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                Inventory :</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="inv_name" 
                    DataValueField="inv_uid" AppendDataBoundItems="True" AutoPostBack="True" 
                    EnableViewState="False">
                    <asp:ListItem Selected="True">     Select              </asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    SelectCommand="SELECT [inv_name], [inv_id], [inv_uid] FROM [t_im_inventory_mst] WHERE inv_valid='True' and inv_isDeleted='False'" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:InventoryConnectionString.ProviderName %>"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" 
                    ErrorMessage="*Select Inventory" InitialValue=" " ToolTip="*Select Inventory">*Select Inventory</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost type:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="cst_name" 
                    DataValueField="cst_id" EnableViewState="False">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    SelectCommand="SELECT [cst_id], [cst_name] FROM [t_im_costType_mst] WHERE cst_valid='True' and cst_isDeleted='False'">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DropDownList2" Display="Dynamic" 
                    ErrorMessage="*Select Cost Type"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Unit of Measurement-day/hour/km:</td>
            <td style="margin-left: 80px">
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>Day</asp:ListItem>
                    <asp:ListItem>Hour</asp:ListItem>
                    <asp:ListItem>Km</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DropDownList3" Display="Dynamic" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost in Rupees in per unit of measurement which is taxable:</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost in Rupees in per unit of measurement which is not taxable:</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="209px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost in Rupees in per unit of measurement:</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost in Rupees of refundable deposit:</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Width="208px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost in Rupees - Flat booking fee, if applicable:</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Width="208px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Rate of service tax, if applicable:</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" 
                    Width="208px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Rate of educational cess tax, if applicable:</td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" Width="207px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="TextBox8" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Rate of any other tax, if applicable:</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" Width="209px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="TextBox9" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Payment mode:</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource3" 
                    DataTextField="py_mode" DataValueField="py_id" SelectionMode="Multiple" 
                    AppendDataBoundItems="True">
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    SelectCommand="SELECT [py_mode], [py_id] FROM [t_im_paymentMode_mst] WHERE py_valid='True' and py_isDeleted='False'">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="ListBox1" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost name:</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost Type Description:</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server" Height="52px" Width="207px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="TextBox10" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                    onclick="Button2_Click" Text="Reset" />
            </td>
        </tr>
    </table>
</asp:Content>

