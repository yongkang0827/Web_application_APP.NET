using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace test2.LMY.ASPX
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM OrderList", conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
                    }
                }
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Image"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvImages.Rows)
            {
                CheckBox status = (row.Cells[5].FindControl("Checkbox1") as CheckBox);
                TextBox quantity = (row.Cells[4].FindControl("TextBox1") as TextBox);
                string orderID = row.Cells[0].Text;
                if(status.Checked)
                {
                    String quant = quantity.Text;
                    updateRowSource(orderID, quant, "true");
                }
                else
                {
                    String quant = "0";
                    updateRowSource(orderID, quant, "false");
                }
            }
            Response.Redirect("~/LMY/ASPX/MakePayment.aspx");
        }

        private void updateRowSource(String orderID, String quantity, String markStatus)
        {
            con.Open();
            string strAdd = "Update OrderList Set Buy=@status, Quantity=@quant Where OrderID=@buy";
            SqlCommand cmdAdd = new SqlCommand(strAdd, con);

            cmdAdd.Parameters.AddWithValue("@status", markStatus);
            cmdAdd.Parameters.AddWithValue("@quant", quantity);
            cmdAdd.Parameters.AddWithValue("@buy", orderID);

            cmdAdd.ExecuteNonQuery();
            con.Close();
        }

        
    }
}