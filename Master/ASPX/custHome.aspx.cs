using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace test2
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                slideShow();


            }
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
                    //Transfer data to header
                    Label1.Text = dtrProd["Username"].ToString();
                }
            }
            con.Close();
            ListBox1.DataSource = Roles.GetUsersInRole("Artist");
            ListBox1.DataBind();
            ListBox2.DataSource = Roles.GetUsersInRole("Customer");
            ListBox2.DataBind();

        }
        public void slideShow()
        {
            Random random = new Random();
            int i = random.Next(1, 5);
            Image1.ImageUrl = "../IMG/" + i.ToString() + ".jpg";

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            slideShow();
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
