<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="car-buy.aspx.cs" Inherits="CarDelearShip_Project.car_buy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Buy Cars - CarDealer</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <form runat ="server">
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
        <h1 class="section-title">Buy Cars</h1>

        <div class="search-form">
            <h2>Advanced Search</h2>
            <form class="filter-form">
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <select id="brand" name="brand">
                        <option value="">Any Brand</option>
                        <option value="toyota">Toyota</option>
                        <option value="honda">Honda</option>
                        <option value="ford">Ford</option>
                        <option value="bmw">BMW</option>
                        <option value="audi">Audi</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="model">Model</label>
                    <input type="text" id="model" name="model" placeholder="Any Model">
                </div>
                <div class="form-group">
                    <label for="year">Year</label>
                    <select id="year" name="year">
                        <option value="">Any Year</option>
                        <option value="2023">2023</option>
                        <option value="2022">2022</option>
                        <option value="2021">2021</option>
                        <option value="2020">2020</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Max Price</label>
                    <select id="price" name="price">
                        <option value="">Any Price</option>
                        <option value="10000">$10,000</option>
                        <option value="20000">$20,000</option>
                        <option value="30000">$30,000</option>
                        <option value="50000">$50,000</option>
                    </select>
                </div>
                <button type="submit" class="btn">Apply Filters</button>
            </form>
        </div>

        <div class="car-grid">
            <div class="car-card" data-brand="toyota" data-model="camry" data-year="2022" data-price="25000">
                <img src="images/car1.jpg" alt="Toyota Camry" class="car-image">
                <div class="car-details">
                    <h3 class="car-title">Toyota Camry 2022</h3>
                    <div class="car-price">$25,000</div>
                    <div class="car-info">
                        <span>2022</span>
                        <span>15,000 km</span>
                    </div>
                    <div class="car-info">
                        <span>Petrol</span>
                        <span>Automatic</span>
                    </div>
                    <a href="#" class="btn">View Details</a>
                </div>
            </div>

            <div class="car-card" data-brand="honda" data-model="civic" data-year="2021" data-price="22500">
                <img src="images/car2.jpg" alt="Honda Civic" class="car-image">
                <div class="car-details">
                    <h3 class="car-title">Honda Civic 2021</h3>
                    <div class="car-price">$22,500</div>
                    <div class="car-info">
                        <span>2021</span>
                        <span>20,000 km</span>
                    </div>
                    <div class="car-info">
                        <span>Petrol</span>
                        <span>Manual</span>
                    </div>
                    <a href="#" class="btn">View Details</a>
                </div>
            </div>

            <div class="car-card" data-brand="bmw" data-model="3series" data-year="2020" data-price="35000">
                <img src="images/car3.jpg" alt="BMW 3 Series" class="car-image">
                <div class="car-details">
                    <h3 class="car-title">BMW 3 Series 2020</h3>
                    <div class="car-price">$35,000</div>
                    <div class="car-info">
                        <span>2020</span>
                        <span>25,000 km</span>
                    </div>
                    <div class="car-info">
                        <span>Diesel</span>
                        <span>Automatic</span>
                    </div>
                    <a href="#" class="btn">View Details</a>
                </div>
            </div>
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
    </form>
    <script src="js/script.js"></script>
</body>
</html>
