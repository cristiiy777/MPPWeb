<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs08.aspx.cs" Inherits="MPPWeb.Curs08" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web</title>
    <style type="text/css">
        #form1
        {
            height: 721px;
            width: 1147px;
        }
    </style>
</head>
<body style="height: 728px">
    <form id="form1" runat="server">


    <asp:AccessDataSource ID="ADS1" runat="server" DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT * FROM [Categorii]">
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="ADS2" runat="server" DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT * FROM [Produse] WHERE ([IdCategorie] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox1" Name="IdCategorie" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>

    
    <asp:Image ID="Image1" runat="server" 
        
        style="position: absolute; top: 103px; left: 838px; height: 130px; width: 165px;" 
        Height="100px" Width="100px" />

    
    <asp:Label ID="labeltitlu" runat="server" 
        Text="Legatura one to many intre categorii si produse" 
        style="position: absolute; top: 56px; left: 194px;" Font-Bold="True" 
        Font-Size="14pt"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" 
        style="position: absolute; top: 104px; left: 169px; right: 374px; height: 126px;" 
        AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="IdProdus" DataSourceID="ADS2" ForeColor="#333333" 
        GridLines="None" PageSize="2" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            <asp:BoundField DataField="IdProdus" HeaderText="IdProdus" 
                InsertVisible="False" ReadOnly="True" SortExpression="IdProdus" />
            <asp:BoundField DataField="DProdus" HeaderText="DProdus" 
                SortExpression="DProdus" />
            <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
            <asp:BoundField DataField="CotaTVA" HeaderText="CotaTVA" 
                SortExpression="CotaTVA" />
            <asp:BoundField DataField="PretVanzare" HeaderText="PretVanzare" 
                SortExpression="PretVanzare" />
            <asp:BoundField DataField="IdCategorie" HeaderText="IdCategorie" 
                SortExpression="IdCategorie" />
            <asp:BoundField DataField="SpPoza" HeaderText="SpPoza" />
            <asp:ImageField DataImageUrlField="SpPoza">
                <ControlStyle Height="80px" Width="80px" />
            </asp:ImageField>
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


    <asp:ListBox ID="ListBox1" runat="server" 
        style="position: absolute; top: 150px; left: 38px; height: 128px; width: 78px;" 
        AutoPostBack="True" DataSourceID="ADS1" DataTextField="DCategorie" 
        DataValueField="IdCategorie"></asp:ListBox>




    <asp:AccessDataSource ID="ADS3" runat="server" DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT * FROM [Produse]" 
        DeleteCommand="DELETE FROM [Produse] WHERE [IdProdus] = ?" 
        InsertCommand="INSERT INTO [Produse] ([IdProdus], [DProdus], [UM], [CotaTVA], [PretVanzare], [IdCategorie], [SpPoza]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Produse] SET [DProdus] = ?, [UM] = ?, [CotaTVA] = ?, [PretVanzare] = ?, [IdCategorie] = ?, [SpPoza] = ? WHERE [IdProdus] = ?">
        <DeleteParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdCategorie" Type="Int32" />
            <asp:Parameter Name="SpPoza" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdCategorie" Type="Int32" />
            <asp:Parameter Name="SpPoza" Type="String" />
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:Label ID="Label5" runat="server" Text="Categorie" 
        style="position: absolute; top: 658px; left: 186px; right: 830px;"></asp:Label>
    <asp:Button ID="btnConfirma" runat="server" Text="Confirma" 
        style="position:absolute; top: 536px; left: 552px;" 
        onclick="btnConfirma_Click"/>




    <asp:TextBox ID="textPretVanzare" runat="server" 
        style="position:absolute; top: 546px; left: 322px; width: 129px;"></asp:TextBox>
    <asp:DropDownList ID="dropdownUM" runat="server" 
        style="position:absolute; top: 597px; left: 265px; width: 70px; height: 15px;" 
        AutoPostBack="True">
        <asp:ListItem>Buc</asp:ListItem>
        <asp:ListItem>UM</asp:ListItem>
        <asp:ListItem>M</asp:ListItem>
        <asp:ListItem>MP</asp:ListItem>
        <asp:ListItem>Kg</asp:ListItem>
    </asp:DropDownList>




    <asp:Label ID="Label1" runat="server" Text="Pret Vanzare" 
        style="position:absolute; top: 550px; left: 196px;"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" 
        style="position:absolute; top: 297px; left: 172px; width: 612px;" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IdProdus" 
        DataSourceID="ADS3" AllowPaging="True" PageSize="2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="IdProdus" HeaderText="IdProdus" 
                InsertVisible="False" ReadOnly="True" SortExpression="IdProdus" />
            <asp:BoundField DataField="DProdus" HeaderText="DProdus" 
                SortExpression="DProdus" />
            <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
            <asp:BoundField DataField="CotaTVA" HeaderText="CotaTVA" 
                SortExpression="CotaTVA" />
            <asp:BoundField DataField="PretVanzare" HeaderText="PretVanzare" 
                SortExpression="PretVanzare" />
            <asp:BoundField DataField="IdCategorie" HeaderText="IdCategorie" 
                SortExpression="IdCategorie" />
            <asp:BoundField DataField="SpPoza" HeaderText="SpPoza" 
                SortExpression="SpPoza" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>




    <asp:Label ID="Label2" runat="server" Text="Cota TVA" 
        style="position:absolute; top: 597px; left: 365px; height: 19px;"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="UM" 
        style="position:absolute; top: 598px; left: 199px; height: 19px;"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Denumire Produs" 
        style="position:absolute; top: 498px; left: 195px;"></asp:Label>
    <asp:TextBox ID="textDProdus" runat="server" 
        style="position:absolute; top: 496px; left: 325px; width: 123px;"></asp:TextBox>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        style="position:absolute; top: 571px; left: -690px;">
    </asp:DropDownList>




    <asp:DropDownList ID="dropdownCotaTVA" runat="server" 
        
        
        style="position: absolute; top: 594px; left: 456px; height: 19px; width: 64px;">
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
    </asp:DropDownList>




    <asp:DropDownList ID="dropdownIdCategorie" runat="server" 
        
        style="position: absolute; top: 658px; left: 267px; width: 72px; height: 27px;" 
        DataSourceID="ADS1" DataTextField="DCategorie" DataValueField="IdCategorie">
    </asp:DropDownList>




    </form>
</body>
</html>
