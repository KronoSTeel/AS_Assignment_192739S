<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AS_Assignment_192739S.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 126px;
        }
        .auto-style3 {
            width: 201px;
        }
        .auto-style4 {
            width: 84px;
        }
        .auto-style5 {
            width: 118px;
        }
    </style>
    <script src="https://www.google.com/recaptcha/api.js?render=6LfTI0gaAAAAAF1rX5bYAqghchMyhxbK9Pzbins4"></script>
    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tb_Passwd.ClientID %>').value;

            if (str.length < 8) {
                document.getElementById("lb_PasswdChecker").innerHTML = "Password Length must be at least 8 characters";
                document.getElementById("lb_PasswdChecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lb_PasswdChecker").innerHTML = "Password require at least 1 number";
                document.getElementById("lb_PasswdChecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lb_PasswdChecker").innerHTML = "Password require at least 1 upper case letter";
                document.getElementById("lb_PasswdChecker").style.color = "Red";
                return ("no_uppercase");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lb_PasswdChecker").innerHTML = "Password require at least 1 lower case letter";
                document.getElementById("lb_PasswdChecker").style.color = "Red";
                return ("no_lowercase");
            }

            else if (str.search(/[$@$!%*?&]/) == -1) {
                document.getElementById("lb_PasswdChecker").innerHTML = "Password require at least 1 special character";
                document.getElementById("lb_PasswdChecker").style.color = "Red";
                return ("no_special");
            }

            document.getElementById("lb_PasswdChecker").innerHTML = "Excellent!";
            document.getElementById("lb_PasswdChecker").style.color = "Blue";

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>
            <asp:Label ID="lb_Registration" runat="server" Text="Registration"></asp:Label>
            </h1>
        </div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_FName" runat="server" Text="First Name:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_FName" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lb_LName" runat="server" Text="Last Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_LName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_CreditCardNo" runat="server" Text="Credit Card No.:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_CCNo" runat="server" Width="187px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" colspan="2">
                        <asp:Label ID="lb_CCMsg" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_CVV" runat="server" Text="CVV: "></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_CVV" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lb_ExpDate" runat="server" Text="Expiry Date (MM/YYYY):"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_ExpDate" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_Email" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_Email" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4" colspan="2">
                        <asp:Label ID="lb_EmailChecker" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_DOB" runat="server" Text="Date of Birth:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_DOB" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_Password" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_Passwd" runat="server" onkeyup="validate()" TextMode="Password"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lb_PasswdChecker" runat="server"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_ConfirmPasswd" runat="server" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_CnfmPasswd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style4" colspan="2">
                        <asp:Label ID="lb_CnfmChecker" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btn_Register" runat="server" OnClick="btn_Register_Click" Text="Register" />
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="btn_GotoLogin" runat="server" OnClick="btn_GotoLogin_Click" Text="Go to Login" />
                    </td>
                    <td class="auto-style4" colspan="2">
                        &nbsp;</td>
                    
                </tr>
            </table>
        </div>
        <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response" />
    </form>
    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute('6LfTI0gaAAAAAF1rX5bYAqghchMyhxbK9Pzbins4', { action: "Register" }).then(function (token) {
                document.getElementById("g-recaptcha-response").value = token;
            });
        });
    </script>
</body>
</html>
