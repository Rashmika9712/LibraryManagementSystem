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
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go Button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        //Active
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Active");
        }

        //pending
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Pending");
        }

        //deactivate
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Deactivate");
            updateMemberStatusByID("Deactivate");
        }

        //Delete
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfMemberExists())
            {
                deleteMember();
            }
            else
            {
                Response.Write("<script>alert('Member does not exists!');</script>");
            }
        }

        //user defined functions

        void updateMemberStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status = '"+ status + "' " +
                        "WHERE member_id='" + Textbox1.Text.Trim() + "';", con);

                    cmd.ExecuteNonQuery();
                    con.Close();                    
                    GridView1.DataBind();
                    getMemberByID();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>('Invalid ID');</script>");
            }
        }

        void deleteMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id='" + Textbox1.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member Deteled Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id ='"+Textbox1.Text.Trim()+"';",con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Textbox2.Text = dt.Rows[0][0].ToString();
                    Textbox3.Text = dt.Rows[0][10].ToString();
                    Textbox4.Text = dt.Rows[0][1].ToString();
                    Textbox5.Text = dt.Rows[0][2].ToString();
                    Textbox6.Text = dt.Rows[0][3].ToString();
                    Textbox7.Text = dt.Rows[0][4].ToString();
                    Textbox8.Text = dt.Rows[0][5].ToString();
                    Textbox9.Text = dt.Rows[0][6].ToString();
                    Textbox10.Text = dt.Rows[0][7].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalide Member ID');</script>");
                    clearForm();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = '"+Textbox1.Text.Trim()+"';", con);

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
        }

        //clear Form
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            clearForm();
        }
    }
}