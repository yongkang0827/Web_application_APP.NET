<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="ArtistProfile.aspx.cs" Inherits="test2.LHY.ASPX.ArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .buttonUpdate {
        background-color: blue;
        border: none;
        color: white;
        padding: 5px 30px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        }
        .buttonUpdate:hover {
                opacity:0.5;
                 color: white;
            }
        table.form{
            
            table-layout: auto;
            font-size: 20px;
            margin-left:auto;
            margin-right:45%;

        }
    </style>
    <table class="form">
            <tr><td>
                <asp:Label ID="lblUserName" runat="server" Text="User Name : "></asp:Label></td>
                <td><asp:Label ID="lblUsernameAns" runat="server"></asp:Label></td>
            </tr>
        
            <tr><td>
                <br /><br />
                <asp:Label ID="lblPhone" runat="server" Text="Phone Number :    "></asp:Label></td>
                <td><br /><br /><asp:Label ID="lblPhoneAns" runat="server"></asp:Label></td>

            </tr>
            <tr>
                <td>
                    <br /><br />
                    <asp:Button ID="btnUpdate" runat="server" Text="Edit Profile" Width="167px" OnClick="BtnEdit_Click" class="buttonUpdate"/>
                
                </td>
            </tr>
        </table>

</asp:Content>
