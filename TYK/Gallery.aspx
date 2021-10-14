<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="test2.TYK.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style type="text/css">
    .addImg{

        margin-left:42%;
        border-style:double;
        border-color:black;    
        width:230px;
    }
    .div1{
            font-family:cursive;
            text-align:left;
        }

    .content{
			padding-left:17%;
			padding-right:17%;

	}

</style>
    <div class="div1">
        <h1>
            My Gallery
        </h1>
    </div>
        <div class="content">
            <asp:LoginName ID="LoginName1" runat="server" />
           <asp:DataList ID="DataList1" runat="server" HorizontalAlign="Justify" RepeatColumns="3" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" CellPadding="4" ForeColor="#333333">
               <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table>
                    <tr>
                       <td> <%# Eval("Title") %></td>
                    </tr>
                    <tr><td><asp:Image  Width="320" Height="150" ID="Image1" runat="server" /></td></tr>
                    <tr> 
                        <td>
                            <h4>Price : <%# Eval("Price") %> </h4>
                            <h5>Quantity Remaining : <%# Eval("Quantity") %> </h5>

                        </td>

                    </tr>
                     <tr> <td> <%# Eval("Description") %> </td></tr>
                     <tr> <td> <h6>Upload Date: <%# Eval("DateUpload") %> </h6>  </td></tr>
               </table>
                            

            </ItemTemplate>
               <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
            <br />
            <br />
            </div>
        <div class="addImg">
            Add new image&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAdd" runat="server"  PostBackUrl="~/TYK/uploadImg.aspx" Text="Upload" />

         </div>
</asp:Content>
