using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineMedicineDonation
{
    public partial class login : System.Web.UI.Page
    {
        public static String conString = "Data Source=.;Initial Catalog=medbox;Integrated Security=True";
        private SqlConnection con;
        private SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(conString);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            String existsLogin = "SELECT * FROM users WHERE email = '" + txtEmail.Text + "' AND password = '"+ txtPassword.Text +"'";
            cmd = new SqlCommand(existsLogin, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                result.Text = "Logged In Successfully.";

                Session["loggedIn"] = "true";
                Session["userId"] = reader.GetInt32(0);
                Session["userEmail"] = reader.GetString(2);

                if (Request["orderId"] != null)
                {
                    Response.Redirect("/viewMedicine.aspx?medId=" + Request["orderId"]);
                }
                else
                {
                    Response.Redirect("/Default.aspx");
                }
            }
            else {
                result.Text = "Wrong credentials.";
            }

            reader.Close();
            con.Close();
        }
    }
}