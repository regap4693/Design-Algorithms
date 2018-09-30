<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CreateInventory.aspx.cs" Inherits="CreateInventory" %>
<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 220px;
        }
        .style3
        {
            width: 220px;
            height: 29px;
        }
        .style4
        {
            height: 29px;
        }
     .style5
     {
         font-size: xx-large;
     }
        .style6
        {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <strong>
    <span class="style6">
    Welcome&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;</span><span class="style5"><br />
    <br />
    Enter Inventory Details:</span></strong><br/>

<table class="style1">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Name</td>
            <td>
                <asp:TextBox ID="InameTextBox" runat="server" Width="169px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="InameRequiredFieldValidator" runat="server" 
                    ControlToValidate="InameTextBox" 
                    ErrorMessage="*This Field is mandatory" 
                    ToolTip="*Please Enter the Name of Inventory"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="InameTextBox" Display="Dynamic" 
                    ErrorMessage="*Please Enter Only Characters" Operator="NotEqual" 
                    ToolTip="*Please Enter Only Characters"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Select Location :</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSource2" DataTextField="loc_name" 
                    DataValueField="loc_id" 
                    EnableViewState="False" AutoPostBack="True">
                    <asp:ListItem Value=" "> Select...</asp:ListItem>
                </asp:DropDownList>
                <a href="Location.aspx" > Create Location </a>              
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    SelectCommand="SELECT * FROM [t_im_loc_mst] WHERE (loc_valid = 1) AND (loc_isDeleted = 0)">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" 
                    ErrorMessage="*Select a Location" InitialValue="Select...."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Select Sub-Location :</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSource1" DataTextField="sloc_name" 
                    DataValueField="sloc_id" EnableViewState="False" AutoPostBack="True">
                    <asp:ListItem Value=" "> Select....</asp:ListItem>
                </asp:DropDownList>
                <a href="SubLocation.aspx">Create Sub-Location</a>  
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT * FROM [t_im_subloc_mst] WHERE ([sloc_locId] = @loc_id) and (sloc_valid = 1) AND (sloc_isDeleted = 0)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="loc_id" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" 
                    ErrorMessage="*Select a Sub-Location" InitialValue=" Select...."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Select Department :</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSource3" DataTextField="dept_name" 
                    DataValueField="dept_uid" EnableViewState="False">
                    <asp:ListItem Selected="True" Value=" "> Select....</asp:ListItem>
                </asp:DropDownList>
                <a href="Department.aspx" >Create Department </a>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    SelectCommand="SELECT * FROM [t_im_dept_mst] WHERE ([dept_slocId] = @dept_slocId) and (dept_valid = 1) AND (dept_isDeleted = 0)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" 
                            DefaultValue="Select Department...." Name="dept_slocId" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" 
                    ErrorMessage="*Select a Department" InitialValue=" Select...."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Description</td>
            <td>
                <asp:TextBox ID="IdescTextBox" runat="server" Height="63px" Width="170px" 
                    MaxLength="200" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="IdescRequiredFieldValidator" runat="server" 
                    ControlToValidate="IdescTextBox" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>

        
            <td class="style2">
                Capacity</td>
            <td>
                <asp:TextBox ID="IcapacityTextBox" runat="server" Width="170px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="IcapactyRequiredFieldValidator" runat="server" 
                    ControlToValidate="IcapacityTextBox" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Quantity Available</td>
            <td>
                <asp:TextBox ID="QtyAvailTextBox" runat="server" Width="170px" Height="22px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="QtyAvailRequiredFieldValidator" runat="server" 
                    ControlToValidate="QtyAvailTextBox" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Quantity Consumed</td>
            <td>
                <asp:TextBox ID="QtyConsumedTextBox" runat="server" Width="170px" Height="22px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="QtyConsumedRequiredFieldValidator" 
                    runat="server" ControlToValidate="QtyConsumedTextBox" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Quantity Reserved</td>
            <td>
                <asp:TextBox ID="QtyReservedTextBox" runat="server" Width="170px" Height="22px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="QtyReserveRequiredFieldValidator" 
                    runat="server" ControlToValidate="QtyReservedTextBox" 
                    ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Cost Associated</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Approver ID</td>
            <td>
                <asp:TextBox ID="AppIDTextBox" runat="server" Width="175px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="AppIDTextBox" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Available Days</td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="241px" >
                    <asp:ListItem Value="0" Text="Mon"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Tue"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Wed"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Thurs"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Fri"></asp:ListItem>
                    <asp:ListItem Value="5" Text="Sat"></asp:ListItem>
                    <asp:ListItem Value="6" Text="Sun"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Availability</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Restriction</td>
            <td>
                <asp:TextBox ID="BRestrictionTextBox" runat="server" Width="175px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;

<script type="text/javascript" language="javascript">
    function decrement(val) {
        if (document.getElementById("t1").value != 1) {
            document.getElementById("t1").value = parseInt(document.getElementById("t1").value) + val;
        }
    }
    function increment(val) {
        //alert(Date);
        document.getElementById("t1").value = parseInt(document.getElementById("t1").value) + val;
    }
</script>
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Height="26px" onclick="Button2_Click" 
                    Text="Reset" CausesValidation="False" UseSubmitBehavior="False" />
            </td>
        </tr>

    </table>
    
</asp:Content>

  

