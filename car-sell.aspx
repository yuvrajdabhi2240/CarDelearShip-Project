<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="car-sell.aspx.cs" Inherits="CarDelearShip_Project.photo.car_sell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sell Your Car - CarDealer</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/profile.css" />
    <link rel="stylesheet" href="css/All-Car.css" />
    <style>
        .upload-label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
            color: #0094ff;
        }

        .btn-space {
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="nav-container">
                <a href="index.html" class="logo">CarDealer</a>
                <button class="mobile-menu-btn" id="mobileMenuBtn">☰</button>
                <nav id="mainNav">
                    <ul>
                        <li><a href="index.aspx">Home</a></li>
                        <li><a href="car-buy.aspx">Buy Cars</a></li>
                        <li><a href="car-sell.aspx">Sell Cars</a></li>
                        <li><a href="all-cars.aspx">All Cars</a></li>
                        <li><a href="about.aspx">About</a></li>
                        <li><a href="contact.aspx">Contact</a></li>
                        <li>
                            <asp:HyperLink ID="login" runat="server" NavigateUrl="login.aspx" Text="Login"></asp:HyperLink>

                        </li>
                        <li>
                            <asp:HyperLink ID="register" runat="server" NavigateUrl="register.aspx" Text="Register"></asp:HyperLink>

                        </li>
                        <li>
                            <!-- PROFILE DROPDOWN -->

                            <asp:Panel ID="profile" runat="server" CssClass="profile-container">
                                <!-- Hidden checkbox for toggle -->
                                <input type="checkbox" id="toggleProfile" class="toggle-checkbox" />

                                <!-- Label acts as profile button -->
                                <label for="toggleProfile">
                                    <asp:Image ID="imgProfile" runat="server"
                                        CssClass="profile-pic" Height="39px" />
                                </label>

                                <!-- Dropdown -->
                                <div class="dropdown">
                                    <asp:LinkButton ID="lnkProfile" runat="server" ForeColor="Black">👤 Profile</asp:LinkButton>
                                    <asp:LinkButton ID="lnkadmin" runat="server" ForeColor="Black" Visible="false">⚙️ Admin</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" OnClick="LinkButton1_Click">🚪 Logout</asp:LinkButton>
                                </div>
                            </asp:Panel>

                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <h1 class="section-title">Sell Your Car</h1>

            <div class="form-container">
                <h2>Car Listing Form</h2>
                <form id="sell-form">
                    <div class="form-group">
                        <label for="brand">Brand *</label>
                        <asp:DropDownList ID="brand" runat="server">
                        </asp:DropDownList>

                    </div>

                    <div class="form-group">
                        <label for="model">Model *</label>
                        <asp:TextBox ID="model" runat="server" placeholder="e.g., Camry, Civic, Focus"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="year">Year *</label>
                        <asp:DropDownList ID="year" runat="server">
                            <asp:ListItem Value="--- Select Year ---"></asp:ListItem>
                            <asp:ListItem Value="2025"></asp:ListItem>
                            <asp:ListItem Value="2024"></asp:ListItem>
                            <asp:ListItem Value="2023"></asp:ListItem>
                            <asp:ListItem Value="2022"></asp:ListItem>
                            <asp:ListItem Value="2021"></asp:ListItem>
                            <asp:ListItem Value="2020"></asp:ListItem>
                            <asp:ListItem Value="2019"></asp:ListItem>
                            <asp:ListItem Value="2018"></asp:ListItem>
                            <asp:ListItem Value="2017"></asp:ListItem>
                            <asp:ListItem Value="2016"></asp:ListItem>
                            <asp:ListItem Value="2015"></asp:ListItem>
                            <asp:ListItem Value="2014"></asp:ListItem>
                            <asp:ListItem Value="2013"></asp:ListItem>
                            <asp:ListItem Value="2012"></asp:ListItem>
                            <asp:ListItem Value="2011"></asp:ListItem>
                            <asp:ListItem Value="2010"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="mileage">Mileage (km) *</label>
                        <asp:TextBox ID="mileage" runat="server" placeholder="e.g., 50000"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="fuel-type">Fuel Type *</label>
                        <asp:DropDownList ID="fueltype" runat="server">
                            <asp:ListItem Value="--- Select Fuel Type ---"></asp:ListItem>
                            <asp:ListItem Value="Petrol"></asp:ListItem>
                            <asp:ListItem Value="Diesel"></asp:ListItem>
                            <asp:ListItem Value="Hybrid"></asp:ListItem>
                            <asp:ListItem Value="Electric"></asp:ListItem>
                            <asp:ListItem Value="CNG"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="transmission">Transmission *</label>

                        <asp:DropDownList ID="transmission" runat="server">
                            <asp:ListItem Value="--- Select transmission ---"></asp:ListItem>
                            <asp:ListItem Value="Manual"></asp:ListItem>
                            <asp:ListItem Value="Automatic"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="price">Asking Price ($) *</label>
                        <asp:TextBox ID="price" runat="server" placeholder="e.g., 25000"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="description">Description</label>
                        <asp:TextBox ID="Description" runat="server" placeholder="Describe your car's condition, features, and any additional information..."></asp:TextBox>
                    </div>

                    <h2>Upload Photos</h2>
                    <div class="form-group">
                        <label class="upload-label" style="color: #0094ff;">Car Front Image :</label>
                        <asp:FileUpload ID="photo1" CssClass="file-input" runat="server" />

                        <br />
                        <label class="upload-label" style="color: #0094ff;">Car Back Image :</label>
                        <asp:FileUpload ID="photo2" CssClass="file-input" runat="server" />

                        <br />

                        <label class="upload-label" style="color: #0094ff;">Car Interior Image :</label>
                        <asp:FileUpload ID="photo3" CssClass="file-input" runat="server" />
                        <br />

                        <label class="upload-label" style="color: #0094ff;">Car Left Side Image :</label>
                        <asp:FileUpload ID="photo4" CssClass="file-input" runat="server" />
                        <br />

                        <label class="upload-label" style="color: #0094ff;">Car Right Side Image :</label>
                        <asp:FileUpload ID="photo5" CssClass="file-input" runat="server" />

                        <asp:Label ID="fileuploaderror" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <small>You can upload multiple photos. Maximum 5 images.</small>
                    </div>
                    <asp:Button ID="Button1" class="btn" runat="server" Text="Submit Listing" OnClick="Button1_Click1" />
                </form>
            </div>
            <br />
            <div class="card">
                <h3>Why Sell with CarDealer?</h3>
                <ul>
                    <li>Reach thousands of potential buyers</li>
                    <li>Professional listing presentation</li>
                    <li>Secure payment processing</li>
                    <li>24/7 customer support</li>
                    <li>No hidden fees</li>
                </ul>
            </div>
            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                CssClass="product-grid"
                GridLines="None"
                ShowHeader="False"
                DataKeyNames="id"
                OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="car-card">
                                <!-- Product Image -->
                                <img src='<%# Eval("Image1") %>' alt="Car" class="car-image" />

                                <!-- Product Info -->
                                <div class="car-details">
                                    <h3 class="car-title"><%# Eval("Brand") %></h3>
                                    <p class="car-price">₹<%# Eval("Price") %></p>

                                    <div class="car-info">
                                        <span><%# Eval("Year") %></span>
                                        <span><%# Eval("Mileage") %> km</span>
                                    </div>
                                    <div class="car-info">
                                        <span><%# Eval("FuelType") %></span>
                                        <span><%# Eval("Transmission") %></span>
                                    </div>

                                    <!-- View Button -->
                                    <asp:Button ID="btnView" runat="server"
                                        Text="View Details"
                                        CommandName="ViewMore"
                                        CommandArgument='<%# Container.DataItemIndex %>'
                                        CssClass="btn" />

                                    <asp:Button ID="Button2" runat="server"
                                        Text="Edit Details"
                                        CommandName="edit"
                                        CommandArgument='<%# Container.DataItemIndex %>'
                                        CssClass="btn" />

                                    <center>
                                        <asp:Button ID="Button3" runat="server"
                                            Text="Delete Car"
                                            CommandName="delete"
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            CssClass="btn btn-space" />
                                    </center>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>



        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h3>CarDealer</h3>
                    <p>Your trusted platform for buying and selling second-hand cars with confidence. We connect buyers and sellers in a secure, transparent marketplace.</p>
                    <div class="social-links">
                        <a href="#" title="Facebook">f</a>
                        <a href="#" title="Twitter">t</a>
                        <a href="#" title="Instagram">i</a>
                        <a href="#" title="LinkedIn">in</a>
                    </div>
                </div>

                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="car-buy.html">Buy Cars</a></li>
                        <li><a href="car-sell.html">Sell Cars</a></li>
                        <li><a href="all-cars.html">All Cars</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="faq.html">FAQ</a></li>
                        <li><a href="testimonials.html">Testimonials</a></li>
                        <li><a href="contact.html">Help Center</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Contact Info</h3>
                    <p>📍 123 Car Street, Auto City, AC 12345</p>
                    <p>📞 (555) 123-4567</p>
                    <p>✉️ info@cardealer.com</p>
                    <p>🕒 Mon-Fri: 9AM-6PM</p>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2024 CarDealer. All rights reserved. | Designed with ❤️ for car enthusiasts</p>
            </div>
        </footer>

        <script src="js/script.js"></script>
    </form>
</body>
</html>

