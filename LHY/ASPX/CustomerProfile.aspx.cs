using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace test2.LHY.ASPX
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string CustomerName;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCustomerName();

            con.Open();
            string strAdd = "Select * From Customer where Username=@name";
            SqlCommand cmdAdd = new SqlCommand(strAdd, con);

            //Enter Search
            cmdAdd.Parameters.AddWithValue("@name", CustomerName);
            SqlDataReader dtrProd = cmdAdd.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    lblUsernameAns.Text = dtrProd["Username"].ToString();
                    lblPhoneAns.Text = dtrProd["Phone"].ToString();
                }
            }
            con.Close();
        }

        protected void GetCustomerName()
        {
            ////Get Now is who webpage
            con.Open();
            string strAdd = "Select * From Login where Id=@ID";
            SqlCommand cmdAdd = new SqlCommand(strAdd, con);

            //Find ID
            SqlCommand cmdId = new SqlCommand("Select Count(Id) FROM Login", con);
            int numLogin = Convert.ToInt32(cmdId.ExecuteScalar());

            //Enter Search
            cmdAdd.Parameters.AddWithValue("@ID", numLogin);
            SqlDataReader dtrProd = cmdAdd.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    CustomerName = dtrProd["Username"].ToString();
                }
            }
            con.Close();
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LHY/ASPX/editCustProfile.aspx");
        }
    }
}