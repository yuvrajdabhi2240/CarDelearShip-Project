<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CarDelearShip_Project.photo.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - CarDealer</title>
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
        <h1 class="section-title">Contact Us</h1>
        <div class="form-container">
            <h2>Get in Touch</h2>
            <form id="contact-form">
                <div class="form-group">
                    <label for="name">Full Name *</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone">
                </div>

                <div class="form-group">
                    <label for="subject">Subject *</label>
                    <select id="subject" name="subject" required>
                        <option value="">Select Subject</option>
                        <option value="general">General Inquiry</option>
                        <option value="buying">Buying a Car</option>
                        <option value="selling">Selling a Car</option>
                        <option value="support">Technical Support</option>
                        <option value="feedback">Feedback</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="message">Message *</label>
                    <textarea id="message" name="message" rows="5" placeholder="Please describe your inquiry..." required></textarea>
                </div>

                <button type="submit" class="btn">Send Message</button>
            </form>
        </div>


        <div class="card">
            <h3>Contact Information</h3>
            <div class="contact-info">
                <p><strong>Address:</strong> 123 Car Street, Auto City, AC 12345</p>
                <p><strong>Phone:</strong> +1 (555) 123-4567</p>
                <p><strong>Email:</strong> info@cardealer.com</p>
                <p><strong>Hours:</strong> Monday - Friday: 9:00 AM - 6:00 PM</p>
            </div>
        </div>

        <div class="card">
            <h3>Frequently Asked Questions</h3>
            <div class="faq-section">
                <h4>How do I list my car for sale?</h4>
                <p>Simply fill out our car listing form on the "Sell Cars" page with all the required information about your vehicle.</p>

                <h4>How do I contact a seller?</h4>
                <p>Each car listing includes contact information for the seller. You can reach out directly through the provided phone number or email.</p>

                <h4>Is there a fee to list my car?</h4>
                <p>No, listing your car is completely free. We only charge a small commission when the car is successfully sold.</p>
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

    <script src="js/script.js"></script>
</body>
</html>
