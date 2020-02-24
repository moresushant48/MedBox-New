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
    public partial class ViewRequests : System.Web.UI.Page
    {

        private void feedApprovedDonations()
        {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM donations WHERE status = 'APPROVED'", con);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                feedApprovedDonations();

            }

            if (Request["donId"] != null) {

                MultiView1.ActiveViewIndex = 1;

            }

            
        }

        protected void btnDonate_Click(object sender, EventArgs e)
        {
            /*switch (cblPaymentOptions.SelectedValue)
            {

                case "1":
                    Response.Redirect("https://paytm.com/");
                    break;

                case "2":
                    Response.Redirect("https://www.paypal.com/in/home");
                    break;

            }*/

            result.Text = "This might take some time.";
            System.Threading.Thread.Sleep(2000);
            result.Text = "Donation Successful.";
        }
    }
}