using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test2
{
    public partial class Artist1 : System.Web.UI.MasterPage
    {
        String name;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Open Database
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string strAdd = "Select * From Login where Id=@ID";
            SqlCommand cmdAdd = new SqlCommand(strAdd, con);

            //Find ID
            SqlCommand cmdId = new SqlCommand("Select Count(Id) FROM Login", con);
            int abc = Convert.ToInt32(cmdId.ExecuteScalar());

            //Enter Search
            cmdAdd.Parameters.AddWithValue("@ID", abc);
            SqlDataReader dtrProd = cmdAdd.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    name = dtrProd["CustOrArt"].ToString();
                    //Transfer data to header
                    lblCustOrArt.Text = dtrProd["CustOrArt"].ToString() + " : ";
                    lblName.Text = dtrProd["Username"].ToString();
                }
            }
            con.Close();
        }
    }
}