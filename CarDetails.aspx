<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="CarDelearShip_Project.CarDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Details</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/profile.css" />
    <link rel="stylesheet" href="css/compaircar.css" />
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
            <div class="compair_btn">
                <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Compare" OnClick="Button1_Click" />
            </div>
            <div>
                <!-- First DataShow -->
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
                <!-- Show DropDown Form Compair 2 Cars-->
                <div class="form-group">
                    <asp:DropDownList ID="compairdrop" runat="server" AutoPostBack="True" Visible="false" OnSelectedIndexChanged="compairdrop_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <!-- Panel -->
                <asp:Panel ID="pnlCompare" runat="server" CssClass="compare-panel" Visible="false">

                    <!-- Header -->
                    <div class="compare-header">
                        <div class="feature-title">Feature</div>
                        <div class="feature-title">Selected Car</div>
                        <div class="feature-title">Compared Car</div>
                    </div>

                    <!-- Image -->
                    <div class="compare-row">
                        <div class="feature-title">Image</div>
                        <div class="car-value">
                            <asp:Image ID="imgcar1" runat="server" CssClass="car-image" />
                        </div>
                        <div class="car-value">
                            <asp:Image ID="imgcar2" runat="server" CssClass="car-image" />
                        </div>
                    </div>

                    <!-- Brand -->
                    <div class="compare-row">
                        <div class="feature-title">Brand</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Brand" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Brand" runat="server"></asp:Label>
                        </div>
                    </div>

                    <!-- Model -->
                    <div class="compare-row">
                        <div class="feature-title">Model</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Model" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Model" runat="server"></asp:Label>
                        </div>
                    </div>

                    <!-- Year -->
                    <div class="compare-row">
                        <div class="feature-title">Year</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Year" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Year" runat="server"></asp:Label>
                        </div>
                    </div>

                    <!-- Mileage -->
                    <div class="compare-row">
                        <div class="feature-title">Mileage</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Mileage" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Mileage" runat="server"></asp:Label>
                        </div>
                    </div>

                    <!-- Fuel Type -->
                    <div class="compare-row">
                        <div class="feature-title">Fuel Type</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Fuel" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Fuel" runat="server"></asp:Label>
                        </div>
                    </div>

                    <!-- Transmission -->
                    <div class="compare-row">
                        <div class="feature-title">Transmission</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Trans" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Trans" runat="server"></asp:Label>
                        </div>
                    </div>

                    <!-- Price -->
                    <div class="compare-row">
                        <div class="feature-title">Price</div>
                        <div class="car-value">
                            <asp:Label ID="lblCar1Price" runat="server"></asp:Label>
                        </div>
                        <div class="car-value">
                            <asp:Label ID="lblCar2Price" runat="server"></asp:Label>
                        </div>
                    </div>

                </asp:Panel>


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
        document.querySelectorAll(".image-slider").forEach(function (slider) {
            const images = JSON.parse(slider.getAttribute("data-images"));
            const imgTag = slider.querySelector("img");
            let currentIndex = 0;

            const prevBtn = slider.querySelector(".prev");
            const nextBtn = slider.querySelector(".next");

            function showImage(index) {
                imgTag.src = images[index];
            }

            prevBtn.addEventListener("click", function () {
                currentIndex = (currentIndex - 1 + images.length) % images.length;
                showImage(currentIndex);
            });

            nextBtn.addEventListener("click", function () {
                currentIndex = (currentIndex + 1) % images.length;
                showImage(currentIndex);
            });
        });
    });
</script>
</html>
