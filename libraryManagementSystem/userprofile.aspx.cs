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
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind(); 
            
            try
            {
                if(Session["username"].ToString()=="" || Session["username"] == null)
                {
                    Response.Redirect("userlogin.aspx");
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                }                
                else
                {
                    getUserBookData();

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        //Update Button
        protected void Button1_Click(object sender, EventArgs e)
        {
		if (Session["username"].ToString() == "" || Session["username"] == null)
            	{
                	Response.Redirect("userlogin.aspx");
                	Response.Write("<script>alert('Session Expired Login Again');</script>");
            	}
            	else
            	{
                	updateUserPersonDetails();
            	}
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


        //User Defined functions

	    void updateUserPersonDetails()
        {
            string password = "";
            if (Textbox10.Text.Trim() == "")
            {
                password = Textbox9.Text.Trim();
            }
            else
            {
                password = Textbox10.Text.Trim(); 
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET full_name=@full_name, dob=@dob,contact_no=@contact_no," +
                    "email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address,password=@password," +
                    "account_status=@account_status WHERE member_id='" + Session["username"].ToString() + "';", con);

                cmd.Parameters.AddWithValue("@full_name", Textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", Textbox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", Textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@city", Textbox5.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", Textbox6.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", Textbox7.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status","Pending");

                cmd.Parameters.AddWithValue("@password", password);

                cmd.Parameters.AddWithValue("@state",DropDownList1.SelectedItem.Value);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                    getUserBookData();
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Entry');</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id='" + Session["username"].ToString() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList1.SelectedValue = dt.Rows[0]["state"].ToString().Trim();

                Textbox1.Text = dt.Rows[0]["full_name"].ToString();
                Textbox2.Text = dt.Rows[0]["dob"].ToString();
                Textbox3.Text = dt.Rows[0]["contact_no"].ToString();
                Textbox4.Text = dt.Rows[0]["email"].ToString();
                Textbox5.Text = dt.Rows[0]["city"].ToString();
                Textbox6.Text = dt.Rows[0]["pincode"].ToString().Trim();
                Textbox7.Text = dt.Rows[0]["full_address"].ToString();
                Textbox8.Text = dt.Rows[0]["member_id"].ToString();
                Textbox9.Text = dt.Rows[0]["password"].ToString().Trim();

                Lable1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "Active")
                {
                    Lable1.Attributes.Add("class", "badge bg-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Pending")
                {
                    Lable1.Attributes.Add("class", "badge bg-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Deactivate")
                {
                    Lable1.Attributes.Add("class", "badge bg-danger");
                }
                else
                {
                    Lable1.Attributes.Add("class", "badge bg-info");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE member_id='"+Session["username"].ToString()+"';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }        
        
    }
}