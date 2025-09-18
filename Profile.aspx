<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CarDelearShip_Project.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/Profilepage.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/profile.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <div class="nav-container">
                    <a href="index.html" class="logo">CarDealer</a>
                    <button class="mobile-menu-btn" id="mobileMenuBtn">
                        ☰
                    </button>
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

                                    <input type="checkbox" id="toggleProfile" class="toggle-checkbox" />


                                    <label for="toggleProfile">
                                        <asp:Image ID="imgProfile" runat="server"
                                            CssClass="profile-pic" Height="39px" />
                                    </label>


                                    <div class="dropdown">
                                        <asp:LinkButton ID="lnkProfile" runat="server" ForeColor="Black" OnClick="lnkProfile_Click">👤 Profile</asp:LinkButton>
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

                <section class="profile-section" aria-labelledby="profileTitle">
                    <h1 id="profileTitle" class="profile-header">My Profile</h1>
                    <div class="profile-card">
                        <div class="profile-media">
                            <asp:Image ID="profileAvatar" runat="server" CssClass="profile-avatar" />
                        </div>
                        <form class="profile-form" autocomplete="on">
                            <div class="profile-row">
                                <div class="profile-group">
                                    <label for="username">Username</label>
                                    <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                                    <asp:TextBox ID="username" runat="server" Visible="false"></asp:TextBox>
                                </div>
                                <div class="profile-group">
                                    <label for="emailProfile">Email</label>
                                    <asp:Label ID="email" runat="server" Text="Label"></asp:Label>
                                    <asp:TextBox ID="emailProfile" runat="server" Visible="false"></asp:TextBox>
                                </div>



                                <div class="profile-group">
                                    <label for="phone">Phone</label>
                                    <asp:Label ID="phonenumber" runat="server" Text="Label"></asp:Label>
                                    <asp:TextBox ID="phone" runat="server" Visible="false"></asp:TextBox>
                                </div>
                                <div class="profile-group">
                                    <label for="country">Country</label>
                                    <asp:Label ID="countryes" runat="server" Text="Label"></asp:Label>
                                    <asp:DropDownList ID="country" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="country_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                                <div class="profile-group">
                                    <label for="state">State</label>
                                    <asp:Label ID="states" runat="server" Text="Label"></asp:Label>
                                    <asp:DropDownList ID="state" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="state_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="profile-group">
                                    <label for="city">City</label>
                                    <asp:Label ID="citys" runat="server" Text="Label"></asp:Label>
                                    <asp:DropDownList ID="city" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="city_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                            <!-- 
                            <div class="profile-row">
                                <div class="profile-group">
                                    <label for="photo">Profile Photo</label>
                                    
                                    <input type="file" id="photo" name="photo" accept="image/*">
                                </div>
                                
                                <div class="profile-group">
                                    <label>&nbsp;</label>
                                    <button type="button" class="btn-outline" id="previewBtn">Preview Photo</button>
                                </div>
                            </div>
                            -->

                            <div class="profile-actions">
                                <asp:Button ID="edit" runat="server" CssClass="btn" Text="Edit Profile" OnClick="edit_Click" />

                                <asp:Button ID="save" runat="server" CssClass="btn" Text="Save Profile" Visible="False" />
                            </div>
                        </form>
                    </div>
        </section>
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



        </div>
    </form>
</body>

</html>
