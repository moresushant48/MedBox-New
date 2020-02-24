using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.Linq;
using System.IO;

namespace OnlineMedicineDonation
{
    public partial class adminPanel : System.Web.UI.Page
    {

        private void feedUsers() {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM users ORDER BY id DESC", con);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();

                sqlDataAdapter.Dispose();
                con.Close();

            }
        }

        private void feedDonationRequest()
        {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM donations ORDER BY id DESC", con);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                GridView2.DataSource = dataTable;
                GridView2.DataBind();

                sqlDataAdapter.Dispose();
                con.Close();

            }
        }

        private void feedMedicineRequest()
        {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM meds ORDER BY id DESC", con);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                GridView3.DataSource = dataTable;
                GridView3.DataBind();

                sqlDataAdapter.Dispose();
                con.Close();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"].ToString() != 1.ToString())
                Response.Redirect("/");

            if (Request["deleteUser"] != null) {

                using (SqlConnection con = new SqlConnection(login.conString))
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand(" DELETE FROM users WHERE id = " + Request["deleteUser"].Trim(), con);

                    cmd.ExecuteNonQuery();
                    con.Close();

                }

            }

            if (Request["approveDon"] != null || Request["denyDon"] != null || Request["approveMed"] != null || Request["denyMed"] != null)
            { 

                if (Request["approveDon"] != null)
                {

                    using (SqlConnection con = new SqlConnection(login.conString))
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand(" UPDATE donations SET status = 'APPROVED' WHERE id = " + Request["approveDon"].Trim(), con);

                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    MultiView1.ActiveViewIndex = 1;
                    feedDonationRequest();
                }

                if (Request["denyDon"] != null)
                {

                    using (SqlConnection con = new SqlConnection(login.conString))
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE donations SET status = 'DENIED' WHERE id = " + Request["denyDon"].Trim(), con);

                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    MultiView1.ActiveViewIndex = 1;
                    feedDonationRequest();

                }

                if (Request["approveMed"] != null)
                {

                    using (SqlConnection con = new SqlConnection(login.conString))
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand(" UPDATE meds SET status = 'APPROVED' WHERE id = " + Request["approveMed"].Trim(), con);

                        cmd.ExecuteNonQuery();
                        con.Close();

                    }

                    MultiView1.ActiveViewIndex = 2;
                    feedMedicineRequest();

                }

                if (Request["denyMed"] != null)
                {

                    using (SqlConnection con = new SqlConnection(login.conString))
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE meds SET status = 'DENIED' WHERE id = " + Request["denyMed"].Trim(), con);

                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    MultiView1.ActiveViewIndex = 2;
                    feedMedicineRequest();

                }

            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                feedUsers();
            }
        }

        protected void btnViewCustomer_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            feedUsers();

        }

        protected void btnDonRequests_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            feedDonationRequest();
        }

        protected void btnMedRequests_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            feedMedicineRequest();
        }

        protected void btnDisasters_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(login.conString))
            {

                if (imgUpload.HasFile) {

                    String fileName = imgUpload.FileName.ToString().Trim();
                    imgUpload.PostedFile.SaveAs(Server.MapPath("~/uploads/") + fileName);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO disasters VALUES(" +
                        "'" + txtDisasterName.Text + "'," +
                        "'" + txtDisasterDesc.Text + "'," +
                        "'" + txtDisasterUrl.Text + "'," +
                        "'" + fileName + "'," +
                        Session["userId"] + ")", con);

                    if (cmd.ExecuteNonQuery() > 0) {

                        result.Text = "Successfully added.";
                        cmd.Dispose();

                    }
                }

                SqlCommand newcmd = new SqlCommand("SELECT * FROM disasters", con);
                SqlDataReader reader = newcmd.ExecuteReader();

                XmlWriter xmlWriter = XmlWriter.Create(Server.MapPath("~/Ads.xml"));
                xmlWriter.WriteStartDocument();
                xmlWriter.WriteStartElement("Advertisements");

                while (reader.Read())

                {

                    xmlWriter.WriteStartElement("Ad");

                    xmlWriter.WriteElementString("ImageUrl", "~/uploads/" + reader[4].ToString());

                    xmlWriter.WriteElementString("NavigateUrl", reader[3].ToString());

                    xmlWriter.WriteElementString("AlternateText", reader[1].ToString());

                    xmlWriter.WriteEndElement();

                }

                xmlWriter.WriteEndElement();
                xmlWriter.WriteEndDocument();
                xmlWriter.Close();

            }

        }

        
    }
}