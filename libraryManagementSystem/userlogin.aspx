<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="libraryManagementSystem.userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-6 mx-auto">
                
                <div class="card mb-1">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="Images/download%20(1).png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3 class="card-title">Member Login</h3>                                        
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
                                        <label class="form-label">Member ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label">Password</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server" placeholder="Password" 
                                            TextMode="Password"></asp:TextBox>
                                    </div>

                                    <div class="mb-4">
                                        <center>
                                        <div class="col-md-6 col-sm-12">                                            
                                            <asp:Button CssClass="form-control btn btn-secondary" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                        </div>    
                                        </center>
                                    </div>
                                    
                                    <div class="row mb-2">                                        
                                        <center>
                                            New to E-library? <a href="usersignup.aspx"><i>Create an account</i></a>
                                        </center> 
                                    </div>
                                </formview>                                


                            </div>
                        </div>

                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
        </div>
    </div>

</asp:Content>
