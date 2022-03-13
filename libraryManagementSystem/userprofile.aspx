<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="libraryManagementSystem.userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div  class="row">  
            
            <div class="col-md-5 mx-auto">                 
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="Images/download%20(1).png" />
                                </center>                                
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>
                                        Account Status - 
                                        <asp:Label ID="Lable1" runat="server" Text="Status" 
                                            class="badge rounded-pill bg-success"></asp:Label>
                                    </span>                                                                   
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
                                           TextMode="Phone"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Email ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox4" runat="server"
                                            TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>                           
                            </div>

                            <div class="row">
                                <div class="col-md-4">                                
                                    <div class="mb-3">
                                        <label class="form-label">State</label>
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server"
                                        placeholder="State">

                                            <asp:ListItem Text="Select" value="Select"/>
                                            <asp:ListItem Text="Western Province" value="Western Province"/>
                                            <asp:ListItem Text="Central Province" value="Central Province"/>
                                            <asp:ListItem Text="Eastern Province" value="Eastern Province"/>
                                            <asp:ListItem Text="Northern Province" value="Northern Province"/>
                                            <asp:ListItem Text="North Western Province" value="North Western Province"/>
                                            <asp:ListItem Text="North Central Province" value="North Central Province"/>
                                            <asp:ListItem Text="Uva Province" value="Uva Province"/>
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
                                    <div class="mb-4">
                                        <label class="form-label">Full Address</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox7" runat="server"
                                            TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                </div>                                                           
                            </div>

                            <div class="row mb-3">
                                <div class="col">
                                    <center><span class="badge rounded-pill bg-secondary">Login Credentials</span></center>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-4">                                
                                    <div class="mb-3">
                                        <label class="form-label">Member ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox8" runat="server"
                                            ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">Old Password</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox9" runat="server"
                                            ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">New Password</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox10" runat="server"
                                            placeholder="New Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <div class="mb-3">                                          
                                            <asp:Button ID="Button1" class="btn btn-secondary form-control" 
                                                runat="server" Text="Update" OnClick="Button1_Click"/>                                                                              
                                        </div>
                                    </div>
                                </center>
                            </div>
                        </formview> 

                    </div>                                   
                </div> 

                <div class="mb-3"><a href="homepage.aspx"><< Back to Home</a></div>

            </div> 
            
            <div class="col-md-7 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="Images/logo.png" />
                                </center>                                
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Your Issued Books</h3>
                                    <asp:Label runat="server" ID="Label2" class="badge rounded-pill bg-info" 
                                        Text="Info about book due date"></asp:Label>                             
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
                                <asp:GridView class="table table-hover table-striped table-bordered" ID="GridView1" runat="server" 
                                    OnRowDataBound="GridView1_RowDataBound">                                    
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
