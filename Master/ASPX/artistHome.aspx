<%@ Page Language="C#" MasterPageFile="~/Artist.Master" AutoEventWireup="true" CodeBehind="artistHome.aspx.cs" Inherits="test2.Master.ASPX.artistHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
    .slideshow{
        text-align: center;
        padding-bottom:50px;
        }
   .container1{
       text-align:center;
       margin-left:10%;
      
   }
   .content{
       padding-left:7%;
       padding-right:7%;
       padding-bottom:100px;
   }
   .imgBet{
       padding-left:50px;
   }
   .describeRight{
       padding-left:50px;
   }
   .describeLeft{
       padding-right:50px;
   }
    </style>

    <div class="slideshow">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" > </asp:Timer>
            <asp:Image ID="Image1" runat="server" Width="700" Height="500" />
        </ContentTemplate>
    </asp:UpdatePanel>
  </div>

    <div class="content">
        <asp:HyperLink ID="HyperLink1" runat="server" Text="Test" NavigateUrl="~/Master/ASPX/custHome.aspx"></asp:HyperLink>
    <table>
        <tr><td>
            <asp:ImageButton ID="ImageButton1" runat="server" Height="300px" Width="300px" ImageUrl="~/Master/IMG/sample1.jpg" PostBackUrl="~/HDY/ASPX/gallery.aspx" /></td>
            <td class="describeRight"><h2>Johannes Vermeer, Girl with a Pearl Earring, 1665</h2>
                <p>Johannes Vermeer’s 1665 study of a young woman is startlingly real and startlingly modern,
                   almost as if it were a photograph. This gets into the debate over whether or not Vermeer 
                   employed a pre-photographic device called a camera obscura to create the image. Leaving 
                   that aside, the sitter is unknown, though it’s been speculated that she might have been 
                   Vermeer's maid. He portrays her looking over her shoulder, locking her eyes with the viewer
                   as if attempting to establish an intimate connection across the centuries. Technically 
                   speaking, Girl isn’t a portrait, but rather an example of the Dutch genre called a tronie—a
                   headshot meant more as still life of facial features than as an attempt to capture a likeness.</p>
            </td></tr>
    </table>

    <table>
        <tr><td class="describeLeft"><h2>Vincent van Gogh, The Starry Night, 1889</h2>
            <p>Vincent Van Gogh’s most popular painting, The Starry Night was created by Van Gogh at the asylum in
                Saint-Rémy, where he’d committed himself in 1889. Indeed, The Starry Night seems to reflect his 
                turbulent state of mind at the time, as the night sky comes alive with swirls and orbs of frenetically
                applied brush marks springing from the yin and yang of his personal demons and awe of nature.
</p>
            </td><td>
            <asp:ImageButton ID="ImageButton2" runat="server" Width="300px" Height="300" ImageUrl="~/Master/IMG/sample2.jpg" PostBackUrl="~/HDY/ASPX/gallery.aspx"  /></td></tr>
    </table>
</div>
    <table class="container1">
        <tr><td class="imgBet">
            <asp:ImageButton ID="ImageButton3" runat="server" Height="200px" Width="200px" ImageUrl="~/LMY/IMG/Death Masks.jpg" PostBackUrl="~/HDY/ASPX/gallery.aspx" /></td><td class="imgBet">
                <asp:ImageButton ID="ImageButton4" runat="server" Height="200px" Width="200px" ImageUrl="~/HDY/IMG/Machines for Suffering.jpeg" PostBackUrl="~/HDY/ASPX/gallery.aspx" /></td><td class="imgBet">
                    <asp:ImageButton ID="ImageButton5" runat="server" Height="200px" Width="200px" ImageUrl="~/LMY/IMG/Prodromes.jpg" PostBackUrl="~/HDY/ASPX/gallery.aspx" /></td><td class="imgBet">
                        <asp:ImageButton ID="ImageButton6" runat="server" Height="200px" Width="200px" ImageUrl="~/LMY/IMG/Torso of a Woman.jpg" PostBackUrl="~/HDY/ASPX/gallery.aspx" /></td></tr>
        <tr><td >
            <asp:Label ID="lblDeathmask" runat="server" Text="Death Masks"></asp:Label></td><td>
                <asp:Label ID="lblMachine" runat="server" Text="Machines for Suffering"></asp:Label></td><td>
                    <asp:Label ID="lblProdromes" runat="server" Text="Prodromes"></asp:Label></td><td>
                        <asp:Label ID="lblTorso" runat="server" Text="Torso of Woman"></asp:Label></td></tr>
    </table>

</asp:Content>

