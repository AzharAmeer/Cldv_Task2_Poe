using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Cldv_Task2_Poe
{
    public partial class Insert : System.Web.UI.Page
    {
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
                string conStore = "Data Source=DESKTOP-DIGA88O\\SQLEXPRESS;Initial Catalog=CldvTask2_POE;Integrated Security=True";


                //This use statement is to fetch what is in my stored procedure i made in mySQL
                using (SqlConnection con = new SqlConnection(conStore))
                {
                    //Fetching my procedure table that is called uploadingPics
                    SqlCommand cmd = new SqlCommand("uploadingPics", con);
                    cmd.CommandType = CommandType.StoredProcedure;


                    //Fetching my variables that is stored in my procedure 
                    SqlParameter ImagePic = new SqlParameter()
                    {
                        ParameterName = "@itemImage",
                        Value = bytes
                    };
                    cmd.Parameters.Add(ImagePic);

                    SqlParameter NameProd = new SqlParameter()
                    {
                        ParameterName = "@itemName",
                        Value = nameTxt.Text
                    };
                    cmd.Parameters.Add(NameProd);

                    SqlParameter DescriptionProd = new SqlParameter()
                    {
                        ParameterName = "@itemDescription",
                        Value = descriptionTxt.Text
                    };
                    cmd.Parameters.Add(DescriptionProd);

                    SqlParameter PriceProd = new SqlParameter()
                    {
                        ParameterName = "@itemPrice",
                        Value = decimal.Parse(priceTxt.Text)
                    };
                    cmd.Parameters.Add(PriceProd);

                    SqlParameter IDProd = new SqlParameter()
                    {
                        ParameterName = "@itemID",
                        Value = -1,
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(IDProd);


                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();


                    //This is to inform the user that the inserts was successful
                    lblStatus.Visible = true;
                    lblStatus.Text = "Your insert has been processed ! ";
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                   

                    LoadImage();
                    


                }




            }
            else
            {
                //If you just press on insert it will then notify you that you need to fill in everything 
                lblStatus.Visible = true;
                lblStatus.Text = "Please fill in all the boxes ";
                lblStatus.ForeColor = System.Drawing.Color.Red;
           
            }
        }
           
        
        }
    }
