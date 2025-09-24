<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all-cars.aspx.cs" Inherits="CarDelearShip_Project.all_cars" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/profile.css" />
    <link rel="stylesheet" href="css/All-Car.css" />

    <style>
        .file-input {
            display: block;
            margin-bottom: 8px;
            width: 100%;
            max-width: 400px;
        }

        .filter-table {
            background: #fff;
            padding: 12px 16px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
            margin-bottom: 20px;
        }

            .filter-table td {
                padding: 8px 12px;
                font-weight: bold;
                color: #333;
                font-size: 14px;
            }

            .filter-table select {
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 6px;
                background: #f9f9f9;
                font-size: 14px;
                color: #333;
                min-width: 150px;
                cursor: pointer;
                transition: 0.3s;
            }

                .filter-table select:hover {
                    border-color: #007BFF;
                    background: #fff;
                }

                .filter-table select:focus {
                    outline: none;
                    border-color: #007BFF;
                    box-shadow: 0 0 6px rgba(0,123,255,0.4);
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
            <table border="0" class="filter-table">
                <tr>
                    <td><h2>Car Filter : </h2></td>
                    <td>
                        <asp:DropDownList ID="Price" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Price_SelectedIndexChanged">
                            <asp:ListItem Value="--- Select Price Range --- "></asp:ListItem>
                            <asp:ListItem Value="100000 - 200000"></asp:ListItem>
                            <asp:ListItem Value="200000 - 500000"></asp:ListItem>
                            <asp:ListItem Value="500000 - 1000000"></asp:ListItem>
                            <asp:ListItem Value="1000000 - 2000000"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="Transmission" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Transmission_SelectedIndexChanged">
                            <asp:ListItem Value="--- Select Transmission ---"></asp:ListItem>
                            <asp:ListItem Value="Automatic"></asp:ListItem>
                            <asp:ListItem Value="Manually"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="fueltype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="fueltype_SelectedIndexChanged">
                            <asp:ListItem Value="--- Select Fuel Type ---"></asp:ListItem>
                            <asp:ListItem Value="Petrol"></asp:ListItem>
                            <asp:ListItem Value="Diesel"></asp:ListItem>
                            <asp:ListItem Value="Hybrid"></asp:ListItem>
                            <asp:ListItem Value="Electric"></asp:ListItem>
                            <asp:ListItem Value="CNG"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <div>
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="product-grid"
                    GridLines="None"
                    ShowHeader="False"
                    DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="car-card">

                                    <img src='<%# Eval("Image1") %>' alt="Car" class="car-image" />


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

                                        <asp:Button ID="btnView" runat="server"
                                            Text="View Details"
                                            CommandName="ViewMore"
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            CssClass="btn" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label1" runat="server" Text="No Such Data Found" Visible="False"></asp:Label>
            </div>
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
