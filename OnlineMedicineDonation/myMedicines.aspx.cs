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
    public partial class myMedicines : System.Web.UI.Page
    {

        private void feedMeds() {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM meds WHERE user_id = " + Session["userId"], con);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();

                sqlDataAdapter.Dispose();
                con.Close();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loggedIn"] == null) {

                Response.Redirect("/");
            }

            if (Request["deleteMed"] != null) {

                using (SqlConnection con = new SqlConnection(login.conString))
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM meds WHERE id = " + Request["deleteMed"], con);

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();

                }

            }

            feedMeds();

        }
    }
}