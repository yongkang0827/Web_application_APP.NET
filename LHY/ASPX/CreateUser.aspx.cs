using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.Security;

namespace test2.LHY.ASPX
{
    public partial class CreateUser : System.Web.UI.Page
    {
        // create connection -> sampleDB
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string CustomerID, ArtistID;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            GenerateId();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (ddlRole.SelectedValue.Equals("Customer"))
            {
                string strAdd = "INSERT INTO Customer VALUES(@ID, @name, @phone,@pass)";

                SqlCommand cmdAdd = new SqlCommand(strAdd, con);

                cmdAdd.Parameters.AddWithValue("@ID", CustomerID);

                cmdAdd.Parameters.AddWithValue("@name", txtUsername.Text);

                cmdAdd.Parameters.AddWithValue("@phone", txtPhone.Text);
                if (txtComfirmPassw.Text.Equals(txtPassw.Text))
                {
                    cmdAdd.Parameters.AddWithValue("@pass", txtPassw.Text);
                    string msg = "Register succesfully";
                    Response.Write("<script>alert('" + msg + "')</script>");
                    cmdAdd.ExecuteNonQuery();

                    Membership.CreateUser(txtUsername.Text, txtPassw.Text);
                    String[] strUser = new String[] { txtUsername.Text };
                    Roles.AddUsersToRole(strUser, "Customer");

                }
                else
                {
                    string msg = "Password does not match";
                    Response.Write("<script>alert('" + msg + "')</script>");
                    txtPassw.Text = "";
                    txtComfirmPassw.Text = "";

                }

            }
            else
            {
                string strAdd = "INSERT INTO Artist VALUES(@ID, @name, @phone,@pass)";

                SqlCommand cmdAdd = new SqlCommand(strAdd, con);

                cmdAdd.Parameters.AddWithValue("@ID", ArtistID);

                cmdAdd.Parameters.AddWithValue("@name", txtUsername.Text);

                cmdAdd.Parameters.AddWithValue("@phone", txtPhone.Text);

                if (txtComfirmPassw.Text.Equals(txtPassw.Text))
                {
                    cmdAdd.Parameters.AddWithValue("@pass", txtPassw.Text);
                    string msg = "Register succesfully";
                    Response.Write("<script>alert('" + msg + "')</script>");
                    cmdAdd.ExecuteNonQuery();

                    Membership.CreateUser(txtUsername.Text, txtPassw.Text);
                    String[] strUser = new String[] { txtUsername.Text };
                    Roles.AddUsersToRole(strUser, "Artist");
                    
                }
                else
                {
                    string msg = "Password does not match";
                    Response.Write("<script>alert('" + msg + "')</script>");
                    txtPassw.Text = "";
                    txtComfirmPassw.Text = "";

                }

            }
            con.Close();
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            if (ddlRole.SelectedValue.Equals("Customer"))
            {
                string strAdd = "Select * From Customer Where Username=@ID ";

                SqlCommand cmdAdd = new SqlCommand(strAdd, con);

                cmdAdd.Parameters.AddWithValue("@ID", txtUsername.Text);
                SqlDataReader dtrProd = cmdAdd.ExecuteReader();

                if (dtrProd.HasRows)
                {
                    string msg = "Username already exist";
                    Response.Write("<script>alert('" + msg + "')</script>");
                }

            }
            else
            {
                string strAdd = "Select * From Artist Where Username=@ID ";

                SqlCommand cmdAdd = new SqlCommand(strAdd, con);

                cmdAdd.Parameters.AddWithValue("@ID", txtUsername.Text);
                SqlDataReader dtrProd = cmdAdd.ExecuteReader();

                if (dtrProd.HasRows)
                {
                    string msg = "Username already exist";
                    Response.Write("<script>alert('" + msg + "')</script>");
                }
            }
        }
    

        private void GenerateId()
        {
            if (ddlRole.SelectedValue.Equals("Customer"))
            {
                SqlCommand cmdId = new SqlCommand("Select Count(CustID) FROM Customer", con);
                int i = Convert.ToInt32(cmdId.ExecuteScalar());
                i++;
                CustomerID = "CO" + i.ToString();
            }
            else
            {
                SqlCommand cmdId = new SqlCommand("Select Count(ArtistID) FROM Artist", con);
                int i = Convert.ToInt32(cmdId.ExecuteScalar());
                i++;
                ArtistID = "A0" + i.ToString();
            }
        }
    }
}