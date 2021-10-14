<%@ Page Language="C#"  MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MakePayment.aspx.cs" Inherits="test2.LMY.ASPX.MakePayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <style>
        .imgSize2{
            width:180px;
          
        }

        
    </style>

        <div class="div1">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <table>
                  <tr><td>
                        <img src="../IMG/card.png" class="imgSize2"/></td></tr>
                    <tr><td>
                        <asp:Label ID="lblCardNumber" runat="server" Text="Card Number"></asp:Label></td></tr>
                    <tr><td>
                        <asp:TextBox ID="txtCardNumber" runat="server" class="textfield"></asp:TextBox></td></tr>
                    <tr><td>
                        <asp:Label ID="lblCVV" runat="server" Text="CVV" ></asp:Label></td></tr>
                    <tr><td>
                        <asp:TextBox ID="txtCVV" runat="server" TextMode="Password" class="pass"></asp:TextBox></td></tr>
                    <tr><td>
                        <asp:Label ID="lblPin" runat="server" Text="Pin Number" ></asp:Label></td></tr>
                    <tr><td>
                        <asp:TextBox ID="txtPin" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:Button ID="btnPin" runat="server" Text="Pin Number" onClick="PinNumber"/>
                    </tr>
                <tr><td>
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" /></td><td class="auto-style1">
                    </td></tr>
               </table>

        </div>
</asp:Content>
