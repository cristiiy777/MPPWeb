<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs11_Update.aspx.cs" Inherits="MPPWeb.Curs11" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BD1.mdb"
        DeleteCommand="DELETE FROM [Produse] WHERE [IdProdus] = ?" InsertCommand="INSERT INTO [Produse] ([DProdus], [UM], [CotaTVA], [PretVanzare])
VALUES (?, ?, ?, ?)" SelectCommand="SELECT [IdProdus], [DProdus], [UM], [CotaTVA], [PretVanzare] FROM [Produse]"
        UpdateCommand="UPDATE [Produse] SET [DProdus] = ?, [UM] = ?, [CotaTVA] = ?,
[PretVanzare] = ? WHERE [IdProdus] = ?">
        <DeleteParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdProdus"
        DataSourceID="AccessDataSource1" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="" ShowSelectButton="True" />
            <asp:BoundField DataField="IdProdus" HeaderText="IdProdus" InsertVisible="False"
                ReadOnly="True" SortExpression="IdProdus" />
            <asp:BoundField DataField="DProdus" HeaderText="DProdus" SortExpression="DProdus" />
            <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
            <asp:BoundField DataField="CotaTVA" HeaderText="CotaTVA" SortExpression="CotaTVA" />
            <asp:BoundField DataField="PretVanzare" HeaderText="PretVanzare" SortExpression="PretVanzare" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Modifica produs" Style="position: absolute;
        top: 31px; left: 389px;" OnClick="Button1_Click" />
    <asp:Panel ID="Panel1" runat="server" Style="position: absolute; top: 71px; left: 393px;
        width: 383px; height: 201px;">
        <asp:Label ID="LblDProdus" runat="server" Text="Denumire" Style="position: absolute;
            top: 13px; left: 17px;"></asp:Label>
        <asp:TextBox ID="TxtDProdus" runat="server" Style="position: absolute; top: 10px;
            left: 87px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVDProdus" runat="server" ErrorMessage="Completati Denumire"
            Style="position: absolute; top: 11px; left: 235px;" ControlToValidate="TxtDProdus"
            SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CV" runat="server" ErrorMessage="CustomValidator" Style="position: absolute;
            top: 9px; left: 277px; width: 7px;" OnServerValidate="CV_ServerValidate">&nbsp;</asp:CustomValidator>
        <asp:Label ID="LblIdProdus" runat="server" Text="IdProdus" Style="position: absolute;
            top: 128px; left: 23px;"></asp:Label>
        <asp:TextBox ID="TxtIdProdus" runat="server" Style="position: absolute; top: 125px;
            left: 85px; width: 63px;" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="LblPretVanzare" runat="server" Text="Pret" Style="position: absolute;
            top: 42px; left: 21px;"></asp:Label>
        <asp:TextBox ID="TxtPretVanzare" runat="server" Style="position: absolute; top: 41px;
            left: 87px; right: 168px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVPretVanzare" runat="server" ErrorMessage="Completati Pret"
            Style="position: absolute; top: 41px; left: 226px;" ControlToValidate="TxtPretVanzare"
            SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RVPretVanzare" runat="server" ErrorMessage="Pret eronat"
            Style="position: absolute; top: 42px; left: 262px;" ControlToValidate="TxtPretVanzare"
            MaximumValue="1000" MinimumValue="0" Type="Currency">&nbsp;</asp:RangeValidator>
        <asp:Label ID="LblUM" runat="server" Text="UM" Style="position: absolute; top: 69px;
            left: 21px;"></asp:Label>
        <asp:DropDownList ID="DdlUM" runat="server" Style="position: absolute; top: 70px;
            left: 87px;">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Buc</asp:ListItem>
            <asp:ListItem>Kg</asp:ListItem>
            <asp:ListItem>M</asp:ListItem>
            <asp:ListItem>MP</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RFVUM" runat="server" ErrorMessage="Completati UM"
            Style="position: absolute; top: 68px; left: 155px;" ControlToValidate="DdlUM"
            SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
        <asp:Label ID="LblTVA" runat="server" Text="TVA" Style="position: absolute; top: 100px;
            left: 23px; right: 326px;"></asp:Label>
        <asp:DropDownList ID="DdlTVA" runat="server" Style="position: absolute; top: 98px;
            left: 87px; height: 17px; width: 50px;">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RFVTVA" runat="server" ErrorMessage="Completati TVA"
            Style="position: absolute; top: 98px; left: 141px;" ControlToValidate="DdlTVA"
            SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
        <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" Style="position: absolute;
            top: 164px; left: 13px;" />
        <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" Style="position: absolute;
            top: 164px; left: 101px;" OnClick="BtnRenunta_Click" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Style="position: absolute;
            top: 113px; left: 182px; height: 73px; width: 192px;" ForeColor="#FF3300" />
    </asp:Panel>
    </form>
</body>
</html>
