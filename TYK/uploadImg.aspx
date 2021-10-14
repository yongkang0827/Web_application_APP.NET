<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="uploadImg.aspx.cs" Inherits="test2.TYK.uploadImg" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style type="text/css">
    .upload{
        margin-left:200px;
        padding-top:100px;
        padding-bottom:100px;
		padding-left:17%;
		padding-right:17%;
    }
    .btnLayout{
        padding-top:50px;
    }

</style>

        <div class="upload">

            <table>
                <tr>
                    <td class="auto-style1">Image Id :</td>
                    <td>
                        <asp:Label ID="lblID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">Please upload your image here:&nbsp; </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Image is required" ControlToValidate="FileUpload1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Title :</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ErrorMessage="Title is required" ControlToValidate="txtTitle" >*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Description :</td>
                    <td>
                        <asp:TextBox ID="txtDescribe" runat="server" MaxLength="99" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Number of stocks for sale :</td>
                    <td>
                        <asp:TextBox ID="txtStock" runat="server" TextMode="Number" min="1"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="Number of stocks is required" ControlToValidate="txtStock" >*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Stock number must be between 1-10000" ControlToValidate="txtStock" MinimumValue="1" MaximumValue="10000" ></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Selling Price :</td>
                    <td>

                        RM
                        <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" step="0.01" min="0"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Selling Price is Required" ControlToValidate="txtPrice" >*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Selling price must be between 0-1000" ControlToValidate="txtPrice" MinimumValue="0" MaximumValue="1000" Type="Double"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Date Upload :</td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Artist :</td>
                    <td>
                        <asp:TextBox ID="txtArtist" runat="server" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="btnLayout">
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Width="130px" CausesValidation="true"/> &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="false"/>
                    </td>
                    <td class="btnLayout">
                        <asp:Button ID="BtnCancel" runat="server" PostBackUrl="~/TYK/Gallery.aspx" Text="Cancel" OnClick="BtnCancel_Click" CausesValidation="false"/>
                    </td>
                </tr>
                <tr>
                    <td>                        
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  HeaderText="The following problems have been encountered: "  ShowMessageBox="true" ShowSummary="true" />
                    </td>
                </tr>


            </table>
        </div>
</asp:Content>
