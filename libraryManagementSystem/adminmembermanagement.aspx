 
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="libraryManagementSystem.adminmembermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-5 mx-auto">
                <div class="card mb-1">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Details</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="Images/download%20(1).png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <br />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">                                
                                <div class="mb-3">
                                    <label class="form-label">Member ID</label>                                    
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                            placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton4" CssClass="btn btn-secondary" runat="server" OnClick="LinkButton4_Click" >
                                            <i class="fas fa-check-circle"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                        placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-5">                                
                                <div class="mb-3">
                                    <label class="form-label">Acount Status</label>                                    
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Textbox3" runat="server"
                                            placeholder="Status" ReadOnly="True">
                                        </asp:TextBox>
                                        <asp:LinkButton ID="LinkButton5" CssClass="btn btn-success" runat="server" OnClick="LinkButton5_Click">
                                            <i class="fas fa-check-circle"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning" runat="server" OnClick="LinkButton1_Click">
                                            <i class="fas fa-registered"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger" runat="server" OnClick="LinkButton2_Click">
                                            <i class="fas fa-times-circle"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            
                        </div>                        

                        <div class="row">

                            <div class="col-md-3">                                
                                <div class="mb-3">
                                    <label class="form-label">DOB</label>                                    
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Textbox4" runat="server" placeholder="DOB"
                                            ReadOnly="True"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Contact No</label>
                                    <asp:TextBox CssClass="form-control" ID="Textbox5" runat="server" placeholder="Contact No"
                                        ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-5">                                
                                <div class="mb-3">
                                    <label class="form-label">Email ID</label>                                
                                    <asp:TextBox CssClass="form-control" ID="Textbox6" runat="server"
                                        placeholder="Email ID" ReadOnly="True">
                                    </asp:TextBox>  
                                </div>
                            </div>
                            
                        </div>

                        <div class="row">

                            <div class="col-md-4">                                
                                <div class="mb-3">
                                    <label class="form-label">State</label>                                    
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Textbox7" runat="server"
                                           Placeholder="State" ReadOnly="True"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">City</label>
                                    <asp:TextBox CssClass="form-control" ID="Textbox8" runat="server"
                                      placeholder="City"  ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">                                
                                <div class="mb-3">
                                    <label class="form-label">Pin Code</label>                                
                                    <asp:TextBox CssClass="form-control" ID="Textbox9" runat="server"
                                        placeholder="Pin Code" ReadOnly="True">
                                    </asp:TextBox>  
                                </div>
                            </div>
                            
                        </div>  
                        
                        <div class="row">

                            <div class="col">                                
                                <div class="mb-4">
                                    <label class="form-label">Full Postal Address</label>  
                                    <asp:TextBox CssClass="form-control" ID="Textbox10" runat="server" placeholder="Full Postal Address"
                                        Rows="2" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>   
                                </div>
                            </div> 
                        </div>

                        <div class="row">                   
                           
                            <div class="col">
                                <div class="mb-3">                                          
                                    <asp:Button ID="Button3" class="btn btn-secondary form-control mx-auto" 
                                        runat="server" Text="Delete User Permanetly" OnClick="Button3_Click"/>                                                                              
                                </div>
                            </div>                    
                        </div>

                        <div class="row">
                            <div class="mb-1 text-end">
                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
                                    Clear Form
                                </asp:LinkButton>
                            </div>
                        </div>
                        
                    </div>                    
                </div>                

                <div class="mb-3"><a href="homepage.aspx"><< Back to Home</a></div>               

            </div>

            <div class="col-md-7">
                <div class="card">

                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member List</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>                 
                        
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:libraryDBConnectionString %>" 
                                SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-responsive-sm table-bordered table-hover table-active" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member Id" SortExpression="member_id" ReadOnly="True" />
                                        <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>                    

                    </div>                   
               </div>
            </div> 
            
        </div>
    </div>
    </div>
</asp:Content>
