<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="test2.map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>  
     h1{
         font-family:cursive;
     }
    </style> 
    <h1>Map</h1>
    <div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.5839826782244!2d101.71983191472768!3d3.2034119976676587!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc38111e956dd3%3A0x274a6474586e1fac!2sJalan%20Genting%20Kelang%2C%20Kuala%20Lumpur%2C%20Wilayah%20Persekutuan%20Kuala%20Lumpur!5e0!3m2!1sen!2smy!4v1613925538009!5m2!1sen!2smy" width="800" height="600" style="border:0;"></iframe>
    </div>
       
</asp:Content>
