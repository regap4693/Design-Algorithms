<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ContactUser.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 19%;
            margin-right: 0px;
        }
        .style5
        {
            width: 18px;
            text-align: justify;
        }
        .style6
        {
            width: 1304px;
            text-align: left;
        }
        .style7
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:Label ID="Label1" runat="server" 
        style="font-weight: 700; font-style: italic; text-decoration: underline; font-size: large" 
        Text="Mentor"></asp:Label>
    <br />
    <br />
    <br />
    <table align="left" class="style1">
        <tr>
            <td class="style6">
                <ul>
                    <li><span class="style7">Gourab Mitra&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                </ul>
            </td>
            <td class="style5">
                <asp:Image ID="Image2" runat="server" Height="164px" 
                    ImageUrl="~/Images/918092098262.jpg" Width="135px" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" 
        style="font-weight: 700; font-style: italic; text-decoration: underline; font-size: large" 
        Text="Disciples"></asp:Label>
    <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Disc" 
        style="font-size: medium" Width="260px">
        <asp:ListItem>Abhilash Gour</asp:ListItem>
        <asp:ListItem>Tanistha Nandi</asp:ListItem>
        <asp:ListItem>P.Rajeshwari</asp:ListItem>
        <asp:ListItem>Santosh Prasad</asp:ListItem>
        <asp:ListItem>Videet Kumar</asp:ListItem>
        <asp:ListItem>Saurav Ghosh</asp:ListItem>
    </asp:BulletedList>
    <br />
    <br />
</asp:Content>

