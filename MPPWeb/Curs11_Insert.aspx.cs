using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;

namespace MPPWeb
{
    public partial class Curs11_Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Panel1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            nullControale();
        }
        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;
        }
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
            if (rd.Read())
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Produs deja existent";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                adaugaInregistrare();
            }
        }

        private void nullControale()
        {
            TxtDProdus.Text = null;
            TxtPret.Text = null;
            DDLTVA.SelectedIndex = 0;
            DDLUM.SelectedIndex = 0;
        }

        private void adaugaInregistrare()
        {
            AccessDataSource1.InsertParameters[0].DefaultValue = TxtDProdus.Text;
            AccessDataSource1.InsertParameters[1].DefaultValue = DDLUM.Text;
            AccessDataSource1.InsertParameters[2].DefaultValue = DDLTVA.Text;
            AccessDataSource1.InsertParameters[3].DefaultValue = TxtPret.Text;
            AccessDataSource1.InsertParameters[4].DefaultValue = "1";
            AccessDataSource1.Insert();
            nullControale();
        }

        protected void BtnConfirma_Click(object sender, EventArgs e)
        {
            adaugaInregistrare();
        }

    }
}