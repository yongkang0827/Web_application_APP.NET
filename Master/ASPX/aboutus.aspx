<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="test2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
       h1{
           font-family:cursive;
        }

       p{
           font-family:cursive;           
       }

       strong{
           font-size:large;         
       }
    </style>
    <h1>About Us</h1>
   <div>     
       <table>            
           <tr><td><p><strong>ART Gallery</strong></p><p>Our platform provides access to a large catalogue of contemporary artworks from 
               the best galleries around the world. Discover works by world renowned artists (Banksy, 
               JonOne, Andy Warhol), as well as by young emerging talents. Works range from £100 to over
               £100,000 and we offer a variety of mediums including painting, sculpture, photography, print and mixed media.</p>
               <p>In keeping with our wish to make art more accessible,
               we also offer an online contemporary art magazine and an art advisory
               service available for those who would like personalised advice throughout their buying process.</p></td>
               <td>
                   <asp:Image ID="Image1" runat="server" ImageUrl="~/Master/IMG/aboutus1.JPG" /></td>
               </tr>
           <tr><td><asp:Image ID="Image2" runat="server" ImageUrl="~/Master/IMG/aboutus2.jpg" /></td>
               <td><p><strong>We are partnered with the best galleries from around the world</strong></p>
                   <p>Unlike other platforms, 
                       the works presented on Artsper are selected exclusively by the best galleries
                       who have gained recognition across the globe for their work and their commitment to their artists.</p>
                   <p>All the works on our platform have been through a thorough vetting process: first by the gallery and then by Artsper. 
                       Furthermore, each gallery is also carefully reviewed by our panel of experts using a range of criteria: the artists represented, 
                       the quality and authenticity of the works,
                       the art fairs it participates in and the way in which it promotes its artists.
                       This demanding selection process guarantees an exceptional quality of works.</p>                   
               </td></tr>
       </table>
       
       <br />
       <br />
    
       <table>
           <tr><td>
               <p><strong>Our Mission</strong></p>
               <p>ART Gallery Foundation aim to support art & artist.
               it has a two-fold aim to generate income with the help of art and artists, 
                   and contribute a portion of this income to social causes assessed and selected by ART Gallery.</p></td>
               <td><p><strong>Our Vision</strong></p>
               <p>We are committed to helping as many as we can, through the generosity and support of its artists and patrons. 
                   ART Gallery is happy to extend its support to other social causes or community initiatives.</p></td>
               <td><p><strong>Our Mission</strong></p>
               <p> Joining together and creating a helping hand by the most creative people who can understood the humanity better.
                   Through the support, and association of our artists and patrons, trying to make a better world.</p></td>
           </tr>
       </table>
   </div>
</asp:Content>
