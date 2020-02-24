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
    public partial class ViewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loggedIn"] == null) {
                Response.Redirect("/");
            }

            if (Request["userId"] != null) {

                using (SqlConnection con = new SqlConnection(login.conString)) {

                    SqlCommand cmd = new SqlCommand("SELECT full_name, email, address FROM users WHERE id = " + Request["userId"], con);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read()) {

                        lblUserName.Text = reader.GetString(0);
                        lblUserEmail.Text = reader.GetString(1);
                        lblUserAddress.Text = reader.GetString(2);

                    }

                }

            }

        }
    }
}