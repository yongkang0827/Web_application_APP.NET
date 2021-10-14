using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace test2.LMY.ASPX
{
    public partial class Insert : System.Web.UI.Page
    {
        // create connection -> sampleDB
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String history_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            GenerateId();
        }
        protected void Upload(object sender, EventArgs e)
        {
            byte[] bytes;
            BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream);

            bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);


            string sql = "INSERT INTO Favourite VALUES(@id, @cust, @name, @photo, @price)";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@id", history_id);
            cmd.Parameters.AddWithValue("@cust", TextBox1.Text);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            //cmd.Parameters.AddWithValue("@DateUpload", txtDate.Text);
            cmd.Parameters.AddWithValue("@photo", bytes);
            cmd.Parameters.AddWithValue("@price", TextBox2.Text);          

            cmd.ExecuteNonQuery();
            con.Close();
        }
        private void GenerateId()
        {
            SqlCommand cmdId = new SqlCommand("Select Count(FavouriteId) FROM Favourite", con);
            int i = Convert.ToInt32(cmdId.ExecuteScalar());
            i++;
            history_id = "FO" + i.ToString();
        }
    }
}