using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OnlineMedicineDonation
{
    public partial class viewMedicine : System.Web.UI.Page
    {

        int actualQuantity;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                MultiView1.ActiveViewIndex = 0;
                
            }

            lblIsNotLoggedIn.Text = "";

            if(Session["loggedIn"] == null)
            {
                lblIsNotLoggedIn.Text = "You will be redirected to login once you proceed.";
            }

            if (Request["medId"] != null)
            {

                using (SqlConnection con = new SqlConnection(login.conString))
                {

                    con.Open();

                    String query = "SELECT * FROM meds WHERE id = '" + Request["medId"].Trim() + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read()) {

                        actualQuantity = reader.GetInt32(3);

                        lblMedName.Text = reader.GetString(1);
                        lblMedDesc.Text = reader.GetString(2);
                        lblMedQuantity.Text = reader.GetInt32(3).ToString() + " Qty.";
                        RangeValidator1.MaximumValue = reader.GetInt32(3).ToString();

                    }
                    cmd.Dispose();
                    reader.Close();
                    con.Close();

                }
            }
            else {
                Response.Redirect("/");
            }
        }

        // Show user info for confirmation.

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (RangeValidator1.IsValid && RequiredFieldValidator1.IsValid)
            {
                MultiView1.ActiveViewIndex = 1;

                if (Session["loggedIn"] != null)
                {

                    using (SqlConnection con = new SqlConnection(login.conString))
                    {
                        con.Open();

                        String query = "SELECT id, full_name, email, address FROM users WHERE id = '" + Session["userId"].ToString().Trim() + "'";

                        SqlCommand cmd = new SqlCommand(query, con);

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {

                            userName.Text = reader.GetString(1);
                            userEmail.Text = reader.GetString(2);
                            userAddress.Text = reader.GetString(3);

                        }
                        cmd.Dispose();
                        reader.Close();
                        con.Close();

                    }
                }
                else {
                    Response.Redirect("/login.aspx?orderId=" + Request["medId"]);
                }

            }
        }

        // Placing the order.

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (IsPostBack) {
            
                //Reduce quantity.
                using (SqlConnection con = new SqlConnection(login.conString)) {

                    con.Open();

                    String query = "UPDATE meds SET med_quantity = '" + (actualQuantity - Int32.Parse(txtEnteredQuantity.Text)) + "' WHERE id = '" + Request["medId"].Trim() + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    if (cmd.ExecuteNonQuery() == 1) {

                        lblSuccessResult.Text = "Your order has been placed. Meds will be delivered to you within 24 hrs.";
                    
                    

                    }

                }
            }
        }
    }
}