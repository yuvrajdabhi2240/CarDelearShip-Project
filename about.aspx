<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="CarDelearShip_Project.photo.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - CarDealer</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
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
                    <li><a href="login.aspx">Login</a></li>
                    <li><a href="register.aspx">Register</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <h1 class="section-title">About CarDealer</h1>

        <div class="card">
            <h2>Our Story</h2>
            <p>CarDealer was founded in 2020 with a simple mission: to make buying and selling second-hand cars easier, safer, and more transparent for everyone. We believe that everyone deserves access to quality vehicles at fair prices.</p>

            <p>What started as a small local platform has grown into one of the most trusted car marketplace websites, serving thousands of customers across the country. Our commitment to quality, transparency, and customer satisfaction has remained at the core of everything we do.</p>
        </div>

        <div class="card">
            <h2>Our Mission</h2>
            <p>To provide a secure, user-friendly platform that connects car buyers and sellers, making the car buying and selling process as smooth and trustworthy as possible.</p>
        </div>

        <div class="card">
            <h2>Our Values</h2>
            <ul>
                <li><strong>Trust:</strong> We verify all listings and provide secure payment options</li>
                <li><strong>Transparency:</strong> Honest pricing and detailed vehicle information</li>
                <li><strong>Quality:</strong> Only quality vehicles make it to our platform</li>
                <li><strong>Customer Service:</strong> 24/7 support for all our users</li>
                <li><strong>Innovation:</strong> Constantly improving our platform and services</li>
            </ul>
        </div>

        <div class="card">
            <h2>Why Choose CarDealer?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <h3>Verified Listings</h3>
                    <p>Every car on our platform goes through a thorough verification process to ensure quality and authenticity.</p>
                </div>
                <div class="feature-card">
                    <h3>Secure Transactions</h3>
                    <p>Our secure payment system protects both buyers and sellers throughout the transaction process.</p>
                </div>
                <div class="feature-card">
                    <h3>Expert Support</h3>
                    <p>Our team of automotive experts is always available to help you make informed decisions.</p>
                </div>
            </div>
        </div>

        <div class="card">
            <h2>Our Team</h2>
            <p>CarDealer is powered by a team of passionate automotive enthusiasts, technology experts, and customer service professionals. We work together to ensure that every user has the best possible experience on our platform.</p>
        </div>

        <div class="card">
            <h2>Contact Us</h2>
            <p>Have questions about CarDealer? We'd love to hear from you! Contact our team at <a href="mailto:info@cardealer.com">info@cardealer.com</a> or call us at +1 (555) 123-4567.</p>
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
</body>
</html>
