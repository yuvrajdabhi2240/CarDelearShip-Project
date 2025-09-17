<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Database_Connectivity.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - CarDealer</title>
<link rel="stylesheet" href="css/styles.css">
<style>
    .error-message {
        color: #d8000c;
        background-color: #ffd2d2;
        border: 1px solid #d8000c;
        padding: 10px 13px;
        margin: 10px 0;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 500;
        display: inline-block;
        align-items: center;
        gap: 8px;
        box-shadow: 0px 2px 6px rgba(216, 0, 12, 0.2);
        animation: fadeIn 0.3s ease-in-out, fadeOut 1s ease-in-out 4s forwards;
        /* fadeOut starts after 4s → ends at 5s */
    }

        .error-message::before {
            content: "⚠️";
            font-size: 14px;
        }

    /* Fade in */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-5px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Fade out */
    @keyframes fadeOut {
        0% {
            opacity: 1;
            transform: translateY(0);
            height: auto;
            margin: 10px 0;
            padding: 10px 15px;
            visibility: visible;
        }

        100% {
            opacity: 0;
            transform: translateY(-5px);
            height: 0;
            margin: 0;
            padding: 0;
            border: 0;
            visibility: hidden; /* removes the box but keeps flow clean */
        }
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <div class="form-container">
                <h2 class="section-title">Login to Your Account</h2>
                <form class="auth-form">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" name="remember" id="remember">
                            <span class="checkmark"></span>
                            Remember me
                        </label>
                    </div>

                    <asp:Button ID="Button1" runat="server" class="btn" Text="Login" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" CssClass="error-message" runat="server" Text="Label" ViewStateMode="Enabled" Display="Dynamic" Visible="False"></asp:Label>
                

                    <div class="auth-links">
                        <a href="#" class="forgot-password">Forgot Password?</a>
                        <p class="register-link">Don't have an account? <a href="register.aspx">Register here</a></p>
                    </div>
                </form>
            </div>
        </main>
    </form>
</body>

<script src="js/script.js"></script>

</html>
