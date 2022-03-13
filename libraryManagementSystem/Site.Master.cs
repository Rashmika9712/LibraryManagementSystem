using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace libraryManagementSystem
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == "")
                {
                    LinkButton2.Visible = true;//userlogin
                    LinkButton3.Visible = true;//user Sign Up

                    LinkButton4.Visible = false;//Log Out
                    LinkButton5.Visible = false;//hello user

                    LinkButton6.Visible = true; //Admin login

                    LinkButton7.Visible = false;//Publisher Management
                    LinkButton8.Visible = false;//Author Management
                    LinkButton9.Visible = false;//Member Management
                    LinkButton10.Visible = false;//Book Inventory
                    LinkButton11.Visible = false;//Book Issuing
                }
                else if (Session["role"] == "user")
                {
                    LinkButton2.Visible = false;//userlogin
                    LinkButton3.Visible = false;//user Sign Up

                    LinkButton4.Visible = true;//Log Out
                    LinkButton5.Visible = true;//hello user
                    LinkButton5.Text = "Hello " + Session["username"].ToString();

                    LinkButton6.Visible = true; //Admin login

                    LinkButton7.Visible = false;//Publisher Management
                    LinkButton8.Visible = false;//Author Management
                    LinkButton9.Visible = false;//Member Management
                    LinkButton10.Visible = false;//Book Inventory
                    LinkButton11.Visible = false;//Book Issuing
                }
                else if (Session["role"] == "admin")
                {
                    LinkButton2.Visible = false;//userlogin
                    LinkButton3.Visible = false;//user Sign Up

                    LinkButton4.Visible = true;//Log Out
                    LinkButton5.Visible = true;//hello user
                    LinkButton5.Text = "Hello Admin";

                    LinkButton6.Visible = false; //Admin login

                    LinkButton7.Visible = true;//Publisher Management
                    LinkButton8.Visible = true;//Author Management
                    LinkButton9.Visible = true;//Member Management
                    LinkButton10.Visible = true;//Book Inventory
                    LinkButton11.Visible = true;//Book Issuing
                }
            }
            catch (Exception ex) 
            {                
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }

        //userlogin
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }
        
        //usersignup
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        //userprofile
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        //adminlogin
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        //publisher mangement
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        //Admin Author Management
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        //Admin Member Management
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        //Admin Book Inventory
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        //Admin Book Issuing
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        //viewbooks
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        //Log Out
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton2.Visible = true;//userlogin
            LinkButton3.Visible = true;//user Sign Up

            LinkButton4.Visible = false;//Log Out
            LinkButton5.Visible = false;//hello user            

            LinkButton6.Visible = true; //Admin login

            LinkButton7.Visible = false;//Publisher Management
            LinkButton8.Visible = false;//Author Management
            LinkButton9.Visible = false;//Member Management
            LinkButton10.Visible = false;//Book Inventory
            LinkButton11.Visible = false;//Book Issuing

            Response.Redirect("homepage.aspx");
        }
    }
}