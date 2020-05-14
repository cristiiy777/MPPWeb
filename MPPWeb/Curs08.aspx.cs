using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MPPWeb
{
    public partial class Curs08 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.SelectedIndex = 0;
                Image1.ImageUrl = GridView1.SelectedRow.Cells[5].Text;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = GridView1.SelectedRow.Cells[5].Text;
        }
    }
}