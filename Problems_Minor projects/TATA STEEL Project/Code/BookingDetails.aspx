<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="BookingDetails.aspx.cs" Inherits="Default2" %>
<%@ MasterType VirtualPath="~/User.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
        .style2
        {
            width: 368px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="style2">
                <p class="style1">
                    Enter the Booking Details:
                </p>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Booking PNo.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="BookingPNo" runat="server" Width="128px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PNoRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingPNo" ErrorMessage="*This field is mandatory" 
                    ToolTip="Please Enter correct PNo"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="PNoRangeValidator" runat="server" 
                    ControlToValidate="BookingPNo" ErrorMessage="*This length should be of max 10 characters." 
                    MaximumValue="9999999999" MinimumValue="0" ToolTip="Please Enter a number" 
                    Display="Dynamic" SetFocusOnError="True"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Employee Name:</td>
            <td>
                <asp:TextBox ID="BookingEname" runat="server" Width="128px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BEnameRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingEname" ErrorMessage="*This field is mandatory" 
                    ToolTip="Please Enter a valid name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Employee Email:</td>
            <td>
                <asp:TextBox ID="BookingEemail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BEmailRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingEemail" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="BEmailRegularExpressionValidator" 
                    runat="server" ControlToValidate="BookingEemail" 
                    ErrorMessage="*Please enter a valid email id." 
                    ToolTip="Enter Correct Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Employee Contact No.:</td>
            <td>
                <asp:TextBox ID="BookingEcontact" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BEcontactRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingEcontact" ErrorMessage="*This field is mandatory" 
                    ToolTip="ease enter a 10 digit number"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="BEcontactRangeValidator" runat="server" 
                    ControlToValidate="BookingEcontact" ErrorMessage="*Please enter a 10 digit number" 
                    MaximumValue="9999999999" MinimumValue="1000000000" 
                    ToolTip="Enter 10 digit number" Display="Dynamic"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Employee Department:</td>
            <td>
                <asp:DropDownList ID="BookingEdeptDropDownList" runat="server" Width="130px" 
                    AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" 
                    DataTextField="dept_name" DataValueField="dept_name">
                    <asp:ListItem Selected="True" Value=" "> </asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="BEdeptRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingEdeptDropDownList" ErrorMessage="*This field is mandatory" 
                    ToolTip="Enter dept name"></asp:RequiredFieldValidator>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    
                    SelectCommand="SELECT [dept_name], [dept_id] FROM [t_im_dept_mst] WHERE dept_valid='True' and dept_isDeleted='False'"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Employee Derpartment Cost Centre:</td>
            <td>
                <asp:TextBox ID="BookingECC" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BECCRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingECC" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Select Your purpose:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="pur_name" 
                    DataValueField="pur_id" AppendDataBoundItems="True">
                    <asp:ListItem Value=" ">Select</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    SelectCommand="SELECT [pur_name], [pur_id] FROM [t_im_pur_mst] WHERE pur_valid='True' and pur_isDeleted = 'False'">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Select the Chair</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="meet_name" 
                    DataValueField="meet_id" AppendDataBoundItems="True">
                    <asp:ListItem Value=" ">Select</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
                    
                    SelectCommand="SELECT [meet_name], [meet_id] FROM [t_im_meet_mst] WHERE meet_valid='True' and meet_isDeleted='False'">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                No. of People:</td>
            <td>
                <asp:TextBox ID="People" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PeopleRequiredFieldValidator" runat="server" 
                    ControlToValidate="People" ErrorMessage="*This field is mandatory" 
                    ToolTip="Enter No. of people"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Booking Description:</td>
            <td>
                <asp:TextBox ID="BookingDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BdescRequiredFieldValidator" runat="server" 
                    ControlToValidate="BookingDesc" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Start date:</td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server" 
                    onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
                    FirstDayOfWeek="Sunday" SelectedDate="07/09/2013 08:51:42"></asp:Calendar>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                Start time:</td>
            <td>
                <asp:TextBox ID="Starttime" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StarttimeRequiredFieldValidator" runat="server" 
                    ControlToValidate="Starttime" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                End date:</td>
            <td>
                <asp:Calendar ID="Calendar2" runat="server" 
                    onselectionchanged="Calendar2_SelectionChanged" ShowGridLines="True" 
                    FirstDayOfWeek="Sunday"></asp:Calendar>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" 
                    ErrorMessage="* Enter Valid Date" Type="Date" Operator="GreaterThanEqual"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                End time:</td>
            <td>
                <asp:TextBox ID="Endtime" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EndtimeRequiredFieldValidator" runat="server" 
                    ControlToValidate="Endtime" ErrorMessage="*This field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Reset" 
                    CausesValidation="False" />
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
                    UseSubmitBehavior="False" />
            </td>
        </tr>
    </table>
</asp:Content>

