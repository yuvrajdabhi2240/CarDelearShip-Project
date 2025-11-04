<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inbox.aspx.cs" Inherits="CarDelearShip_Project.inbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="css/styles.css"\>
    <link rel="stylesheet" href="css/inbox.css"\>

</head>
<body>
    <form id="form1" runat="server">
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
        
        <div>   
            <main>
        <h1 class="section-title">Message Inbox</h1>

        <div class="inbox-container card">
            <div class="inbox-header">
                <h2>Your Messages</h2>
                <button class="btn btn-secondary" id="readAllBtn">Mark All as Read</button>
            </div>

            <ul class="message-list">
                <li class="message-item unread">
                    <div class="message-content">
                        <strong class="message-sender">John Doe</strong>
                        <p class="message-preview">Inquiry about your 2022 Toyota Camry. Is it still available for a test drive this weekend?</p>
                        <span class="message-time">2 hours ago</span>
                    </div>
                    <div class="message-actions">
                        <button class="btn btn-small read-btn">Read</button>
                        <button class="btn btn-small btn-outline cancel-btn">Cancel</button>
                    </div>
                </li>

                <li class="message-item unread">
                    <div class="message-content">
                        <strong class="message-sender">Jane Smith</strong>
                        <p class="message-preview">I'm interested in the 2021 BMW 3 Series. Could you provide more photos of the interior?</p>
                        <span class="message-time">Yesterday</span>
                    </div>
                    <div class="message-actions">
                        <button class="btn btn-small read-btn">Read</button>
                        <button class="btn btn-small btn-outline cancel-btn">Cancel</button>
                    </div>
                </li>

                <li class="message-item read">
                    <div class="message-content">
                        <strong class="message-sender">Michael Chen</strong>
                        <p class="message-preview">Thank you for the quick sale of my Honda Civic! The process was very smooth.</p>
                        <span class="message-time">3 days ago</span>
                    </div>
                    <div class="message-actions">
                        <button class="btn btn-small read-btn">Read</button>
                        <button class="btn btn-small btn-outline cancel-btn">Cancel</button>
                    </div>
                </li>

                <li class="message-item read">
                    <div class="message-content">
                        <strong class="message-sender">Support Team</strong>
                        <p class="message-preview">Your listing for the Ford Focus has been approved and is now live on the website.</p>
                        <span class="message-time">Last week</span>
                    </div>
                    <div class="message-actions">
                        <button class="btn btn-small read-btn">Read</button>
                        <button class="btn btn-small btn-outline cancel-btn">Cancel</button>
                    </div>
                </li>
            </ul>
        </div>
    </main>

        </div>
    </form>
</body>
</html>
