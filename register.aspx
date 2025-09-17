<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CarDelearShip_Project.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .error-message {
            color: #f44336; /* Red color for visibility */
            background-color: #fdecea; /* Light red background */
            border-left: 4px solid #f44336; /* Highlight the error */
            padding: 5px 10px;
            margin-top: 5px;
            font-family: Arial, sans-serif;
            font-size: 13px;
            border-radius: 10px; /* Rounded corners */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <main>
                <div class="form-container">
                    <h2 class="section-title">Create Your Account</h2>
                    <form class="auth-form">
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <asp:TextBox ID="fullName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ControlToValidate="fullname" ErrorMessage="Please enter an fullname"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="email" Display="None" runat="server" ErrorMessage="Please enter an email"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None" ErrorMessage="Please enter proper formate of email" ControlToValidate="email" SetFocusOnError="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="phone" Display="None" runat="server" ErrorMessage="Please enter an phone number"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="None" ErrorMessage="Please enter check phone number" ControlToValidate="phone" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                        </div>




                        <div class="form-group">
                            <label for="country">Country</label>
                            <asp:DropDownList ID="country" runat="server" AutoPostBack="True" OnSelectedIndexChanged="country_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" Display="None" runat="server" ControlToValidate="country" ErrorMessage="Please select Country"></asp:RequiredFieldValidator>
                        </div>



                        <div class="form-group">
                            <label for="state">State/Province</label>
                            <asp:DropDownList ID="state" runat="server" AutoPostBack="True" OnSelectedIndexChanged="state_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" Display="None" runat="server" ControlToValidate="state" ErrorMessage="Please select State"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="city">City</label>
                            <asp:DropDownList ID="city" runat="server" AutoPostBack="True" OnSelectedIndexChanged="city_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" Display="Dynamic" runat="server" ControlToValidate="city" ErrorMessage="Please select city"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="profileimage">Profile Picture</label>
                            <asp:FileUpload ID="ProfileImage" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" Display="None" runat="server" ControlToValidate="ProfileImage" ErrorMessage="Please add there image"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" ControlToValidate="password" runat="server" ErrorMessage="Please enter an password"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ControlToValidate="password" ControlToCompare="confirmpassword" ErrorMessage="Please Check there password and confirm password must be same"></asp:CompareValidator>
                        </div>

                        <asp:Button ID="Button1" class="btn" runat="server" Text="Create" OnClick="Button1_Click" />
                        <asp:ValidationSummary ID="ValidationSummary1" CssClass="error-message" Display="None" runat="server" />

                        <div class="auth-links">
                            <p class="login-link">Already have an account? <a href="login.aspx">Login here</a></p>
                        </div>
                    </form>
                </div>
            </main>

            <script src="js/script.js"></script>
        </div>
    </form>
</body>
</html>
