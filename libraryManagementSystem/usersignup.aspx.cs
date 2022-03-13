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
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Sign Up button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member Already Exist with this member ID, " +
                    "try other ID');</script>");
            }
            else
            {
                signUpNewUser();                
            }
        }

        //user defined functions
        void signUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl" +
                    "(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) " +
                    "values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)",
                    con);

                cmd.Parameters.AddWithValue("@full_name", Textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", Textbox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", Textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", Textbox5.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", Textbox6.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", Textbox7.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", Textbox8.Text.Trim());
                cmd.Parameters.AddWithValue("@password", Textbox9.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful');</script>");
                loginUser();
                //clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void loginUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id='" + Textbox8.Text.Trim() + "' " +
                    "AND password='" + Textbox9.Text.Trim() + "';", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful');</script>");

                        Session["username"] = dr.GetValue(8).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalide Credentials !');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
            bool checkMemberExists()
            {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = '"+ Textbox8.Text.Trim()+ "' ;", con);

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
            catch(Exception ex)
            {
                Response.Write("<script>aleart('"+ex.Message+"');</script>");
                return false;
            }
        }

        void clearForm()
        {
            Textbox1.Text="";
            Textbox2.Text = "";
            Textbox3.Text = "";
            Textbox4.Text = "";
            Textbox5.Text = "";
            Textbox6.Text = "";
            Textbox7.Text = "";
            Textbox8.Text = "";
            Textbox9.Text = "";
            DropDownList1.SelectedValue = "Select";
        }
    }
}