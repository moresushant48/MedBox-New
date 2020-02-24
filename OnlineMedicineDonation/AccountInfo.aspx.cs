using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OnlineMedicineDonation
{
    public partial class AccountInfo : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null)
            {
                Response.Redirect("/");
            }
            else {
                if (!IsPostBack)
                {
                    viewPasswordInput.Visible = false;

                    SqlConnection con;
                    SqlCommand cmd;
                    SqlDataReader dataReader;

                    con = new SqlConnection(login.conString);
                    con.Open();
                    String existsLogin = "SELECT * FROM users WHERE id = '" + Session["userId"].ToString() + "'";
                    cmd = new SqlCommand(existsLogin, con);


                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        userName.Text = reader.GetString(1);
                        userEmail.Text = reader.GetString(2);
                        userAddress.Text = reader.GetString(3);
                    }
                    reader.Close();
                    con.Close();
                }
            }
        
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            viewPasswordInput.Visible = true;
        }

        protected void btnSubmitNewPassword_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text.Trim() != "") {

                SqlConnection con;
                SqlCommand cmd;
                SqlDataReader dataReader;

                con = new SqlConnection(login.conString);
                con.Open();
                String updatePass = "UPDATE users SET password = '" + txtNewPass.Text.Trim() + "' WHERE id = '" + Session["userId"].ToString() + "'";
                cmd = new SqlCommand(updatePass, con);

                if (cmd.ExecuteNonQuery() == 1) {
                    Response.Redirect("/AccountInfo");
                    lblResult.Text = "Password Changed Successfully.";
                }

            }
        }

        protected void btnChangeAddress_Click(object sender, EventArgs e)
        {
            viewAddressInput.Visible = true;
        }

        protected void btnSubmitNewAddress_Click(object sender, EventArgs e)
        {
            if (txtNewAddress.Text.Trim() != "")
            {

                SqlConnection con;
                SqlCommand cmd;
                SqlDataReader dataReader;

                con = new SqlConnection(login.conString);
                con.Open();
                String updateAddress = "UPDATE users SET address = '" + txtNewAddress.Text.Trim() + "' WHERE id = '" + Session["userId"].ToString() + "'";
                cmd = new SqlCommand(updateAddress, con);

                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Redirect("/AccountInfo");
                    lblResult.Text = "Address Changed Successfully.";
                }

            }
        }
    }
}