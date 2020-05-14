<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs07.aspx.cs" Inherits="MPPWeb.Curs07" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web</title>
    <style type="text/css">
        #form1
        {
            height: 359px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Prima mea pagina web cu C#" 
        style="position: absolute; top: 20px; left: 588px;"></asp:Label>
    <br />

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/BD1.mdb" SelectCommand="SELECT * FROM [Produse]">
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT Produse.IdProdus, Produse.DProdus, Produse.UM, Produse.CotaTVA, Produse.PretVanzare, Categorii.DCategorie FROM (Categorii INNER JOIN Produse ON Categorii.IdCategorie = Produse.IdCategorie)">
    </asp:AccessDataSource>




    <br />

    <asp:Label ID="Label2" runat="server" Text="Lista produselor" 
        
        
        style="position: absolute; top: 91px; left: 377px; height: 23px; width: 137px;"></asp:Label>


    <asp:GridView ID="GridView1" runat="server" Height="157px" Width="284px"  
        style="position: absolute; top: 131px; left: 212px;" 
        AutoGenerateColumns="False" 
        DataSourceID="AccessDataSource2" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
        DataKeyNames="IdProdus" PageSize="2">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="" ShowSelectButton="True" />
            <asp:BoundField DataField="IdProdus" HeaderText="IdProdus" 
                InsertVisible="False" SortExpression="IdProdus" />
            <asp:BoundField DataField="DProdus" HeaderText="DProdus" 
                SortExpression="DProdus" />
            <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
            <asp:BoundField DataField="CotaTVA" HeaderText="CotaTVA" 
                SortExpression="CotaTVA" />
            <asp:BoundField DataField="PretVanzare" HeaderText="PretVanzare" 
                SortExpression="PretVanzare" />
            <asp:BoundField DataField="DCategorie" HeaderText="DCategorie" 
                SortExpression="DCategorie" />
        </Columns>
        <SelectedRowStyle BackColor="#33CCFF" />
    </asp:GridView>


    <asp:Label ID="labelid" runat="server" Text="Label" 
        style="position: absolute; top: 208px; left: 656px; width: 227px;"></asp:Label>
    <asp:Label ID="labelindex" runat="server" Text="Label" 
        
        style="position: absolute; top: 142px; left: 657px; height: 19px; width: 222px;"></asp:Label>
    <asp:Label ID="labelpret" runat="server" Text="Label" 
        
        style="position: absolute; top: 268px; left: 656px; bottom: 167px; width: 227px;"></asp:Label>
        <asp:Label ID="labelcategorie" runat="server" Text="Label" 
        style = "position: absolute; top: 324px; left: 656px; width: 259px;"></asp:Label>

    
    


    </form>
</body>
</html>
