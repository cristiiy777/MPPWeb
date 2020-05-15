<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curs11_Logare.aspx.cs" Inherits="MPPWeb.Curs11_Logare" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logare</title>
    <style type="text/css">
        #form1
        {
            height: 367px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">



    <asp:Label ID="Label1" runat="server" Text="Parola" 
        style="position:absolute; top: 136px; left: 75px; height: 21px; width: 65px;"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Utilizator" 
        style="position:absolute; top: 88px; left: 75px;"></asp:Label>



    <asp:Button ID="Button1" runat="server" Text="Logare" 
        style="position:absolute; top: 91px; left: 430px;" 
        onclick="Button1_Click"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Completeaza Utilizator" 
        style="position:absolute; top: 87px; left: 341px;" 
        ControlToValidate="TxtUtilizator">X</asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Completeaza Parola" 
        style="position:absolute; top: 131px; left: 341px;" 
        ControlToValidate="TxtParola">X</asp:RequiredFieldValidator>



    <asp:CustomValidator ID="CV1" runat="server" 
        ErrorMessage="Eroare" 
        style="position:absolute; top: 197px; left: 55px; width: 31px;" 
        onservervalidate="CV1_ServerValidate">Eroare</asp:CustomValidator>



    <asp:AccessDataSource ID="ADS1" runat="server" DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT * FROM [Produse]">
    </asp:AccessDataSource>
   
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        style="position: absolute; top: 182px; left: 148px;" ForeColor="Red"/>
   
    <asp:TextBox ID="TxtUtilizator" runat="server"  
        style="position: absolute; top: 92px; left: 149px;"></asp:TextBox>
    
    <asp:TextBox ID="TxtParola" runat="server" 
        style="position: absolute; top: 134px; left: 150px;"></asp:TextBox>



    </form>
</body>
</html>
