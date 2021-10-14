<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="test2.LHY.ASPX.CreateUser" %>

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
            padding-right:10px;
           padding-bottom:70px;
        }
        .footer{
          text-align:center;
          position:absolute;
          bottom:0;
          width:99%;
          height:55px;
          padding-left:10px;
        }
        .imgSize{
            width:200px;
          
        }
        table.form{
            
            table-layout: auto;
            font-size: 20px;
            margin-left:auto;
            margin-right:39%;

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
        .buttonCreate {
        background-color:mediumseagreen;
        border: none;
        color: white;
        padding: 10px 21px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        }
        .buttonCreate:hover {
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
            padding-top:5px;
            padding-bottom:5px;
}
         .auto-style1 {
             margin-bottom: 0px;
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
                <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></td></tr>
            <tr><td colspan="2">
                <asp:TextBox ID="txtUsername" runat="server" class="textfield" placeholder="First name and Last name" AutoPostBack="True" OnTextChanged="txtUsername_TextChanged"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label></td></tr>
            <tr><td colspan="2">
                <asp:TextBox ID="txtPhone" runat="server" class="textfield" placeholder="01xxxxxxxxx"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:Label ID="lblPassw" runat="server" Text="Password" ></asp:Label></td></tr>
            <tr><td colspan="2">
                <asp:TextBox ID="txtPassw" runat="server" TextMode="Password" class="pass"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:Label ID="lblComfirmPassw" runat="server" Text=" Comfirm Password" ></asp:Label></td></tr>
            <tr><td colspan="2">
                <asp:TextBox ID="txtComfirmPassw" runat="server" TextMode="Password" class="pass"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:DropDownList ID="ddlRole" runat="server" class="ddlRole">
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Artist</asp:ListItem>
                </asp:DropDownList></td></tr>
            <tr><td colspan="2">
                <asp:CheckBoxList ID="cblTNC" runat="server">
                    <asp:ListItem>Agree to Terms and Condition</asp:ListItem>
                </asp:CheckBoxList></td></tr>
            <tr><td colspan="2">
                <asp:Button ID="btnCreate" runat="server" Text="Create User" class="buttonCreate" OnClick="btnCreate_Click"/></td></tr>
                <tr><td colspan="2">Already have an account? <a href="login.aspx">Sign In</a></td></tr>
        </table>

    </form>
   <div class="footer">
       <p">COPYRIGHT © 2021 ART. ALL RIGHTS RESERVED</p>
   </div>
</body>
</html>
