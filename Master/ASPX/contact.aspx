<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="test2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h1{
            font-family:cursive;
        }
        h3{
            font-family:cursive;
            font-size:medium;
        }
        table{
            font-family:cursive;
        }

    .auto-style2 {
        width: 343px;
    }
    .auto-style3 {
        width: 372px;
    }

    </style>
    <h1>Contact Us</h1>
    <h3>We would like to hear from you.</h3>
    <div>
        <table>
            <tr>
                <td class="auto-style2">
                    <h2>Get In Touch</h2>                   
                </td>
                <td class="auto-style3"><h2>Address</h2></td>
               
            </tr>
            <tr><td class="auto-style2"> 
                Malaysia : 03-2223 5577<br /><br />
                International : +60 12-3456712<br /><br />
                Email : info@artgallery.net
                </td>
                <td class="auto-style3">
                    Kampus Utama,Jalan Genting Kelang,<br /><br />
                    53300 Kuala Lumpur,<br /><br />
                    Wilayah Persekutuan Kuala Lumpur
                </td>
                
              </tr>
              </table>
            <br />
        <table>
             <tr><td><h2>Directors</h2></td></tr>
            <tr> <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Master/IMG/contactus1.jpg" Height="120px" Width="120px" /></td><td>Peter Chater - Founder</td></tr>
            <tr> <td><asp:Image ID="Image2" runat="server" ImageUrl="~/Master/IMG/contactus2.jpg" Height="120px" Width="120px" /></td><td>Tom Brickman - Senior Director & Chief Creative Officer</td></tr>
            <tr> <td><asp:Image ID="Image4" runat="server" ImageUrl="~/Master/IMG/contactus3.jpg" Height="120px" Width="120px" /></td><td>Joe Elliott - Senior Director & Chief Commercial Office</td></tr>
            <tr> <td><asp:Image ID="Image3" runat="server" ImageUrl="~/Master/IMG/contactus4.jpg" Height="120px" Width="120px" /></td><td>Josef Barta - Director & Chief Technical Officer</td></tr>
      </table>

    </div>
</asp:Content>
