<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AS_Assignment_192739S.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 69px;
        }
    </style>
    <script src="https://www.google.com/recaptcha/api.js?render=6LfTI0gaAAAAAF1rX5bYAqghchMyhxbK9Pzbins4"></script>
</head>
<body>
    <form id="form2" runat="server">
        <h1>
            <asp:Label ID="lb_LoginHeader" runat="server" Text="Login"></asp:Label>
        </h1>
        <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_EmailLogin" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_EmailLogin" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_Password" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_PasswordLogin" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btn_Login" runat="server" Text="Login" OnClick="btn_Login_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btn_GotoRegister" runat="server" OnClick="btn_GotoRegister_Click" Text="Go to Register" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
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

