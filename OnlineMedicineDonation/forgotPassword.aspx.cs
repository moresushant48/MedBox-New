using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OnlineMedicineDonation
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
                Response.Redirect("/");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                
                SqlConnection con = new SqlConnection(login.conString);
                con.Open();

                String query = "SELECT email FROM users WHERE email = '" + txtEmail.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader reader = cmd.ExecuteReader();


                if (reader.Read())
                {
                    lblResult.Text = "Credentials are sent to your email.";
                }
                else {
                    lblResult.Text = "No such Account exists.";
                }

                reader.Close();
                con.Close();
            }
        }
    }
}