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
    public partial class AddRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
                Response.Redirect("/");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";

            if (IsPostBack)
            {
                SqlConnection con = new SqlConnection(login.conString);
                con.Open();
                String query = "INSERT INTO donations VALUES ( '"
                    + txtTitle.Text + "','"
                    + txtDesc.Text + "','"
                    + txtGoal.Text + "','"
                    + "UNCHECKED','" 
                    + Session["userId"].ToString() + "')";
                SqlCommand cmd = new SqlCommand(query, con);

                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblResult.Text = "Added Request.";
                    txtTitle.Text = "";
                    txtDesc.Text = "";
                    txtGoal.Text = "";
                }

                cmd.Dispose();
                con.Close();
            }
            else
            {
                Response.Redirect("/AddRequest.aspx");
            }
        }
    }
}