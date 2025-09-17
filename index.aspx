<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CarDelearShip_Project.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <title></title>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/profile.css">
    </head>
    <body>
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
        <section class="hero">
            <div class="hero-content">
                <h1>Find Your Perfect Car</h1>
                <p>
                    Buy and sell second-hand cars with confidence
                </p>
                <a href="car-buy.html" class="btn">Browse Cars</a> <a href="car-sell.html" class="btn btn-secondary">Sell Your Car</a>
            </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main>

        <div class="form-container">
            <h2>Get in Touch</h2>
            <form id="contact-form">
                <div class="form-group">
                    <label for="name">Full Name *</label>
                    <asp:TextBox ID="name" runat="server"></asp:TextBox></td>
                </div>
                <div class="form-group">
                    <label for="Gender">Gender : </label>
                    <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="city">
                        City</label>
                    <asp:DropDownList ID="city" runat="server">
                        <asp:ListItem>--- Select City ---</asp:ListItem>
                        <asp:ListItem>Rajkot</asp:ListItem>
                        <asp:ListItem>Pune</asp:ListItem>
                        <asp:ListItem>Mubai</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="city">
                        Images</label>
                    <asp:FileUpload ID="file" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Class="btn" Text="Save" OnClick="Button1_Click" />
                </div>
            </form>
            <div>
                <h1>Show Data : </h1>
                <div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="Id">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Email"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Image"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete"></asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>
        <div class="search-form">
            <h2>Search Cars</h2>
            <form>
                <div class="form-group">
                    <label for="brand">
                        Brand</label>
                    <select id="brand" name="brand">
                        <option value="">Any Brand</option>
                        <option value="toyota">Toyota</option>
                        <option value="honda">Honda</option>
                        <option value="ford">Ford</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">
                        Max Price</label>
                    <select id="price" name="price">
                        <option value="">Any Price</option>
                        <option value="10000">$10,000</option>
                        <option value="20000">$20,000</option>
                    </select>
                </div>
                <button type="submit" class="btn">
                    Search
                </button>
            </form>
        </div>
        <h2 class="section-title">Featured Cars</h2>
        <div class="car-grid">
            <div class="car-card">
                <img src="images/car1.jpg" alt="Car 1" class="car-image">
                <div class="car-details">
                    <h3 class="car-title">Toyota Camry 2022</h3>
                    <div class="car-price">
                        $25,000
                    </div>
                    <div class="car-info">
                        <span>2022</span> <span>15,000 km</span>
                    </div>
                    <a href="#" class="btn">View Details</a>
                </div>
            </div>
        </div>
    </main>
    </div>
    </label>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>CarDealer</h3>
                <p>
                    Your trusted platform for buying and selling second-hand cars with confidence. We connect buyers and sellers in a secure, transparent marketplace.
                </p>
                <div class="social-links">
                    <a href="#" title="Facebook">f</a> <a href="#" title="Twitter">t</a> <a href="#" title="Instagram">i</a> <a href="#" title="LinkedIn">in</a>
                </div>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="car-buy.aspx">Buy Cars</a></li>
                    <li><a href="car-sell.aspx">Sell Cars</a></li>
                    <li><a href="all-cars.aspx">All Cars</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
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
                <p>
                    📍 123 Car Street, Auto City, AC 12345
                </p>
                <p>
                    📞 (555) 123-4567
                </p>
                <p>
                    ✉️ info@cardealer.com
                </p>
                <p>
                    🕒 Mon-Fri: 9AM-6PM
                </p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>
                &copy; 2024 CarDealer. All rights reserved. | Designed with ❤️ for car enthusiasts
            </p>
        </div>
    </footer>

    <script src="js/script.js"></script>
    </body>
</html>
</asp:Content>

