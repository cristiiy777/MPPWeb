<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs11_Delete.aspx.cs"
    Inherits="MPPWeb.Curs11_Delete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BD1.mdb"
        DeleteCommand="DELETE FROM [Produse] WHERE [IdProdus] = ?" InsertCommand="INSERT INTO [Produse] ([IdProdus], [DProdus], [UM], [CotaTVA], [PretVanzare]) VALUES (?, ?, ?, ?, ?)"
        SelectCommand="SELECT [IdProdus], [DProdus], [UM], [CotaTVA], [PretVanzare] FROM [Produse]"
        UpdateCommand="UPDATE [Produse] SET [DProdus] = ?, [UM] = ?, [CotaTVA] = ?, [PretVanzare] = ? WHERE [IdProdus] = ?">
        <DeleteParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:Label ID="Label1" runat="server" Text="Oferta produse" Font-Size="16"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="IdProdus"
        DataSourceID="AccessDataSource1" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="" ShowSelectButton="True" />
            <asp:BoundField DataField="IdProdus" HeaderText="IdProdus" InsertVisible="False"
                ReadOnly="True" SortExpression="IdProdus" />
            <asp:BoundField DataField="DProdus" HeaderText="DProdus" SortExpression="DProdus" />
            <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
            <asp:BoundField DataField="CotaTVA" HeaderText="CotaTVA" SortExpression="CotaTVA" />
            <asp:BoundField DataField="PretVanzare" HeaderText="PretVanzare" SortExpression="PretVanzare" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:Button ID="BtnStergere" runat="server" Text="Sterge produs" Style="position: absolute;
        top: 36px; left: 390px; right: 415px;" OnClick="BtnStergere_Click" />
    <asp:Panel ID="Panel1" runat="server" Style="position: absolute; top: 76px; left: 388px;
        width: 295px; height: 196px;">
        <asp:Label ID="Label2" runat="server" Text="Confirmati stergerea produsului" Style="position: absolute;
            top: 9px; left: 31px;"></asp:Label>
        <asp:TextBox ID="TxtDProdus" runat="server" Style="position: absolute; top: 35px;
            left: 23px; width: 196px;"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="Id" Style="position: absolute; top: 65px;
            left: 29px;"></asp:Label>
        <asp:TextBox ID="TxtIdProdus" runat="server" Style="position: absolute; top: 64px;
            left: 55px; height: 20px; width: 44px;"></asp:TextBox>
        <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" Style="position: absolute;
            top: 98px; left: 30px;" />
        <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" Style="position: absolute;
            top: 99px; left: 118px;" OnClick="BtnRenunta_Click" />
        <asp:CustomValidator ID="CV" runat="server" ErrorMessage="CustomValidator" Style="position: absolute;
            top: 65px; left: 126px; width: 19px;" Text="&nbsp" OnServerValidate="CV_ServerValidate"></asp:CustomValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Style="position: absolute;
            top: 138px; left: 28px;" ForeColor="#FF3300" />
    </asp:Panel>
    </form>
</body>
</html>
