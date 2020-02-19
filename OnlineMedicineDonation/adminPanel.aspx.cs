using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OnlineMedicineDonation
{
    public partial class adminPanel : System.Web.UI.Page
    {

        private void feedUsers() {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM users", con);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            feedUsers();

        }

        protected void btnViewCustomer_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            feedUsers();

        }
    }
}