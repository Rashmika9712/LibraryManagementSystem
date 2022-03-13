<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="libraryManagementSystem.adminpublishermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-5 mx-auto">

                <div class="card mb-1" >
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="Images/publish.png" />
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

                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">Publisher ID</label>
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                                placeholder="ID"></asp:TextBox>
                                            <asp:Button ID="Button1" CssClass="btn btn-secondary" runat="server"
                                                Text="Go" OnClick="Button1_Click" /> 
                                        </div>                                     
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="mb-3">
                                        <label class="form-label">Publisher Name</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                            placeholder="Publisher Name">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <asp:Button ID="Button2" CssClass="btn btn-primary form-control" runat="server" 
                                            Text="Add" OnClick="Button2_Click"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <asp:Button ID="Button3" CssClass="btn btn-success form-control" runat="server" 
                                            Text="Update" OnClick="Button3_Click"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <asp:Button ID="Button4" CssClass="btn btn-danger form-control" runat="server" 
                                            Text="Delete" OnClick="Button4_Click"/>
                                    </div>
                                </div>                                
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
                                        <h4>Publisher List</h4>
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
                                    SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-responsive-sm table-hover table-active table-striped table-bordered" ID="GridView1" 
                                        runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="publisher_id" HeaderText="Publisher ID" ReadOnly="True" SortExpression="publisher_id" />
                                            <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name" />
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
