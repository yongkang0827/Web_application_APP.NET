using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test2.TYK
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String ArtistName;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetArtistName();
            con.Open();
            if (!this.IsPostBack)
            {
                String query = "SELECT * FROM Img WHERE ArtistName LIKE'" + ArtistName + "%'";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);


                DataTable dt = new DataTable();
                sda.Fill(dt);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }

        }

        protected void GetArtistName()
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
                    ArtistName = dtrProd["Username"].ToString();
                }
            }
            con.Close();
        
        }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            
 //           if (e.Item.ItemType == ListItemType.Item)
 //          {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["ImgUpload"]);
                (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
 //           }
        }

    }
}