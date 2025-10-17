<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="CarDelearShip_Project.CarDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Details</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/profile.css" />
    <link rel="stylesheet" href="css/All-Car.css" />
    <link rel="stylesheet" href="css/compaircar.css" />
    <style>
        .backendform {
            /* White Card Appearance */
            background-color: #ffffff;
            border-radius: 12px; /* Soft, modern corners */
            padding: 30px 40px;
            width: 100%;
            border-radius: 50px;
            /* Subtle Shadow for Depth (makes it "pop") */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border: 1px solid #e0e0e0; /* Very light border */
        }

        .book {
            margin-top: 10px;
            width: 100%;
        }


        .product-car {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .car-show {
            margin-top: 15px;
        }

        .checkbook {
            /* Visual Styling */
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white; /* White text for contrast */
            border: 2px solid black; /* A slightly darker green border */
            border-radius: 10px; /* Rounded corners for a modern look */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Soft shadow for depth */
            /* Text Styling */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: bold; /* Make the text stand out */
            font-size: 1.2em; /* Slightly larger than standard text */
            text-transform: uppercase; /* All caps for impact */
            /* Spacing and Positioning */
            padding: 3px 10px; /* Padding inside the box */
            margin: 10px 0; /* Margin above/below to separate it from other content */
            display: inline-block; /* Allows padding and margin to be applied correctly */
            letter-spacing: 1px; /* Spacing between letters */
        }

            /* Optional: A hover effect for a bit of flair */
            .checkbook:hover {
                background-color: #388E3C;
                cursor: default; /* Change cursor to indicate it's not a clickable button */
            }

        .datetime {
            margin-top: 10px;
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
            <div class="form-group">
                <asp:DropDownList ID="compairdrop" runat="server" AutoPostBack="True" Visible="false" OnSelectedIndexChanged="compairdrop_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div>
                <!-- First DataShow -->
                <section class="backendform">
                    <div class="grid-container">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="car-grid" GridLines="None" HorizontalAlign="Center" BorderStyle="Dotted" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Car Images">
                                    <ItemTemplate>
                                        <div class="image-slider" data-images='["<%# Eval("image1") %>","<%# Eval("image2") %>","<%# Eval("image3") %>","<%# Eval("image4") %>","<%# Eval("image5") %>"]'>
                                            <img src="<%# Eval("image1") %>" class="active" />
                                            <span class="slider-btn prev">&#10094;</span>
                                            <span class="slider-btn next">&#10095;</span>
                                        </div>
                                        <center>
                                            <div class="compair_btn">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Compare" CommandName="compare" OnClick="Button1_Click" />
                                                <asp:Button ID="favorite" runat="server" CssClass="btn" Text='<%# Convert.ToInt32(Eval("IsFavorite")) == 1 ? "Remove ♥" : "Add To ♡" %>' CommandName="favorite" CommandArgument='<%# Container.DataItemIndex %>' ForeColor='<%# Convert.ToInt32(Eval("IsFavorite")) == 1 ? System.Drawing.Color.Red : System.Drawing.Color.Black %>' /><br />
                                                <div class="datetime">
                                                    <asp:Label ID="datelab" runat="server" Text="Select Date & Time : " Visible="False"></asp:Label>
                                                    <asp:TextBox ID="date" runat="server" Visible="false" TextMode="Date"></asp:TextBox>
                                                    <asp:TextBox ID="time" runat="server" Visible="false" TextMode="Time"></asp:TextBox>
                                                </div>
                                                <div class="book">
                                                    <asp:Button ID="book" runat="server" CssClass="btn " CommandName="BookSchedual" Text="Test Car Schedual" Visible="False" />
                                                </div>
                                                <asp:Label ID="checkbook" runat="server" class="checkbook" Text="It's Your Car" Visible="False"></asp:Label>
                                            </div>
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Detials">
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
                    </div>
                </section>
                <!-- Show DropDown Form Compair 2 Cars-->


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

            <div class="car-show">
                <asp:GridView ID="GridView2" runat="server"
                    AutoGenerateColumns="False"
                    class="product-grid"
                    GridLines="None"
                    ShowHeader="False"
                    DataKeyNames="id" OnRowCommand="GridView2_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="car-card">
                                    <img src='<%# Eval("Image1") %>' alt="Car" class="product-car" />
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

                                        <asp:Button ID="favoritecars" runat="server" CssClass="btn hearth" Text='<%# Convert.ToInt32(Eval("IsFavorite")) == 1 ? "Remove ♥" : "Add To ♡" %>' CommandName="viewcarfavorite" CommandArgument='<%# Container.DataItemIndex %>' ForeColor='<%# Convert.ToInt32(Eval("IsFavorite")) == 1 ? System.Drawing.Color.Red : System.Drawing.Color.Black %>' />

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </main>
    </form>

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
