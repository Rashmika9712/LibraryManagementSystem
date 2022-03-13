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
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }

        //Add Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author Already Exist with this ID. You cannot add another Author with the same ID');</script>");
                clearForm();
            }
            else
            {
                addNewAuthor();
            }
        }

        //Update Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Textbox2.Text.Trim() == "")
            {
                Response.Write("<script>alert('Invalide Credentials');</script>");
            }
            else
            {
                if (checkIfAuthorExists())
                {
                    updateAuthor();
                }
                else
                {
                    Response.Write("<script>alert('Author does not exists!');</script>");
                }
            }
        }

        //Delete Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exists!');</script>");
            }
        }

        //user Defined function

        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id='"+Textbox1.Text.Trim()+"';", con);
                
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deteled Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name WHERE " +
                    "author_id='"+ Textbox1.Text.Trim()+ "';", con);
                cmd.Parameters.AddWithValue("@author_name", Textbox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewAuthor()
        {
            if (Textbox1.Text.Trim() == "" || Textbox2.Text.Trim() == "")
            {
                Response.Write("<script>alert('Invalide Credentials');</script>");
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

                    SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl (author_id,author_name) VALUES(@author_id,@author_name);", con);

                    cmd.Parameters.AddWithValue("@author_id", Textbox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_name", Textbox2.Text.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Author Added Successful');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = '" + Textbox1.Text.Trim() + "' ;", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Textbox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalide Author ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfAuthorExists()
        {            
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = '" + Textbox1.Text.Trim() + "' ;", con);

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
        }
    }
}