using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows.Forms;

namespace Perituza
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //sql connection
        public static string cs = ConfigurationManager.ConnectionStrings["dbcon"].ToString();

        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void btn_login_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    con.Open();
                    cmd = new SqlCommand("sp_Login", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId", txt_email.Text);
                    cmd.Parameters.AddWithValue("@password", txt_password.Text);
                    cmd.ExecuteNonQuery();

                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        Session["id"] = dt.Rows[0][1].ToString();
                        Response.Redirect("~/Customer.aspx");
                    }

                    else
                    {
                        //Show alert
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
                    }
                }

                catch (SqlException ex)
                {
                    System.Windows.Forms.MessageBox.Show(ex.Message);
                }
                con.Close();
            }
        }
    }
}