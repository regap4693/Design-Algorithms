<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Inventory_update.aspx.cs" Inherits="Inventory_update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style3
        {
        }
        .style4
        {
            height: 21px;
            width: 236px;
        }
        .style2
        {
            height: 21px;
        }
        .style5
        {
            width: 236px;
            height: 29px;
        }
        .style6
        {
            height: 21px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#3366CC" 
        Height="0.24in" 
        style="margin-top: 0px; font-size: xx-large; font-weight: 700;" Text="        INVENTORY DETAILS" 
        Width="5.52in"></asp:Label>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <div style="overflow:scroll;">
   
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:GridView ID="GridView1"  runat="server" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        AutoGenerateEditButton="True" onrowediting="GridView1_RowEditing" 
        onrowupdating="GridView1_RowUpdating" ForeColor="#333333" AllowPaging="True" 
            CellPadding="4" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowupdated="GridView1_RowUpdated" 
                        style="text-align: center; margin-left: 0px" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
                &nbsp;<table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
   
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
   </div>

           <p>
   
    <br />
    <br />
    <br />
    
        </p>
    
    <asp:Panel ID="Panel1" runat="server" Visible="False" 
            BorderColor="#D26900" BorderWidth="2px">
            <div style="overflow:scroll;">
   
                <table class="style1">
                    <tr>
                        <td class="style5">
                            Enter your P.No.</td>
                        <td class="style4">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="3">
                            CHANGE REQUIRED FIELDS</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Name</td>
                        <td class="style2">
                            <asp:TextBox ID="InameTextBox" runat="server" Width="169px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="InameTextBox" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Description</td>
                        <td>
                            <asp:TextBox ID="IdescTextBox" runat="server" Height="57px" 
                                ontextchanged="IdescTextBox_TextChanged" Width="172px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="IdescTextBox" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Capacity</td>
                        <td>
                            <asp:TextBox ID="IcapacityTextBox" runat="server" Width="170px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="IcapacityTextBox" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Quantity Available</td>
                        <td>
                            <asp:TextBox ID="QtyAvailTextBox" runat="server" 
                                ontextchanged="QtyAvailTextBox_TextChanged" Width="172px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="QtyAvailTextBox" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Quantity Consumed</td>
                        <td class="style2">
                            <asp:TextBox ID="QtyConsumedTextBox" runat="server" Width="171px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="QtyConsumedTextBox" ErrorMessage="*(Required)" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Quantity Reserved</td>
                        <td class="style2">
                            <asp:TextBox ID="QtyReservedTextBox" runat="server" Width="170px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="QtyReservedTextBox" ErrorMessage="*(Required)" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="RadioButtonList1" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Approver ID</td>
                        <td>
                            <asp:TextBox ID="AppIDTextBox" runat="server" 
                                ontextchanged="AppIDTextBox_TextChanged" Width="175px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="AppIDTextBox" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Available Days</td>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                 Width="241px">
                                <asp:ListItem Value="0">Mon</asp:ListItem>
                                <asp:ListItem Value="1">Tue</asp:ListItem>
                                <asp:ListItem Value="2">Wed</asp:ListItem>
                                <asp:ListItem Value="3">Thurs</asp:ListItem>
                                <asp:ListItem Value="4">Fri</asp:ListItem>
                                <asp:ListItem Value="5">Sat</asp:ListItem>
                                <asp:ListItem Value="6">Sun</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Inventory is available</td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" >
                               
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ControlToValidate="RadioButtonList2" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Delete Inventory</td>
                        <td>
                            &nbsp;
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                                >
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                ControlToValidate="RadioButtonList3" ErrorMessage="*(Required)" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Height="26px" onclick="Button2_Click" 
                                Text="Reset" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
        </div>
    </asp:Panel>
    
    <br />
    <br />
    <br />




</asp:Content>

