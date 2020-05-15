<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs11_Insert.aspx.cs"
    Inherits="MPPWeb.Curs11_Insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web Adaugare Inregistrari</title>
    <style type="text/css">
        #form1
        {
            height: 394px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BD1.mdb"
        DeleteCommand="DELETE FROM [Produse] WHERE [IdProdus] = ?" InsertCommand="INSERT INTO [Produse] ( [DProdus], [UM], [CotaTVA], [PretVanzare]) VALUES (?, ?, ?, ?)"
        SelectCommand="SELECT [IdProdus], [DProdus], [UM], [CotaTVA], [PretVanzare] FROM [Produse]"
        UpdateCommand="UPDATE [Produse] SET [DProdus] = ?, [UM] = ?, [CotaTVA] = ?, [PretVanzare] = ? WHERE [IdProdus] = ?">
        <DeleteParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdCategorie" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>



    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="AccessDataSource1" GridLines="Horizontal" 
        PageSize="2">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="Oferta Produse"></asp:Label>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Adaugare" />
    <asp:Panel ID="Panel1" runat="server" Height="189px">
        <asp:Label ID="Label2" runat="server" Text="Produs"></asp:Label>
        <asp:TextBox ID="TxtDProdus" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVDenumire" runat="server" 
            ControlToValidate="TxtDProdus" ErrorMessage="Completeaza Produs"></asp:RequiredFieldValidator>
        <asp:Label ID="Label3" runat="server" Text="Pret Vanzare"></asp:Label>
        <asp:TextBox ID="TxtPret" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVPret" runat="server" 
            ControlToValidate="TxtPret" ErrorMessage="Completeaza Pret"></asp:RequiredFieldValidator>
        <asp:Label ID="Label4" runat="server" Text="UM"></asp:Label>
        <asp:DropDownList ID="DDLUM" runat="server">
            <asp:ListItem> </asp:ListItem>
            <asp:ListItem>Buc</asp:ListItem>
            <asp:ListItem>M</asp:ListItem>
            <asp:ListItem>MP</asp:ListItem>
            <asp:ListItem>Kg</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RFVUM" runat="server" ControlToValidate="DDLUM" 
            ErrorMessage="Completeaza UM"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator1" runat="server" 
            ErrorMessage="Duplicat pe cheie semantica" ForeColor="Red"></asp:CustomValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:Label ID="Label5" runat="server" Text="TVA"></asp:Label>
        <asp:DropDownList ID="DDLTVA" runat="server" Height="17px" Width="67px">
            <asp:ListItem> </asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="BtnConfirma" runat="server" onclick="BtnConfirma_Click" 
            Text="Confirma" />
        <asp:Button ID="BtnRenunta" runat="server" onclick="BtnRenunta_Click" 
            Text="Renunta" />
    </asp:Panel>



    </form>
</body>
</html>
