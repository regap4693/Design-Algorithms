<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Sublocation_update.aspx.cs" Inherits="Sublocation_update" %>

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
            height: 29px;
        }
        .style7
        {
            text-align: center;
        }
        .style8
        {
            height: 29px;
            width: 12px;
        }
        .style9
        {
            width: 12px;
        }
        .style10
        {
            height: 21px;
            width: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#3366CC" 
        Height="0.24in" 
        style="margin-top: 0px; font-weight: 700; font-size: xx-large;" Text="       SUBLOCATION DETAILS" 
        Width="5.12in"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <div style="overflow:scroll;">
   
    <asp:GridView ID="GridView1"  runat="server" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        AutoGenerateEditButton="True" onrowediting="GridView1_RowEditing" 
        onrowupdating="GridView1_RowUpdating" ForeColor="#333333" AllowPaging="True" 
            CellPadding="4" 
            onrowcancelingedit="GridView1_RowCancelingEdit" GridLines="None">
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
        <br />
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
                    Enter Your Personal Number</td>
                <td class="style8">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox6" Display="Dynamic" 
                        ErrorMessage="*This field is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7" colspan="3">
                    CHANGE THE REQUIRED FIELDS</td>
            </tr>
            <tr>
                <td class="style3">
                    SubLocation Name:</td>
                <td class="style9">
                    <asp:TextBox ID="TextBox2" runat="server" Width="201px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" Display="Dynamic" 
                        ErrorMessage="*This field is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    SubLocation Availability:</td>
                <td class="style9">
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList3" Display="Dynamic" 
                        ErrorMessage="*This field is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    SubLocation Id</td>
                <td class="style10">
                    <asp:TextBox ID="TextBox4" runat="server" Width="202px"></asp:TextBox>
                </td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox4" Display="Dynamic" 
                        ErrorMessage="*This field is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Personal Number of Owner:</td>
                <td class="style9">
                    <asp:TextBox ID="TextBox5" runat="server" Width="202px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox5" Display="Dynamic" 
                        ErrorMessage="*This field is mandatory" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Delete SubLocation</td>
                <td class="style9">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                        <asp:ListItem Value="true">Yes</asp:ListItem>
                        <asp:ListItem Value="false">No</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="RadioButtonList2" ErrorMessage="*This field is mandatory" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style9">
                    <asp:Button ID="Button2"  runat="server" CausesValidation="False" 
                        Text="Reset" onclick="Button2_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
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

