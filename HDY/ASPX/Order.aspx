<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="test2.HDY.ASPX.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .div1{
            font-family:cursive;
            text-align:left;
        }
    .div2{
            left:1500px;
            top:700px;
            position:absolute;
            width: 239px;
            height: 35px;
        }
    </style>
    <div class="div1">
        <h1>
            Order
        </h1>
    </div>
     <div class="div1">         
           <asp:DataList ID="dlOrder" runat="server" HorizontalAlign="Center" RepeatColumns="3" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" CellPadding="4" ForeColor="#34ebd2">
               <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <asp:Label ID="lblOrder" runat="server" Text="OrderID:"><%# Eval("OrderId") %></asp:Label>
                <br />
                ImageName:
                <asp:Label ID="ImageNameLabel" runat="server" Text=<%# Eval("ImageName") %> />
                <br /><br />
                <asp:Image  Width="320" Height="150" ID="imgOrder" runat="server" />
                <br />
                <br />
                            

            </ItemTemplate>
               <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OrderId], [ImageName], [Image] FROM [Order]"></asp:SqlDataSource>
            <br />
            <br />
         </div>
    
</asp:Content>