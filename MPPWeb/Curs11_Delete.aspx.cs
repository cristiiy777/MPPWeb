using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;

namespace MPPWeb
{
    public partial class Curs11_Delete : System.Web.UI.Page
    {
        private const int DProdus = 2;
        private const int IdProdus = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                GridView1.SelectedIndex = 0;
                GridView1.SelectedIndex = 0;
            }
        }

        protected void BtnStergere_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            BtnStergere.Enabled = false;
            TxtDProdus.Text = GridView1.SelectedRow.Cells[DProdus].Text;
            TxtIdProdus.Text = GridView1.SelectedRow.Cells[IdProdus].Text;
        }

        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            BtnStergere.Enabled = true;
        }

        protected void CV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = AccessDataSource1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select Data from ArhivaStoc where IdProdus=" + TxtIdProdus.Text;
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CV.ErrorMessage = "Produs referit in ArhivaStoc";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                stergeInregistrare();
                Panel1.Visible = false;
                BtnStergere.Enabled = true;
            }
        }

        private void stergeInregistrare()
        {
            int p = GridView1.SelectedIndex;
            int n;
            AccessDataSource1.DeleteParameters[0].DefaultValue = TxtIdProdus.Text;
            AccessDataSource1.Delete();
            GridView1.DataBind();
            n = GridView1.Rows.Count;
            if (n > 0)
                if (p == n) GridView1.SelectedIndex = p - 1;
                else GridView1.SelectedIndex = p;
        }

    }
}