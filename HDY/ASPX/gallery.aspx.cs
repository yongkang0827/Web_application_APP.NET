using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace test2.HDY.ASPX
{
    public partial class gallery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String favourite_id;
        String order_id;
        string custname, title, price;
        string CustomerName;
        byte[] img;
        String details_id;
        string quantity;
             

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCustomerName();
            con.Open();
            GenerateId();
            GenerateOrderId();
            GenerateDetailsId();
            if (!this.IsPostBack)
            {
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Img", con);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            DataRowView dr = (DataRowView)e.Item.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["ImgUpload"]);
            (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
        }



        private void GenerateId()
        {
            SqlCommand cmdId = new SqlCommand("Select Count(FavouriteId) FROM Favourite", con);
            int i = Convert.ToInt32(cmdId.ExecuteScalar());
            i++;
            favourite_id = "FO" + i.ToString();
        }

        private void GenerateOrderId()
        {

            SqlCommand cmdId = new SqlCommand("Select Count(OrderId) FROM [Order]", con);
            int i = Convert.ToInt32(cmdId.ExecuteScalar());
            i++;
            order_id = "O" + i.ToString();
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

        protected void Add_ItemCommand(object source, DataListCommandEventArgs e)
        {
 
               
            string imgName;
            string id;
            if (e.CommandName == "Addfavourite")
            {
                imgName = e.CommandArgument.ToString();
                String sdi = "SELECT * FROM Img WHERE Title=@title";
                SqlCommand cmdAdd = new SqlCommand(sdi, con);

                cmdAdd.Parameters.AddWithValue("@title", imgName);
                SqlDataReader dtrProd = cmdAdd.ExecuteReader();

                if (dtrProd.HasRows)
                {
                    while (dtrProd.Read())
                    {
                        custname = dtrProd["PostId"].ToString();
                        title = dtrProd["Title"].ToString();
                        price = dtrProd["Price"].ToString();

                        img = (byte[])(dtrProd["ImgUpload"]);

                    }
                    con.Close();
                    

                    if (HaveFavouriteRow())
                    {
                        con.Open();
                        title = e.CommandArgument.ToString();
                        string add = "INSERT INTO Favourite VALUES (@name, @photo, @price, @CustName)";
                        SqlCommand favourite = new SqlCommand(add, con);


                        favourite.Parameters.AddWithValue("@name", title);
                        favourite.Parameters.AddWithValue("@photo", img);
                        favourite.Parameters.AddWithValue("@price", price);
                        favourite.Parameters.AddWithValue("@CustName", CustomerName);

                        favourite.ExecuteNonQuery();
                        con.Close();
                    }

                }
            }
            else if (e.CommandName == "Details")
            {
                string strAdd = "Delete From Details";
                SqlCommand cmdDelete = new SqlCommand(strAdd, con);

                cmdDelete.ExecuteNonQuery();
                con.Close();
                con.Open();
                imgName = e.CommandArgument.ToString();

                String sdi = "SELECT * FROM Img WHERE Title=@title";
                SqlCommand cmdAdd = new SqlCommand(sdi, con);

                cmdAdd.Parameters.AddWithValue("@title", imgName);
                SqlDataReader dtrProd = cmdAdd.ExecuteReader();

                if (dtrProd.HasRows)
                {
                    while (dtrProd.Read())
                    {
                        custname = dtrProd["PostId"].ToString();
                        title = dtrProd["Title"].ToString();
                        price = dtrProd["Price"].ToString();
                        quantity = dtrProd["Quantity"].ToString();

                        img = (byte[])(dtrProd["ImgUpload"]);

                    }

                    con.Close();
                    con.Open();

                    string add = "INSERT INTO [Details] VALUES (@id, @cust, @name, @photo, @price, @quant, @CustName)";
                    SqlCommand details = new SqlCommand(add, con);

                    details.Parameters.AddWithValue("@id", details_id);
                    details.Parameters.AddWithValue("@cust", custname);
                    details.Parameters.AddWithValue("@name", title);
                    details.Parameters.AddWithValue("@photo", img);
                    details.Parameters.AddWithValue("@price", price);
                    details.Parameters.AddWithValue("@quant", quantity);
                    details.Parameters.AddWithValue("@CustName", CustomerName);
                   
                   // details.Parameters.AddWithValue("@imgId", imgName);

                    details.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/CWK/ASPX/Details.aspx");
                }
            }
        }

        public Boolean HaveFavouriteRow()
        {
            //Checking
            con.Open();

            SqlCommand check = new SqlCommand("SELECT * FROM Favourite WHERE CustName=@Cust AND ImageName=@img", con);

            check.Parameters.AddWithValue("@Cust", CustomerName);
            check.Parameters.AddWithValue("@img", title);
            SqlDataReader dtr = check.ExecuteReader();

            if (dtr.HasRows)
            {
                con.Close();
                return false;
            }

            con.Close();
            return true;
        }


        public void AddDetails(string Detid)
        {
            string strAdd = "Delete From Details";
            SqlCommand cmdAdd = new SqlCommand(strAdd, con);

            cmdAdd.ExecuteNonQuery();
            con.Close();
            con.Open();

            SqlCommand sdi = new SqlCommand("SELECT * FROM Img WHERE PostId=@PostId", con);
            String id = Detid;
            sdi.Parameters.AddWithValue("@PostId", id);
            SqlDataReader dtrProd = sdi.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    custname = dtrProd["PostId"].ToString();
                    title = dtrProd["Title"].ToString();
                    price = dtrProd["Price"].ToString();
                    
                    img = (byte[])(dtrProd["ImgUpload"]);

                }

                con.Close();
                con.Open();

                string add = "INSERT INTO [Details] VALUES (@id, @cust, @name, @photo, @price, @CustName, @imgId)";
                SqlCommand details = new SqlCommand(add, con);

                details.Parameters.AddWithValue("@id", details_id);
                details.Parameters.AddWithValue("@cust", custname);
                details.Parameters.AddWithValue("@name", title);
                details.Parameters.AddWithValue("@photo", img);
                details.Parameters.AddWithValue("@price", price);
                details.Parameters.AddWithValue("@CustName", CustomerName);
                details.Parameters.AddWithValue("@imgId", Detid);

                details.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/CWK/ASPX/Details.aspx");

            }
        }
        private void GenerateDetailsId()
        {
            SqlCommand cmdId = new SqlCommand("Select Count(DetailsId) FROM Details", con);
            int i = Convert.ToInt32(cmdId.ExecuteScalar());
            i++;
            details_id = "PO" + i.ToString();
        }
    }
}