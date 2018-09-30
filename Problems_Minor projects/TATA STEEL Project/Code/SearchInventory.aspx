<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="SearchInventory.aspx.cs" Inherits="SearchInventory" %>
<%@ MasterType VirtualPath="~/User.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            font-size: xx-large;
        }
        .style4
        {
            width: 328px;
        }
        .style5
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                Welcome
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                !<br />
                <br />
                <span class="style3"><strong>Search Inventory :</strong></span></td>
        </tr>
        <tr>
            <td class="style4">
                Select Inventory:
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="inv_name" 
                    DataValueField="inv_name" 
                     AppendDataBoundItems="True" AutoPostBack="True" EnableViewState="False">
                    <asp:ListItem Value="0">Select....</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT DISTINCT inv_name FROM t_im_inventory_mst WHERE (inv_valid = 1) AND (inv_isDeleted = 0)">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" 
                    ErrorMessage="* Select a Value" InitialValue="Select...." 
                    ToolTip="Select a Value"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Select Location :</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="loc_name" 
                    DataValueField="loc_id" EnableViewState="False">
                    <asp:ListItem Value="0">Select....</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT Distinct t_im_loc_mst.loc_name, t_im_loc_mst.loc_id FROM t_im_loc_mst INNER JOIN t_im_subloc_mst ON t_im_loc_mst.loc_id = t_im_subloc_mst.sloc_locId WHERE (t_im_subloc_mst.sloc_id IN (SELECT DISTINCT t_im_dept_mst.dept_slocId FROM t_im_dept_mst INNER JOIN t_im_inventory_mst ON t_im_dept_mst.dept_uid = t_im_inventory_mst.inv_deptId WHERE (t_im_inventory_mst.inv_name = @name)))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="name" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DropDownList2" Display="Dynamic" 
                    ErrorMessage="* Select a Value" InitialValue="Select...." 
                    ToolTip="Select a Value"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Select Sub-Location :</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="sloc_name" 
                    DataValueField="sloc_id" EnableViewState="False">
                    <asp:ListItem Value="0">Select....</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" SelectCommand="select sloc_name,sloc_id from dbo.t_im_subloc_mst where sloc_id in
(select distinct dept_slocId from dbo.t_im_dept_mst inner join dbo.t_im_inventory_mst on dept_uid=inv_deptId where inv_name=@name and sloc_locId=@locId)
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="name" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="locId" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DropDownList3" Display="Dynamic" 
                    ErrorMessage="* Select a Value" InitialValue="Select...." 
                    ToolTip="Select a Value"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Select Department :</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSource4" DataTextField="dept_name" 
                    DataValueField="dept_uid" EnableViewState="False" 
                    AutoPostBack="True" 
                    >
                    <asp:ListItem Value="0">Select....</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" SelectCommand="select distinct dept_name,dept_uid from dbo.t_im_dept_mst inner join dbo.t_im_inventory_mst on dept_uid=inv_deptId where inv_name=@name and dept_slocid=@sloc_id
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="name" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="sloc_id" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="DropDownList4" Display="Dynamic" 
                    ErrorMessage="* Select a Value" InitialValue="Select...." 
                    ToolTip="Select a Value"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style4">
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
            
            
            
            
                    
                    SelectCommand="SELECT [inv_name] , [inv_desc] , [inv_capacity] , [inv_qtyAvailable] , [inv_approverId1], [inv_availability] FROM [t_im_inventory_mst] WHERE (([inv_name] = @inv_name) AND ([inv_deptId] = @inv_deptId))" >
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="inv_name" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList4" Name="inv_deptId" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            </td>
            <td>
                <asp:FormView ID="FormView2" runat="server" 
                    DataSourceID="SqlDataSource5">
                    <EditItemTemplate>
                        inv_name:
                        <asp:TextBox ID="inv_nameTextBox" runat="server" 
                            Text='<%# Bind("inv_name") %>' />
                        <br />
                        inv_desc:
                        <asp:TextBox ID="inv_descTextBox" runat="server" 
                            Text='<%# Bind("inv_desc") %>' />
                        <br />
                        inv_capacity:
                        <asp:TextBox ID="inv_capacityTextBox" runat="server" 
                            Text='<%# Bind("inv_capacity") %>' />
                        <br />
                        inv_qtyAvailable:
                        <asp:TextBox ID="inv_qtyAvailableTextBox" runat="server" 
                            Text='<%# Bind("inv_qtyAvailable") %>' />
                        <br />
                        inv_approverId1:
                        <asp:TextBox ID="inv_approverId1TextBox" runat="server" 
                            Text='<%# Bind("inv_approverId1") %>' />
                        <br />
                        inv_availability:
                        <asp:TextBox ID="inv_availabilityTextBox" runat="server" 
                            Text='<%# Bind("inv_availability") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <span class="style5">Inventory Details :<br /> </span>
                    </HeaderTemplate>
                    <InsertItemTemplate>
                        inv_name:
                        <asp:TextBox ID="inv_nameTextBox" runat="server" 
                            Text='<%# Bind("inv_name") %>' />
                        <br />
                        inv_desc:
                        <asp:TextBox ID="inv_descTextBox" runat="server" 
                            Text='<%# Bind("inv_desc") %>' />
                        <br />
                        inv_capacity:
                        <asp:TextBox ID="inv_capacityTextBox" runat="server" 
                            Text='<%# Bind("inv_capacity") %>' />
                        <br />
                        inv_qtyAvailable:
                        <asp:TextBox ID="inv_qtyAvailableTextBox" runat="server" 
                            Text='<%# Bind("inv_qtyAvailable") %>' />
                        <br />
                        inv_approverId1:
                        <asp:TextBox ID="inv_approverId1TextBox" runat="server" 
                            Text='<%# Bind("inv_approverId1") %>' />
                        <br />
                        inv_availability:
                        <asp:TextBox ID="inv_availabilityTextBox" runat="server" 
                            Text='<%# Bind("inv_availability") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Inventory name:
                        <asp:Label ID="inv_nameLabel" runat="server" Text='<%# Bind("inv_name") %>' />
                        <br />
                        Inventory description:
                        <asp:Label ID="inv_descLabel" runat="server" Text='<%# Bind("inv_desc") %>' />
                        <br />
                        Inventory capacity:
                        <asp:Label ID="inv_capacityLabel" runat="server" 
                            Text='<%# Bind("inv_capacity") %>' />
                        <br />
                        <br />
                        Inventory qtyAvailable:
                        <asp:Label ID="inv_qtyAvailableLabel" runat="server" 
                            Text='<%# Bind("inv_qtyAvailable") %>' />
                        <br />
                        Inventory approverId1:
                        <asp:Label ID="inv_approverId1Label" runat="server" 
                            Text='<%# Bind("inv_approverId1") %>' />
                        <br />
                        Inventory<br /> availability:
                        <asp:Label ID="inv_availabilityLabel" runat="server" 
                            Text='<%# Bind("inv_availability") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td class="style4">&nbsp;
                </td>
            <td>&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style4">&nbsp;
                </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Proceed to Booking" 
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table> 
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <br />

</asp:Content>

