using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MPPWeb
{
    public partial class Curs07 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
                GridView1.SelectedIndex = 0;
                labelindex.Text = "Id-ul produsului selectat este " + GridView1.SelectedValue;
                labelid.Text = "Indexul elementului selectat este " + GridView1.SelectedIndex;
                labelpret.Text = "Pretul de vanzare al produsului selectat este " + GridView1.SelectedRow.Cells[5].Text;
                labelcategorie.Text = "Categoria produsului selectat este " + GridView1.SelectedRow.Cells[6].Text;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            labelindex.Text = "Id-ul produsului selectat este " + GridView1.SelectedValue;
            labelid.Text = "Indexul elementului selectat este " + GridView1.SelectedIndex;
            labelpret.Text = "Pretul de vanzare al produsului selectat este " + GridView1.SelectedRow.Cells[5].Text;
            labelcategorie.Text = "Categoria produsului selectat este " + GridView1.SelectedRow.Cells[6].Text;

        }
    }
}