using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace libraryManagementSystem
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPublisherByID();
        }

        //Add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher Already Exist with this ID. You cannot add another Publisher with the same ID');</script>");
                clearForm();
            }
            else
            {
                addNewPublisher();
            }
        }

        //Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Textbox2.Text.Trim() == "")
            {
                Response.Write("<script>alert('Invalide Credentials');</script>");
            }
            else
            {
                if (checkIfPublisherExists())
                {
                    updatePublisher();
                }
                else
                {
                    Response.Write("<script>alert('Publisher does not exists');</script>");
                    clearForm();
                }
            }
        }

        //DeleteButton
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exists!');</script>");
            }
        }

        //user defined functions

        void deletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE publisher_master_tbl WHERE publisher_id= '" + Textbox1.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@publisher_name " +
                    "WHERE publisher_id= '" + Textbox1.Text.Trim() + "';", con);

                cmd.Parameters.AddWithValue("@publisher_name", Textbox2.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void addNewPublisher()
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

                    SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl (publisher_id,publisher_name) " +
                        "VALUES(@publisher_id,@publisher_name);", con);

                    cmd.Parameters.AddWithValue("@publisher_id", Textbox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@publisher_name", Textbox2.Text.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Publisher Added Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void getPublisherByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id = '" + Textbox1.Text.Trim() + "' ;", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Textbox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalide Publisher ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id = '" + Textbox1.Text.Trim() + "' ;", con);

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