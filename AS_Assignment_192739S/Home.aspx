<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AS_Assignment_192739S.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 108px;
        }
        .auto-style3 {
            width: 108px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 213px;
        }
        .auto-style6 {
            height: 23px;
            width: 213px;
        }
        .auto-style7 {
            width: 79px;
        }
        .auto-style8 {
            height: 23px;
            width: 79px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lb00" runat="server" Text="Profile Page"></asp:Label>
        </div>
        <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_ProfileEmail" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lb_DispEmail" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lb_ProfileFName" runat="server" Text="First Name: "></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="lb_DispFName" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lb_ProfileLName" runat="server" Text="Last Name:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="lb_DispLName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_ProfileCCNo" runat="server" Text="Credit Card No:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lb_DispCCNo" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lb_ProfileExpDate" runat="server" Text="Expiry Date:"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="lb_DispExpDate" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lb_ProfileCVV" runat="server" Text="CVV:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="lb_DispCVV" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lb_ProfileDOB" runat="server" Text="Date of Birth:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lb_DispDOB" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btn_Logout" runat="server" OnClick="btn_Logout_Click" Text="Logout" />
                    </td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
    </form>
</body>
</html>