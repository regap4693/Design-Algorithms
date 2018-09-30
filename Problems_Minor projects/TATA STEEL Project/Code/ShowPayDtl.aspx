<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ShowPayDtl.aspx.cs" Inherits="ShowPayDtl" %>
<%@ MasterType VirtualPath="~/User.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" DataSourceID="SqlDataSource1" GridLines="Both" 
        style="text-align: left">
        <EditItemTemplate>
            pay_type:
            <asp:TextBox ID="pay_typeTextBox" runat="server" 
                Text='<%# Bind("pay_type") %>' />
            <br />
            pay_payer:
            <asp:TextBox ID="pay_payerTextBox" runat="server" 
                Text='<%# Bind("pay_payer") %>' />
            <br />
            pay_signatory:
            <asp:TextBox ID="pay_signatoryTextBox" runat="server" 
                Text='<%# Bind("pay_signatory") %>' />
            <br />
            pay_payee:
            <asp:TextBox ID="pay_payeeTextBox" runat="server" 
                Text='<%# Bind("pay_payee") %>' />
            <br />
            pay_mode:
            <asp:TextBox ID="pay_modeTextBox" runat="server" 
                Text='<%# Bind("pay_mode") %>' />
            <br />
            pay_payDate:
            <asp:TextBox ID="pay_payDateTextBox" runat="server" 
                Text='<%# Bind("pay_payDate") %>' />
            <br />
            pay_paymentDate:
            <asp:TextBox ID="pay_paymentDateTextBox" runat="server" 
                Text='<%# Bind("pay_paymentDate") %>' />
            <br />
            pay_payNumber:
            <asp:TextBox ID="pay_payNumberTextBox" runat="server" 
                Text='<%# Bind("pay_payNumber") %>' />
            <br />
            pay_payBank:
            <asp:TextBox ID="pay_payBankTextBox" runat="server" 
                Text='<%# Bind("pay_payBank") %>' />
            <br />
            pay_cardTransactionNo:
            <asp:TextBox ID="pay_cardTransactionNoTextBox" runat="server" 
                Text='<%# Bind("pay_cardTransactionNo") %>' />
            <br />
            pay_amount:
            <asp:TextBox ID="pay_amountTextBox" runat="server" 
                Text='<%# Bind("pay_amount") %>' />
            <br />
            pay_description:
            <asp:TextBox ID="pay_descriptionTextBox" runat="server" 
                Text='<%# Bind("pay_description") %>' />
            <br />
            pay_fineAmount:
            <asp:TextBox ID="pay_fineAmountTextBox" runat="server" 
                Text='<%# Bind("pay_fineAmount") %>' />
            <br />
            pay_voucherNo:
            <asp:TextBox ID="pay_voucherNoTextBox" runat="server" 
                Text='<%# Bind("pay_voucherNo") %>' />
            <br />
            pay_voucherDate:
            <asp:TextBox ID="pay_voucherDateTextBox" runat="server" 
                Text='<%# Bind("pay_voucherDate") %>' />
            <br />
            pay_SAPNo:
            <asp:TextBox ID="pay_SAPNoTextBox" runat="server" 
                Text='<%# Bind("pay_SAPNo") %>' />
            <br />
            pay_SAPDate:
            <asp:TextBox ID="pay_SAPDateTextBox" runat="server" 
                Text='<%# Bind("pay_SAPDate") %>' />
            <br />
            pay_isPrinted:
            <asp:CheckBox ID="pay_isPrintedCheckBox" runat="server" 
                Checked='<%# Bind("pay_isPrinted") %>' />
            <br />
            pay_isEmailed:
            <asp:CheckBox ID="pay_isEmailedCheckBox" runat="server" 
                Checked='<%# Bind("pay_isEmailed") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            pay_type:
            <asp:TextBox ID="pay_typeTextBox" runat="server" 
                Text='<%# Bind("pay_type") %>' />
            <br />
            pay_payer:
            <asp:TextBox ID="pay_payerTextBox" runat="server" 
                Text='<%# Bind("pay_payer") %>' />
            <br />
            pay_signatory:
            <asp:TextBox ID="pay_signatoryTextBox" runat="server" 
                Text='<%# Bind("pay_signatory") %>' />
            <br />
            pay_payee:
            <asp:TextBox ID="pay_payeeTextBox" runat="server" 
                Text='<%# Bind("pay_payee") %>' />
            <br />
            pay_mode:
            <asp:TextBox ID="pay_modeTextBox" runat="server" 
                Text='<%# Bind("pay_mode") %>' />
            <br />
            pay_payDate:
            <asp:TextBox ID="pay_payDateTextBox" runat="server" 
                Text='<%# Bind("pay_payDate") %>' />
            <br />
            pay_paymentDate:
            <asp:TextBox ID="pay_paymentDateTextBox" runat="server" 
                Text='<%# Bind("pay_paymentDate") %>' />
            <br />
            pay_payNumber:
            <asp:TextBox ID="pay_payNumberTextBox" runat="server" 
                Text='<%# Bind("pay_payNumber") %>' />
            <br />
            pay_payBank:
            <asp:TextBox ID="pay_payBankTextBox" runat="server" 
                Text='<%# Bind("pay_payBank") %>' />
            <br />
            pay_cardTransactionNo:
            <asp:TextBox ID="pay_cardTransactionNoTextBox" runat="server" 
                Text='<%# Bind("pay_cardTransactionNo") %>' />
            <br />
            pay_amount:
            <asp:TextBox ID="pay_amountTextBox" runat="server" 
                Text='<%# Bind("pay_amount") %>' />
            <br />
            pay_description:
            <asp:TextBox ID="pay_descriptionTextBox" runat="server" 
                Text='<%# Bind("pay_description") %>' />
            <br />
            pay_fineAmount:
            <asp:TextBox ID="pay_fineAmountTextBox" runat="server" 
                Text='<%# Bind("pay_fineAmount") %>' />
            <br />
            pay_voucherNo:
            <asp:TextBox ID="pay_voucherNoTextBox" runat="server" 
                Text='<%# Bind("pay_voucherNo") %>' />
            <br />
            pay_voucherDate:
            <asp:TextBox ID="pay_voucherDateTextBox" runat="server" 
                Text='<%# Bind("pay_voucherDate") %>' />
            <br />
            pay_SAPNo:
            <asp:TextBox ID="pay_SAPNoTextBox" runat="server" 
                Text='<%# Bind("pay_SAPNo") %>' />
            <br />
            pay_SAPDate:
            <asp:TextBox ID="pay_SAPDateTextBox" runat="server" 
                Text='<%# Bind("pay_SAPDate") %>' />
            <br />
            pay_isPrinted:
            <asp:CheckBox ID="pay_isPrintedCheckBox" runat="server" 
                Checked='<%# Bind("pay_isPrinted") %>' />
            <br />
            pay_isEmailed:
            <asp:CheckBox ID="pay_isEmailedCheckBox" runat="server" 
                Checked='<%# Bind("pay_isEmailed") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            pay_type:
            <asp:Label ID="pay_typeLabel" runat="server" Text='<%# Bind("pay_type") %>' />
            <br />
            pay_payer:
            <asp:Label ID="pay_payerLabel" runat="server" Text='<%# Bind("pay_payer") %>' />
            <br />
            pay_signatory:
            <asp:Label ID="pay_signatoryLabel" runat="server" 
                Text='<%# Bind("pay_signatory") %>' />
            <br />
            pay_payee:
            <asp:Label ID="pay_payeeLabel" runat="server" 
                Text='<%# Bind("pay_payee") %>' />
            <br />
            pay_mode:
            <asp:Label ID="pay_modeLabel" runat="server" Text='<%# Bind("pay_mode") %>' />
            <br />
            pay_payDate:
            <asp:Label ID="pay_payDateLabel" runat="server" 
                Text='<%# Bind("pay_payDate") %>' />
            <br />
            pay_paymentDate:
            <asp:Label ID="pay_paymentDateLabel" runat="server" 
                Text='<%# Bind("pay_paymentDate") %>' />
            <br />
            pay_payNumber:
            <asp:Label ID="pay_payNumberLabel" runat="server" 
                Text='<%# Bind("pay_payNumber") %>' />
            <br />
            pay_payBank:
            <asp:Label ID="pay_payBankLabel" runat="server" 
                Text='<%# Bind("pay_payBank") %>' />
            <br />
            pay_cardTransactionNo:
            <asp:Label ID="pay_cardTransactionNoLabel" runat="server" 
                Text='<%# Bind("pay_cardTransactionNo") %>' />
            <br />
            pay_amount:
            <asp:Label ID="pay_amountLabel" runat="server" 
                Text='<%# Bind("pay_amount") %>' />
            <br />
            pay_description:
            <asp:Label ID="pay_descriptionLabel" runat="server" 
                Text='<%# Bind("pay_description") %>' />
            <br />
            pay_fineAmount:
            <asp:Label ID="pay_fineAmountLabel" runat="server" 
                Text='<%# Bind("pay_fineAmount") %>' />
            <br />
            pay_voucherNo:
            <asp:Label ID="pay_voucherNoLabel" runat="server" 
                Text='<%# Bind("pay_voucherNo") %>' />
            <br />
            pay_voucherDate:
            <asp:Label ID="pay_voucherDateLabel" runat="server" 
                Text='<%# Bind("pay_voucherDate") %>' />
            <br />
            pay_SAPNo:
            <asp:Label ID="pay_SAPNoLabel" runat="server" 
                Text='<%# Bind("pay_SAPNo") %>' />
            <br />
            pay_SAPDate:
            <asp:Label ID="pay_SAPDateLabel" runat="server" 
                Text='<%# Bind("pay_SAPDate") %>' />
            <br />
            pay_isPrinted:
            <asp:CheckBox ID="pay_isPrintedCheckBox" runat="server" 
                Checked='<%# Bind("pay_isPrinted") %>' Enabled="false" />
            <br />
            pay_isEmailed:
            <asp:CheckBox ID="pay_isEmailedCheckBox" runat="server" 
                Checked='<%# Bind("pay_isEmailed") %>' Enabled="false" />
            <br />
        </ItemTemplate>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" 
        
        SelectCommand="SELECT [pay_type], [pay_payer], [pay_signatory], [pay_payee], [pay_mode], [pay_payDate], [pay_paymentDate], [pay_payNumber], [pay_payBank], [pay_cardTransactionNo], [pay_amount], [pay_description], [pay_fineAmount], [pay_voucherNo], [pay_voucherDate], [pay_SAPNo], [pay_SAPDate], [pay_isPrinted], [pay_isEmailed] FROM [t_im_payment_dtl] WHERE pay_id=@ab">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="ab" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Back" onclick="Button1_Click" />
</asp:Content>

