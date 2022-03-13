<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="libraryManagementSystem.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-5 mx-auto">
                <div class="card mb-1">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Author Details</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>                                    
                                    <img width="150" src="Images/author.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <br />
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-4">                                
                                <div class="mb-3">
                                    <label class="form-label">Author ID</label>                                    
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                            placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="Button4" CssClass="btn btn-secondary" runat="server"
                                            Text="Go" OnClick="Button4_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="mb-3">
                                    <label class="form-label">Author Name</label>
                                    <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                        placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>                           
                        </div>

                        <div class="row">
                    
                            <div class="col-4">
                                <div class="mb-3">                                          
                                    <asp:Button ID="Button1" class="btn btn-success form-control" 
                                        runat="server" Text="Add" OnClick="Button1_Click"/>                                                                              
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="mb-3">                                          
                                    <asp:Button ID="Button2" class="btn btn-primary form-control" 
                                        runat="server" Text="Update" OnClick="Button2_Click"/>                                                                              
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="mb-3">                                          
                                    <asp:Button ID="Button3" class="btn btn-danger form-control" 
                                        runat="server" Text="Delete" OnClick="Button3_Click"/>                                                                              
                                </div>
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
                                    <h3>Author List</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">                              
                                <hr/>                               
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:libraryDBConnectionString %>" 
                                SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-hover table-bordered table-active table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="Author ID" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>

                </div>                
            </div>

        </div>
    </div>

</asp:Content>
