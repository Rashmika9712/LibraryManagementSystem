<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="libraryManagementSystem.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div  class="row">  
            
            <div class="col-md-5 mx-auto">                 
                <div class="card mb-1">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4>
                                </center>                                
                            </div>                             
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" width="150" src="book_inventory/inventory.png" />                                                   
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
                                <div class="col">                                
                                    <div class="mb-3">
                                        <div class="form-group">
                                            <label for="FileUpload1" class="form-label mt-1">Image Upload</label>
                                            <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" type="file" />
                                        </div>                                                                               
                                    </div>
                                </div>                                                           
                            </div>
                            <div class="row">
                                <div class="col-md-3">                                
                                    <div class="mb-3 form-group">
                                        <label class="form-label" for="Textbox1">Book ID</label>
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server"
                                                placeholder="ID"></asp:TextBox>
                                            <asp:Button ID="Button1" CssClass="btn btn-secondary" runat="server"
                                                Text="Go" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="mb-3 form-group">
                                        <label class="form-label" for="Textbox2">Book Name</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox2" runat="server"
                                            placeholder="Book Name"></asp:TextBox>
                                    </div>
                                </div>                           
                            </div>

                            <div class="row">

                                <div class="col-md-4">
                                    
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="form-label" for="DropDownList1">Language</label>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server"
                                            placeholder="Full Name">

                                                <asp:ListItem Text="Select" value="Select"/>
                                                <asp:ListItem Text="English" value="English"/>
                                                <asp:ListItem Text="Sinhala" value="Sinhala"/>                                                
                                                <asp:ListItem Text="Tamil" value="Tamil"/>
                                                <asp:ListItem Text="French" value="French"/>
                                                <asp:ListItem Text="Russia" value="Russia"/>                                            
                                           
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="form-group mb-3">
                                            <label class="form-label" for="DropDownList2">Publisher Name</label>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server"
                                            placeholder="Full Name">

                                                <asp:ListItem Text="Select" value="Select"/>
                                                <asp:ListItem Text="Pub 1" value="Pub 1"/>
                                                <asp:ListItem Text="Pub 2" value="Pub 2"/>                                                                                           
                                           
                                            </asp:DropDownList>
                                        </div>
                                   </div>                                    
                                </div>

                                <div class="col-md-4">

                                    <div class="row">
                                        <div class="form-group">
                                            <label class="form-label" for="DropDownList3">Author Name</label>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">

                                                <asp:ListItem Text="Select" value="Select"/>
                                                <asp:ListItem Text="Auth 1" value="Auth 1"/>
                                                <asp:ListItem Text="Auth 2" value="Auth 2"/>                                                                                           
                                           
                                            </asp:DropDownList>
                                        </div>
                                   </div>

                                    <div class="row">
                                        <div class="form-group mb-3">
                                            <label class="form-label" for="Textbox3">Publishe Date</label>
                                            <asp:TextBox CssClass="form-control" ID="Textbox3" runat="server"
                                                TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="ListBox1">Genre</label>
                                        <asp:ListBox ID="ListBox1" runat="server" Class="form-control" Rows="4"
                                        SelectionMode="Multiple">
                                            <asp:ListItem Text="Action" Value="Action" />
                                            <asp:ListItem Text="Adventure" Value="Adventure" />
                                            <asp:ListItem Text="Drama" Value="Drama" />
                                            <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                            <asp:ListItem Text="Novel" Value="Novel" />
                                            <asp:ListItem Text="Literary Fiction" Value="Literary Fiction" />
                                            <asp:ListItem Text="Coming-of-age story" Value="Coming-of-age story" />
                                            <asp:ListItem Text="Biography" Value="Biography" />
                                            <asp:ListItem Text="Domestic Fiction" Value="Domestic Fiction" />
                                            <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                            <asp:ListItem Text="Bildungsroman" Value="Bildungsroman" />
                                            <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                            <asp:ListItem Text="War story" Value="War story" />
                                            <asp:ListItem Text="Suspense" Value="Suspense" />
                                            <asp:ListItem Text="Historical Fiction" Value="Historical Fiction" />
                                            <asp:ListItem Text="Romance" Value="Romance" />
                                            <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                            <asp:ListItem Text="Self Help" Value="Self Help" />
                                            <asp:ListItem Text="Crime" Value="Crime" />
                                        </asp:ListBox>
                                    </div>
                                </div>
                            </div>
                                                    
                            <div class="row">

                                <div class="col-md-4">                                
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="Textbox4">Edition</label>
                                        <asp:TextBox ID="Textbox4" runat="server" placeholder="Edition"
                                            CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">                                
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="Textbox5">Book Cost(per unit)</label>
                                        <asp:TextBox ID="Textbox5" CssClass="form-control" runat="server" TextMode="Number"
                                            placeholder="Book Cost"></asp:TextBox>                                        
                                    </div>
                                </div>
                                <div class="col-md-4">                                
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="Textbox6">Pages</label>
                                        <asp:TextBox ID="Textbox6" runat="server" placeholder="Pages" TextMode="Number" 
                                            CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>                                
                                
                            </div>                          

                            <div class="row">
                                <div class="col-md-4">                                
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="Textbox7">Actual Stock</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox7" runat="server" TextMode="Number"
                                            placeholder="Actual Stock"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="Textbox8">Current Strock</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox8" runat="server" 
                                            ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="Textbox9">Issued Books</label>
                                        <asp:TextBox CssClass="form-control" ID="Textbox9" runat="server" 
                                            ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group mb-4">
                                    <label class="form-label" for="Textbox10">Book Description</label>
                                    <asp:TextBox CssClass="form-control" ID="Textbox10" runat="server"
                                        placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">                                
                                <div class="col-4">
                                    <div class="mb-2">                                          
                                        <asp:Button ID="Button2" class="btn btn-secondary form-control" 
                                            runat="server" Text="Add" OnClick="Button2_Click"/>                                                                              
                                    </div>
                                </div> 
                                <div class="col-4">
                                    <div class="mb-2">                                          
                                        <asp:Button ID="Button3" class="btn btn-success form-control" 
                                            runat="server" Text="Update" OnClick="Button3_Click"/>                                                                              
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="mb-2">                                          
                                        <asp:Button ID="Button4" class="btn btn-danger form-control" 
                                            runat="server" Text="Delete" OnClick="Button4_Click"/>                                                                              
                                    </div>
                                </div>
                            </div>
                        </formview> 

                        <div class="row">
                            <div class="text-end">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Clear Form</asp:LinkButton>
                            </div>
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
                                    <h3>Book Inventory List</h3>                                                                 
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
                                                                <div class="col-12"><small>Cost Rs:</small>
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
    </div>

</asp:Content>
