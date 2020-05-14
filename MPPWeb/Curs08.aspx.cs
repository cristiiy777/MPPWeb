using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace MPPWeb
{
    public partial class Curs08 : System.Web.UI.Page
    {

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = GridView1.SelectedRow.Cells[7].Text;
        }

        protected void btnConfirma_Click(object sender, EventArgs e)
        {
            OleDbConnection con = new OleDbConnection();
            OleDbCommand cmd = new OleDbCommand();
            con.ConnectionString = ADS3.ConnectionString;
            cmd.Connection = con;
            cmd.CommandText = "Insert into Produse(DProdus, PretVanzare, UM, CotaTVA, IdCategorie) Values('" + textDProdus.Text + "', '" + textPretVanzare.Text + "', '" + dropdownUM.Text + "', '" + dropdownCotaTVA.Text + "', '" + dropdownIdCategorie.SelectedValue +"')";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //Refresh
            GridView1.EditIndex = -1;
            GridView1.DataBind(); 
            
        }

        

    }
}