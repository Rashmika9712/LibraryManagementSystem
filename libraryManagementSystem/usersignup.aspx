<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="libraryManagementSystem.usersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">           
            <div class="col-md-8 mx-auto"> 
                
                <div class="card">
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
                                    <h3>Member Sign Up</h3>
                                </center>                                
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">                                
                                <hr />                                                               
                            </div>                             
                        </div>

                        <formview>
                            <div class="row">
                                <div class="col-md-6">                                
                                    <div class="mb-3">
                                        <label class="form-label">Full Name</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                            placeholder="Full Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Date of Birth</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                            placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>                           
                            </div>
                            <div class="row">
                                <div class="col-md-6">                                
                                    <div class="mb-3">
                                        <label class="form-label">Contact Number</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox3" runat="server"
                                            placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Email ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox4" runat="server"
                                            placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>                           
                            </div>

                            <div class="row">
                                <div class="col-md-4">                                
                                    <div class="mb-3">
                                        <label class="form-label">State</label>
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server"
                                        placeholder="Full Name">

                                            <asp:ListItem Text="Select" value="Select"/>
                                            <asp:ListItem Text="Western Province" value="Western Province"/>
                                            <asp:ListItem Text="Central Province " value="Central Province "/>
                                            <asp:ListItem Text="Eastern Province" value="Eastern Province"/>
                                            <asp:ListItem Text="Northern Province" value="Northern Province"/>
                                            <asp:ListItem Text="North Western Province " value="North Western Province"/>
                                            <asp:ListItem Text="North Central Province" value="North Central Province"/>
                                            <asp:ListItem Text="Uva Province " value="Uva Province "/>
                                            <asp:ListItem Text="Sabaragamuwa Province" value="Sabaragamuwa Province"/>
                                            <asp:ListItem Text="Southern Province" value="Southern Province"/>
                                           
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">City</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox5" runat="server"
                                            placeholder="City"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">Pin Code</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox6" runat="server"
                                            placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">                                
                                    <div class="mb-3">
                                        <label class="form-label">Full Address</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox7" runat="server"
                                            placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                </div>                                                           
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center><span class="badge rounded-pill bg-secondary">Login Credentials</span></center>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">                                
                                    <div class="mb-3">
                                        <label class="form-label">Member ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox8" runat="server"
                                            placeholder="Member ID"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Password</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox9" runat="server"
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>                           
                            </div>
                            <div class="row">
                                    <div class="mb-4">
                                        <asp:Button ID="Button1" class="btn btn-secondary form-control" runat="server" Text="Sign UP" OnClick="Button1_Click" />
                                    </div>
                                </div>

                            <div class="row">
                                    <div class="mb-3">
                                       <center>
                                           Already a User? <a href="userlogin.aspx"><i>Login</i></a>
                                       </center>                                        
                                    </div>
                                </div>

                        </formview> 

                    </div>                                   
                </div> 

                <div class="mb-3"><a href="homepage.aspx"><< Back to Home</a></div>

            </div>            
        </div>
    </div>

</asp:Content>
