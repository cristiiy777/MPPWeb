<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs08.aspx.cs" Inherits="MPPWeb.Curs08" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web</title>
    <style type="text/css">
        #form1
        {
            height: 411px;
        }
    </style>
</head>
<body>
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

    
    <asp:Label ID="labeltitlu" runat="server" 
        Text="Legatura one to many intre categorii si produse" 
        style="position: absolute; top: 56px; left: 194px;" Font-Bold="True" 
        Font-Size="14pt"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" 
        style="position: absolute; top: 104px; left: 169px; right: 374px; height: 126px;" 
        AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="IdProdus" DataSourceID="ADS2" ForeColor="#333333" 
        GridLines="None" PageSize="2">
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
        style="position: absolute; top: 106px; left: 25px; height: 128px; width: 78px;" 
        AutoPostBack="True" DataSourceID="ADS1" DataTextField="DCategorie" 
        DataValueField="IdCategorie"></asp:ListBox>




    </form>
</body>
</html>
