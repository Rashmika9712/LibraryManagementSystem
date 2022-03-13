using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace libraryManagementSystem
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            GridView1.DataBind();
        }

        //Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {            
            getBookByID();
        }

        //Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book already exists. try some other!');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        //Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }

        //Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
           deleteByID();
        }

        //Clear Button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            clearForm();
        }

        //User defined functions

        void deleteByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id='" + Textbox1.Text.Trim() + "';", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deteled Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalide Book Details!');</script>");
            }
        }

        void updateBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(Textbox7.Text.Trim());
                    int current_stock = Convert.ToInt32(Textbox8.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {
                        
                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual stock value cannot be less than the Issued books');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            Textbox7.Text = "" + current_stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory/inventory.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    if(filename=="" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;

                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name,genre=@genre," +
                        "author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language," +
                        "edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description," +
                        "actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link WHERE " +
                        "book_id='"+ Textbox1.Text.Trim()+"';", con);

                    cmd.Parameters.AddWithValue("@book_name", Textbox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@publish_date", Textbox3.Text.Trim());

                    cmd.Parameters.AddWithValue("@genre", genres);

                    cmd.Parameters.AddWithValue("@edition", Textbox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", Textbox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", Textbox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", Textbox10.Text.Trim());

                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());                    

                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Updated Successfully!');</script>");
                    getBookByID();
                    GridView1.DataBind();                   

                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalide Book Details!');</script>");
            }
        }

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/inventory.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id,book_name,genre,author_name,publisher_name," +
                    "publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock," +
                    "book_img_link) VALUES(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language," +
                    "@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link);", con);

                cmd.Parameters.AddWithValue("@book_id", Textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", Textbox2.Text.Trim());
                cmd.Parameters.AddWithValue("@publish_date", Textbox3.Text.Trim());

                cmd.Parameters.AddWithValue("@genre", genres);

                cmd.Parameters.AddWithValue("@edition", Textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", Textbox5.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", Textbox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", Textbox7.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", Textbox8.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", Textbox10.Text.Trim());

                cmd.Parameters.AddWithValue("@book_img_link", filepath);


                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added Successfully!');</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id ='" + Textbox1.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Textbox2.Text = dt.Rows[0][1].ToString();
                    Textbox3.Text = dt.Rows[0][5].ToString();
                    Textbox4.Text = dt.Rows[0][7].ToString();
                    Textbox5.Text = dt.Rows[0][8].ToString().Trim();
                    Textbox6.Text = dt.Rows[0][9].ToString().Trim();
                    Textbox7.Text = dt.Rows[0][11].ToString().Trim();
                    Textbox8.Text = dt.Rows[0][12].ToString().Trim();
                    Textbox10.Text = dt.Rows[0][10].ToString();

                    Textbox9.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalide Book ID');</script>");                    
                    clearForm();
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id ='" + Textbox1.Text.Trim() + "' " +
                    "OR book_name='" + Textbox2.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>aleart('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearForm()
        {
            Textbox1.Text = "";
            Textbox2.Text = "";
            Textbox3.Text = "";
            Textbox4.Text = "";
            Textbox5.Text = "";
            Textbox6.Text = "";
            Textbox7.Text = "";
            Textbox8.Text = "";
            Textbox9.Text = "";
            Textbox10.Text = "";

            DropDownList1.SelectedValue = "Select";

            for (int j = 0; j < ListBox1.Items.Count; j++)
            {
                ListBox1.Items[j].Selected = false;
            }
        }
    }
}