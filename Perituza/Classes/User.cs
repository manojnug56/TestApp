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
    public class User
    {
        //sql connection
        public static string cs = ConfigurationManager.ConnectionStrings["dbcon"].ToString();

        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        DataSet ds;
        public string id { get; set; }
        public string password { get; set; }
        public string Name { get; set; } 
        public string Mail { get; set; } 
        public string Phone { get; set; } 
        public string Adress { get; set; } 

        public void saveCustomerDetails(User cus)
        {
            using (SqlConnection con = new SqlConnection(cs))
                try
                {
                    con.Open();
                    cmd = new SqlCommand("sp_insertCus", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Mail", Mail);
                    cmd.Parameters.AddWithValue("@Phone", Phone);
                    cmd.Parameters.AddWithValue("@Address", Adress);
                    cmd.ExecuteNonQuery();
                }

                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }

                finally
                {
                    con.Close();
                }

        }

        public DataSet Load_data()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("sp_loadData", con);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                return ds;
            }
        }
    }
}