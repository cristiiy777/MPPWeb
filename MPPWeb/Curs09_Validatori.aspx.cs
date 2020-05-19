using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace MPPWeb
{
    public partial class Curs09 : System.Web.UI.Page
    {

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = AccessDataSource1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdProdus from Produse where DProdus='" + TxtDProdus.Text + "'";
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read()) args.IsValid = false; //daca se citeste adica daca gaseste un rezultat, atunci produsul exista deja, deci e duplicat, se returneaza fals si se da eroare
            else args.IsValid = true;
            con.Close();
        }

        protected void BtnConfirma_Click(object sender, EventArgs e)
        {
            //aaa
        }

    }
}