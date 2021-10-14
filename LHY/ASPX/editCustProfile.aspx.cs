using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace test2.LHY.ASPX
{
    public partial class editCustProfile : System.Web.UI.Page
    {
        // create connection -> sampleDB
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string CustomerName, userId, password;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCustomerName();
            confirm();
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (txtPassw.Text.Equals(txtComfirmPassw.Text))
            {
                con.Open();
                string strSelect = "Select * From Customer where Username=@name";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                //Enter Search
                cmdSelect.Parameters.AddWithValue("@name", CustomerName);
                SqlDataReader dtrProd = cmdSelect.ExecuteReader();

                if (dtrProd.HasRows)
                {
                    while (dtrProd.Read())
                    {
                        userId = dtrProd["CustID"].ToString();
                    }
                }
                con.Close();

                con.Open();
                string strAdd = "Update Customer Set Username = @newname, Phone = @phone, Password = @passw Where CustID=@oldid";
                SqlCommand cmdAdd = new SqlCommand(strAdd, con);

                cmdAdd.Parameters.AddWithValue("@oldid", userId);
                cmdAdd.Parameters.AddWithValue("@newname", txtUsername.Text.ToString());
                cmdAdd.Parameters.AddWithValue("@phone", txtPhone.Text.ToString());
                cmdAdd.Parameters.AddWithValue("@passw", txtPassw.Text.ToString());


                cmdAdd.ExecuteNonQuery();
                con.Close();


                string msg = "Update Successfully \n Username : " + txtUsername.Text.ToString();
                Response.Write("<script>alert('" + msg + "')</script>");
            }
            else
            {
                string msg = "Please enter password with confirm password same";
                Response.Write("<script>alert('" + msg + "')</script>");
            }
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

        protected void confirm()
        {
            con.Open();
            string strSelect = "Select * From Customer where Username=@name";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            //Enter Search
            cmdSelect.Parameters.AddWithValue("@name", CustomerName);
            SqlDataReader dtrProd = cmdSelect.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    password = dtrProd["Password"].ToString();
                }
            }
            con.Close();
        }
    }
}