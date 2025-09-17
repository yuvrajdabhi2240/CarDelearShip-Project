<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="CarDelearShip_Project.CarDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Details</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/profile.css" />
    <style>
        .car-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 20px;
            font-family: Arial, sans-serif;
        }

            .car-grid tr {
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            }

            .car-grid td {
                padding: 20px;
                vertical-align: top;
            }

        /* Slider */
        .image-slider {
            position: relative;
            width: 260px;
            height: 180px;
            overflow: hidden;
            border-radius: 10px;
            border: 1px solid #ddd;
        }

            .image-slider img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: none;
            }

                .image-slider img.active {
                    display: block;
                    animation: fadeIn 0.5s ease-in-out;
                }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .slider-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0,0,0,0.6);
            color: #fff;
            border: none;
            padding: 6px 10px;
            cursor: pointer;
            border-radius: 50%;
        }

            .slider-btn.prev {
                left: 10px;
            }

            .slider-btn.next {
                right: 10px;
            }

        /* Info layout inside GridView cell */
        .info-sections {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .info-section {
            background: #f9f9f9;
            border-radius: 8px;
            padding: 12px;
        }

            .info-section h3 {
                font-size: 15px;
                margin-bottom: 8px;
                color: #333;
                border-bottom: 1px solid #ddd;
                padding-bottom: 4px;
            }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 8px 20px;
        }

        .info-item {
            font-size: 14px;
            color: #444;
        }

            .info-item strong {
                color: #000;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER (your nav) -->
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
                            <asp:HyperLink ID="login" runat="server" NavigateUrl="login.aspx" Text="Login"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="register" runat="server" NavigateUrl="register.aspx" Text="Register"></asp:HyperLink></li>
                        <li>
                            <asp:Panel ID="profile" runat="server" CssClass="profile-container">
                                
                                <input type="checkbox" id="toggleProfile" class="toggle-checkbox" />

                                
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
            <div>
                <center>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="car-grid" GridLines="None">
                        <Columns>

                            <asp:TemplateField HeaderText="Car Images">
                                <ItemTemplate>
                                    <div class="image-slider" data-images='["<%# Eval("image1") %>","<%# Eval("image2") %>","<%# Eval("image3") %>","<%# Eval("image4") %>","<%# Eval("image5") %>"]'>
                                        <img src="<%# Eval("image1") %>" class="active" />
                                        <span class="slider-btn prev">&#10094;</span>
                                        <span class="slider-btn next">&#10095;</span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Details">
                                <ItemTemplate>
                                    <div class="info-sections">

                                        <div class="info-section">
                                            <h3>Car Information</h3>
                                            <div class="info-grid">
                                                <div class="info-item"><strong>Brand:</strong> <%# Eval("Brand") %></div>
                                                <div class="info-item"><strong>Model:</strong> <%# Eval("Model") %></div>
                                                <div class="info-item"><strong>Year:</strong> <%# Eval("Year") %></div>
                                                <div class="info-item"><strong>Mileage:</strong> <%# Eval("Mileage") %> km</div>
                                                <div class="info-item"><strong>Fuel:</strong> <%# Eval("FuelType") %></div>
                                                <div class="info-item"><strong>Transmission:</strong> <%# Eval("Transmission") %></div>
                                                <div class="info-item"><strong>Price:</strong> $<%# Eval("Price") %></div>
                                                <div class="info-item"><strong>Description:</strong> <%# Eval("Description") %></div>
                                            </div>
                                        </div>

                                        <div class="info-section">
                                            <h3>Holder Information</h3>
                                            <div class="info-grid">
                                                <div class="info-item"><strong>Name:</strong> <%# Eval("HolderName") %></div>
                                                <div class="info-item"><strong>Email:</strong> <%# Eval("HolderEmail") %></div>
                                                <div class="info-item"><strong>Phone:</strong> <%# Eval("HolderPhone") %></div>
                                                <div class="info-item"><strong>Country:</strong> <%# Eval("HolderCountry") %></div>
                                                <div class="info-item"><strong>State:</strong> <%# Eval("HolderState") %></div>
                                                <div class="info-item"><strong>City:</strong> <%# Eval("HolderCity") %></div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </center>

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
                        <li><a href="car-buy.aspx">Buy Cars</a></li>
                        <li><a href="car-sell.aspx">Sell Cars</a></li>
                        <li><a href="all-cars.aspx">All Cars</a></li>
                        <li><a href="about.aspx">About Us</a></li>
                        <li><a href="contact.aspx">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="faq.aspx">FAQ</a></li>
                        <li><a href="testimonials.aspx">Testimonials</a></li>
                        <li><a href="contact.aspx">Help Center</a></li>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".image-slider").forEach(slider => {
            let images = JSON.parse(slider.getAttribute("data-images"))
                .filter(src => src && src.trim() !== ""); // remove empty/null

            let imgTag = slider.querySelector("img");
            let index = 0;

            function showImage(i) {
                imgTag.src = images[i];
            }

            slider.querySelector(".prev").addEventListener("click", () => {
                index = (index - 1 + images.length) % images.length;
                showImage(index);
            });

            slider.querySelector(".next").addEventListener("click", () => {
                index = (index + 1) % images.length;
                showImage(index);
            });
        });
    });

</script>
</html>
