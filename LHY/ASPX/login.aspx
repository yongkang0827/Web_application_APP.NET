<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="test2.LHY.ASPX.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <style>
        body{
            background-image:url("../IMG/123.jpeg");
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size: 100% 100%;
        }
        .header{
            text-align:center;
            padding-top:20px;
            padding-bottom:5%;
        }
        .footer{
          text-align:center;
          position:absolute;
          bottom:0;
          width:99%;
          height:60px;
        }
        .imgSize{
            width:200px;
          
        }
        .imgSize2{
            width:180px;
          
        }
        table.form{
            margin-left: auto;
            margin-right: auto;
            table-layout: auto;
            font-size: 20px;
        }
        .buttonLogin {
        background-color: blue;
        border: none;
        color: white;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        }
        .buttonLogin:hover {
                opacity:0.5;
                 color: white;
            }
        .buttonSignUp {
        background-color:mediumseagreen;
        border: none;
        color: white;
        padding: 10px 21px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        }
        .buttonSignUp:hover {
                opacity:0.8;
                 color: white;
            }
        .textfield{
            border:2px solid;
            background-color:aliceblue;
             padding: 5px 5px;
        }
        .pass{
            border:2px solid;
            background-color:aliceblue;
             padding: 5px 5px;
        }
        .ddlRole{
            color: #fff;
            font-size: 16px;
            padding: 5px 5px;
            border-radius: 5px;
            background-color: #cc2a41;
            font-weight: bold;
}

    </style>
    <title></title>
</head>
<body>
    <div class="header">
        <img src="../IMG/logo.png" class="imgSize"/>
    </div>

   <form runat="server">
        <table class="form">
            <tr><td colspan="2">
                <img src="../IMG/user icon.png" class="imgSize2"/></td></tr>
            <tr><td colspan="2">
                <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></td></tr>
            <tr><td colspan="2">
                <asp:TextBox ID="txtUsername" runat="server" class="textfield"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:Label ID="lblPassw" runat="server" Text="Password" ></asp:Label></td></tr>
            <tr><td colspan="2">
                <asp:TextBox ID="txtPassw" runat="server" TextMode="Password" class="pass"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:DropDownList ID="ddlRole" runat="server" class="ddlRole">
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Artist</asp:ListItem>
                </asp:DropDownList></td></tr>
            <tr><td colspan="2">
                <asp:CheckBoxList ID="cblRmbPassw" runat="server">
                    <asp:ListItem>Remember Password</asp:ListItem>
                </asp:CheckBoxList></td></tr>
            <tr><td colspan="2">
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="buttonLogin" OnClick="btnLogin_Click"/></td></tr>
            <tr><td colspan="2">
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" class="buttonSignUp" PostBackUrl="CreateUser.aspx"/></td></tr>
            <tr><td colspan="2"><a href="login.aspx">Forgot password? </a></td></tr>
     
        </table>

    </form>
   <div class="footer">
       <p">COPYRIGHT © 2021 ART. ALL RIGHTS RESERVED</p>
   </div>
</body>
</html>
