<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="libraryManagementSystem.adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">       
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <div class="row">           
            <div class="col-md-6 mx-auto">  
                <div class="card ">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="Images/download.png" />
                                </center>                                
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
                                </center>                                
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">                                
                                <hr />                                                               
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">
                                <formview>
                                    <div class="mb-3">
                                        <label class="form-label">Admin  ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                            placeholder="Admin ID"></asp:TextBox>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">Password</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="mb-4">
                                        <center>
                                            <div class="col-md-6 sol-sm-12">
                                                <asp:Button ID="Button1" class="btn btn-secondary form-control" runat="server" Text="Login" OnClick="Button1_Click"/>
                                            </div>
                                        </center>                                        
                                    </div>                                    

                                </formview>                               
                            </div>                             
                        </div>

                    </div>                                   
                </div> 

                <div class="mb-3"><a href="homepage.aspx"><< Back to Home</a></div>

            </div>            
        </div>
    </div>

</asp:Content>
