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
    public partial class register : System.Web.UI.Page
    {
        private SqlConnection con;
        private SqlCommand cmd;
        private int USER_ROLE_ID = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            String conString = "Data Source=.;Initial Catalog=medbox;Integrated Security=True";
            con = new SqlConnection(conString);

            con.Open();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            String exists = "SELECT * FROM users WHERE email = '" + txtEmail.Text + "'";
            cmd = new SqlCommand(exists, con);

            SqlDataReader reader = cmd.ExecuteReader();
            
            if (reader.Read()) {

                result.Text = "Email is already registered."; 
            }else {
                reader.Close();

                // if email is not registered already then create an account.
                String query = "INSERT INTO users VALUES('" +
                txtFullName.Text + "','" +
                txtEmail.Text + "','" +
                txtAddress.Text + "','" +
                txtPassword.Text + "'," +
                USER_ROLE_ID + ")";

                cmd = new SqlCommand(query, con);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    result.Text = "Registered Successfully. Please Login.";
                    txtFullName.Text = "";
                    txtEmail.Text = "";
                    txtAddress.Text = "";
                    txtPassword.Text = "";
                }
            }
            
            con.Close();

        }
    }
}