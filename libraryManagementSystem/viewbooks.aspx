<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="libraryManagementSystem.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <div class="row">

                <div class="col-sm-12">
                    <center>
                        <h3>
                        Book Inventory List</h3>
                    </center>
                </div> 
                <br />

                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel CssClass="alert alert-success" role="alert" ID="panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>                    
                </div>           
                
                <div class="row mb-2">
                    <div class="col-md-8 mx-auto">
                        <div class="card">
                            <div class="card -body">

                                <div class="row">

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:libraryDBConnectionString %>" 
                                        SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                    <div class="col">                                
                                        <asp:GridView class="table table-active table-bordered table-responsive-sm table-striped table-hover" ID="GridView1" 
                                        runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />

                                            <asp:TemplateField>

                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-10">

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("book_name") %>'></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12"><small>Author -</small>
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                        &nbsp;| <small>Genre -</small>
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("genre") %>'></asp:Label>
                                                                        &nbsp;| <small>Language -</small>
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("language") %>'></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12"><small>Publisher -</small>
                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                        &nbsp;| <small>Publish Date -</small>
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                        &nbsp;| <small>Pages -</small>
                                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                        &nbsp;| <small>Edition -</small>
                                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("edition") %>'></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12"><small>Cost -</small>
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                        &nbsp;| <small>Actual Stock -</small>
                                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                        &nbsp;| <small>Available -</small>
                                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12"><small>Description -</small>
                                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-lg-2">
                                                                <asp:Image class="img-fluid" ID="Image1" runat="server" 
                                                                    ImageUrl='<%# Eval("book_img_link") %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                        </Columns>
                                        </asp:GridView>                                                             
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>                                                 
                </div>

                <center>
                    <a href="homepage.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                    <br />
                <center>

            </div>
        </div>
</asp:Content>
