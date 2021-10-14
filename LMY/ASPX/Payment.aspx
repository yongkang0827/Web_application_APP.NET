<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="test2.LMY.ASPX.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <style>
        /*.div1{
            top:1000px;
            left:3000px;
        }*/
        .image{
            height:200px;
            width:200px;
        }
    </style>
        <div class="div1">
            <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
    <Columns>
        <asp:BoundField DataField="OrderId" HeaderText="Image Id" />
        <asp:BoundField DataField="CustName" HeaderText="Name" />
        <asp:BoundField DataField="Price" HeaderText="Name" />
        <asp:TemplateField HeaderText="Image" ControlStyle-CssClass="image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" />
            </ItemTemplate>

<ControlStyle CssClass="image"></ControlStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Buy?">
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OrderId], [ImageName], [Price] FROM [OrderList]"></asp:SqlDataSource>
            <br />
            <br />
             

            <asp:Button ID="btnBuy" runat="server" Text="Buy" OnClick="btnBuy_Click" />
            <br />
            <br />
            <br />
        </div>
</asp:Content>
