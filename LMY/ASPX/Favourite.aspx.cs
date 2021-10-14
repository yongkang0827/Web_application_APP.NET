using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test2.LMY.ASPX
{
    public partial class Favourite : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string CustomerName;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCustomerName();
            con.Open();
            if (!IsPostBack)
            {                
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Favourite WHERE CustName = @filter", con);

                string filter = CustomerName;
                sda.SelectCommand.Parameters.AddWithValue("@filter", CustomerName);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                dlFavourite.DataSource = dt;
                dlFavourite.DataBind();
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (!IsPostBack)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Image"]);
                (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
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

        protected void dlFavourite_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string imgName;

            if (e.CommandName == "Unfavourite")
            {
                imgName = e.CommandArgument.ToString();
                

                string strAdd = "Delete From Favourite WHERE CustName=@custName and ImageName=@imgName";
                SqlCommand cmdAdd = new SqlCommand(strAdd, con);

                cmdAdd.Parameters.AddWithValue("@custName", CustomerName);
                cmdAdd.Parameters.AddWithValue("@imgName", imgName);

                cmdAdd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}