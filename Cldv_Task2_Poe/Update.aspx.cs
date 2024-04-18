using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cldv_Task2_Poe
{
    public partial class Update : System.Web.UI.Page
    {
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblStatus.Visible = false;
                LoadImage();

            }
           
        }
        private void LoadImage()
        {
            //Storing connection string 
            string conStore = "Data Source=DESKTOP-DIGA88O\\SQLEXPRESS;Initial Catalog=CldvTask2_POE;Integrated Security=True";

            //Use statment to use the connection string so that correct table can chosen 
            using (SqlConnection con = new SqlConnection(conStore))
            {

                //Selecting from the table in mySQL, and binding it to my gridview which displays
                SqlCommand cmd = new SqlCommand("Select * from itemDetail", con);
                con.Open();
                SqlDataReader gridDetail = cmd.ExecuteReader();
                GridView2.DataSource = gridDetail;
                GridView2.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //On the upload button this is to fetch the pictures from the users device and letting them be able to insert the picture 
            HttpPostedFile imageUpload = FileUpload1.PostedFile;
            string nameOfFile = Path.GetFileName(imageUpload.FileName);
            string fileType = Path.GetExtension(nameOfFile);
            int fileSize = imageUpload.ContentLength;

            if (fileType.ToLower() == ".jpg" || fileType.ToLower() == ".bmp" || fileType.ToLower() == ".gif" || fileType.ToLower() == ".png")
            {
                

                Stream streamReader = imageUpload.InputStream;
                BinaryReader binaryReader = new BinaryReader(streamReader);
                byte[] bytes = binaryReader.ReadBytes((int)streamReader.Length);

                //Storing my database connection string 
                
                SqlConnection con = new SqlConnection("Data Source=DESKTOP-DIGA88O\\SQLEXPRESS;Initial Catalog=CldvTask2_POE;Integrated Security=True");
                


                con.Open();
                SqlCommand IDType = new SqlCommand("Select itemID from itemDetail where itemID= @itemID");
                IDType.Connection = con;
                IDType.Parameters.AddWithValue("@itemID", int.Parse(idTxt.Text));
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(IDType);
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count == 0)
                {
                    lblStatus.Text = "You have not entered a correct ID";
                }
                else
                {

                    con.Open();
                    cmd = new SqlCommand("Update itemDetail  set  itemImage = @itemImage ,  itemName = @itemName ,  itemDescription = @itemDescription ,  itemPrice = @itemPrice  Where itemID = @itemID", con);
                    cmd.Parameters.AddWithValue("@itemID", idTxt.Text);
                    cmd.Parameters.AddWithValue("@itemImage", bytes);
                    cmd.Parameters.AddWithValue("@itemName", nameTxt.Text);
                    cmd.Parameters.AddWithValue("@itemDescription", descriptionTxt.Text);
                    cmd.Parameters.AddWithValue("@itemPrice", decimal.Parse(priceTxt.Text));
                    cmd.ExecuteNonQuery();
                    con.Close();
                   
                }

                LoadImage();

                }

            }
            
        }
    }


