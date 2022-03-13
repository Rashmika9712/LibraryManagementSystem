using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace libraryManagementSystem
{
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookAndMemberByID();
        }

        //Issue
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists() && checkIfMemberExists())
            {
                if (checkIfIssueEntryExists())
                {
                    clearForm();
                    Response.Write("<script>alert('This member already has this book');</script>");
                }
                else
                {
                    if (Textbox3.Text.Trim() == "" || Textbox4.Text.Trim() == "")
                    {
                        getBookAndMemberByID();
                    }
                    issueBooks();
                }

            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        //Return
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists() && checkIfMemberExists())
            {
                returnBook();
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        //User defined functions

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE member_id='" + Textbox1.Text.Trim() + "' " +
                    "AND book_id = '" + Textbox2.Text.Trim() + "';", con);

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {

                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock=current_stock+1 WHERE " +
                        "book_id='" + Textbox2.Text.Trim() + "';", con);

                    cmd.ExecuteNonQuery();

                    con.Close();
                    Response.Write("<script>alert('Return Successfuly!');</script>");
                    GridView1.DataBind();
                    clearForm();
                }
                else
                {
                    Response.Write("<script>alert('Error - Invalid details!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void issueBooks()
        {
            if (Textbox5.Text.Trim() == "" && Textbox6.Text.Trim() == "")
            {
                Response.Write("<script>alert('Invalid Details!');</script>");

            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date," +
                        "due_date) VALUES (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)", con);

                    cmd.Parameters.AddWithValue("@member_id", Textbox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_name", Textbox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", Textbox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", Textbox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@issue_date", Textbox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@due_date", Textbox6.Text.Trim());

                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock=current_stock-1 WHERE " +
                        "book_id='" + Textbox2.Text.Trim() + "';", con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                    Response.Write("<script>alert('Book Issued Successfully!');</script>");
                    GridView1.DataBind();
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        bool checkIfIssueEntryExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE book_id ='" + Textbox2.Text.Trim() + "' " +
                    "AND member_id = '" + Textbox1.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else { return false; }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void getBookAndMemberByID()
        {
            if (Textbox1.Text.Trim() == "" || Textbox2.Text.Trim() == "")
            {
                Response.Write("<script>alert('Invalide Credentials!');</script>");
                clearForm();
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id ='" + Textbox2.Text.Trim() + "';", con);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        Textbox4.Text = dt.Rows[0]["book_name"].ToString();

                    }
                    else
                    {
                        Response.Write("<script>alert('Book ID is wrong');</script>");
                    }

                    cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id ='" + Textbox1.Text.Trim() + "';", con);

                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();

                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        Textbox3.Text = dt.Rows[0]["full_name"].ToString();

                    }
                    else
                    {
                        Response.Write("<script>alert('Member ID is Wrong');</script>");

                        clearForm();
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

        }

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl " +
                    "WHERE member_id ='" + Textbox1.Text.Trim() + "';", con);

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

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id ='" + Textbox2.Text.Trim() + "' " +
                    "AND current_stock > 0;", con);

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
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            clearForm();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;

                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}