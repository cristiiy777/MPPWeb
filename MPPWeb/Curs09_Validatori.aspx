<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs09_Validatori.aspx.cs" Inherits="MPPWeb.Curs09" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicatie Web</title>
    <style type="text/css">
        #form1
        {
            height: 458px;
        }
    </style>

    <script type="text/javascript">
        function f(ctl, args) {
            var s = args.Value;
            var an, luna, zi;
            an = s.substr(1, 2);
            luna = s.substr(3, 2);
            zi = s.substr(5, 2);
            if (luna < 1 || luna > 12) {
                args.IsValid = false; document.getElementById("TxtDN").value = "";
                return; 
            }
            document.getElementById("TxtDN").value = luna + "/" + zi + "/" + an;
            args.IsValid = true;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
  

    <asp:Label ID="LblDProdus" runat="server" Text="Produs" 
        style="position: absolute; top: 67px; left: 21px;"></asp:Label>
    <asp:TextBox ID="TxtDProdus" runat="server" 
        style="position: absolute; top: 67px; left: 138px;"></asp:TextBox>

    <asp:Label ID="LblPretVanzare" runat="server" Text="Pret Vanzare" 
        style="position: absolute; top: 115px; left: 22px;"></asp:Label>
    <asp:TextBox ID="TxtPretVanzare" runat="server" 
        style="position: absolute; top: 118px; left: 137px;"></asp:TextBox>
  

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TxtDProdus" ErrorMessage="Completati Produs" 
        SetFocusOnError="True" 
        style="position: absolute; top: 67px; left: 296px; width: 124px;">validator</asp:RequiredFieldValidator>
  

    <asp:ValidationSummary ID="VS1" runat="server" ForeColor="#FF3300" 
        
        style ="position: absolute; top: 361px; left: 20px; height: 43px; width: 287px;"/>
  

    <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" 
        style ="position: absolute; top: 318px; left: 20px;" 
        onclick="BtnConfirma_Click" />
  

    <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" 
        style ="position: absolute; top: 318px; left: 126px;" />
  

    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Completeaza Pret Vanzare" 
        style="position:absolute; top: 116px; left: 299px; width: 120px;" 
        ControlToValidate="TxtPretVanzare" SetFocusOnError="True">validator</asp:RequiredFieldValidator>
  
    <asp:Label ID="LblUM" runat="server" Text="UM" 
        style="position: absolute; top: 169px; left: 26px;"></asp:Label>

    <asp:DropDownList ID="DdlUM" runat="server" 
        
        style="position: absolute; top: 172px; left: 139px; height: 17px; width: 55px;">
        <asp:ListItem> </asp:ListItem>
        <asp:ListItem>Buc</asp:ListItem>
        <asp:ListItem>M</asp:ListItem>
        <asp:ListItem>MP</asp:ListItem>
        <asp:ListItem>Kg</asp:ListItem>
    </asp:DropDownList>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Selecteaza UM" 
        style="position:absolute; top: 170px; left: 235px; width: 89px;" 
        ControlToValidate="DdlUM" SetFocusOnError="True">validator</asp:RequiredFieldValidator>

    <asp:DropDownList ID="DdlTVA" runat="server" 
        
        style="position: absolute; top: 235px; left: 140px; height: 17px; width: 52px;">
        <asp:ListItem> </asp:ListItem>
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
    </asp:DropDownList>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Selecteaza TVA" 
        style="position:absolute; top: 236px; left: 245px; width: 95px;" 
        ControlToValidate="DdlTVA" SetFocusOnError="True">validator</asp:RequiredFieldValidator>

    <asp:Label ID="Label1" runat="server" Text="TVA" 
        style="position:absolute; top: 234px; left: 28px;"></asp:Label>

    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="TxtPretVanzare" 
        ErrorMessage="Pretul trebuie sa fie intre 0 si 1000" MaximumValue="1000" 
        MinimumValue="0" SetFocusOnError="True" Type="Currency" 
        style="position: absolute; top: 110px; left: 469px; width: 86px;">&nbsp;</asp:RangeValidator>

    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Data eronata. Model: 07.07.1998" 
        style="position: absolute; top: 275px; left: 325px; width: 121px;" 
        ControlToValidate="txtData" SetFocusOnError="True" 
        ValidationExpression="(0[1-9]|[12][0-9]|3[01])[.](0[1-9]|1[012])[.]\d{4}">validator</asp:RegularExpressionValidator>
    <asp:Label ID="Label2" runat="server" Text="Data" 
        style="position: absolute; top: 281px; left: 28px;"></asp:Label>
    <asp:TextBox ID="txtData" runat="server" 
        style="position: absolute; top: 280px; left: 137px;"></asp:TextBox>

    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ErrorMessage="Eroare duplicat cheie semantica - Produs duplicat" 
        style = "position: absolute; top: 66px; left: 455px; width: 207px;" 
        onservervalidate="CustomValidator1_ServerValidate">&nbsp;</asp:CustomValidator>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/BD1.mdb" SelectCommand="SELECT * FROM [Produse]">
    </asp:AccessDataSource>
    <asp:Label ID="Label3" runat="server" 
        Text="Validatori text null, regex la dată, și duplicat pe cheie semantică"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="IdProdus" 
        DataSourceID="AccessDataSource1" PageSize="4" 
        style = "position:absolute; top: 27px; left: 693px;" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
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

    <asp:Label ID="Label4" runat="server" Text="Validare CNP cu funcție JavaScript" 
        style="position: absolute; top: 221px; left: 687px;" ></asp:Label>

    <asp:Label ID="Label5" runat="server" Text="CNP" 
        style = "position: absolute; top: 294px; left: 819px;"></asp:Label>
    <asp:TextBox ID="TxtCNP" runat="server" 
        style = "position: absolute; top: 292px; left: 893px;"></asp:TextBox>
    <asp:Label ID="Label6" runat="server" Text="Dată" 
        style="position: absolute; top: 345px; left: 818px;"></asp:Label>
    <asp:TextBox ID="TxtDN" runat="server" 
        style="position: absolute; top: 345px; left: 892px;"></asp:TextBox>
    <asp:CustomValidator ID="CustomValidator2" runat="server" 
        ErrorMessage="CNP eronat" 
        style="position: absolute; top: 399px; left: 865px;" 
        ControlToValidate="TxtCNP" ClientValidationFunction="f">validator</asp:CustomValidator>




    </form>
</body>

</html>
