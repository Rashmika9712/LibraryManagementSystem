<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="libraryManagementSystem.adminbookissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-5 mx-auto">

                <div class="card mb-2" >
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="Images/issue.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <br />
                                </center>
                            </div>
                        </div>

                        <formview>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Member ID</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                            placeholder="Member ID">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Book ID</label>
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                                placeholder="Book ID"></asp:TextBox>
                                            <asp:Button ID="Button4" CssClass="btn btn-dark" runat="server"
                                                Text="Go" OnClick="Button4_Click" /> 
                                        </div>                                     
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Member Name</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox3" runat="server"
                                            placeholder="Member Name" ReadOnly="true">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Book Name</label>                                        
                                        <asp:TextBox CssClass="form-control" ID="Textbox4" runat="server"
                                            placeholder="Book Name" ReadOnly="true"></asp:TextBox>                                                                                
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label class="form-label">Start Date</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox5" runat="server"
                                             TextMode="Date">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label class="form-label">End Date</label>                                        
                                        <asp:TextBox CssClass="form-control" ID="Textbox6" runat="server"
                                                TextMode="Date"></asp:TextBox>                           
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <asp:Button ID="Button5" CssClass="btn btn-secondary form-control" runat="server" 
                                            Text="Issue" OnClick="Button5_Click"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <asp:Button ID="Button1" CssClass="btn btn-primary form-control" runat="server" 
                                            Text="Return" OnClick="Button1_Click"/>
                                    </div>
                                </div>                                                                
                            </div>

                        </formview>

                        <div class="row text-end">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Clear Form</asp:LinkButton>
                        </div>

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
                                        <h4>Issued Book List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <br />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:libraryDBConnectionString %>" 
                                    SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-hover table-responsive-sm table-striped table-bordered table-active" 
                                        ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
