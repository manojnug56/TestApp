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
    public partial class WebForm1 : System.Web.UI.Page
    {
        //sql connection
        public static string cs = ConfigurationManager.ConnectionStrings["dbcon"].ToString();

        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        DataSet ds;
        private void clearFields()
        {
            inputName.Text = "";
            inputEmail.Text = "";
            inputPhone.Text = "";
            inputAdress.Text = "";
        }
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_customer WHERE email = '" + inputEmail.Text + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                int user_exits = (int)cmd.ExecuteScalar();

                if (user_exits > 0)
                {
                    //Show alert
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                }

                User cus = new User();

                cus.Name = inputName.Text;
                cus.Mail = inputEmail.Text;
                cus.Phone = inputPhone.Text;
                cus.Adress = inputAdress.Text;

                cus.saveCustomerDetails(cus);
                //Show alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                Load_Data();
                clearFields();
            }
        }

        protected void brn_clear_Click(object sender, EventArgs e)
        {
            clearFields();
        }

        public void Load_Data()
        {
            User gd = new User();
            dtg_cus.DataSource = gd.Load_data().Tables[0];

            //Bind the fetched data to gridview           
            dtg_cus.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            if (!Page.IsPostBack)
            {
                Load_Data();
            }
        }

        protected void dtg_cus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}