using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace libraryManagementSystem
{
    public partial class adminlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //log in
        protected void Button1_Click(object sender, EventArgs e)
        {
            loginAdmin();
        }

        //user defined functions
        void loginAdmin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM admin_login_tbl WHERE username ='" + Textbox1.Text.Trim() + "' " +
                    "AND password='" + Textbox2.Text.Trim() + "';", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {                    
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successfull !');</script>");
                        
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["fullname"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                        
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
    }
}