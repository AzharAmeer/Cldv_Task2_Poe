<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Cldv_Task2_Poe.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h1 style="font-family: 'Arial Narrow'; background-color: #AFE1AF">You have selected to Update items </h1>
        <p class="lead" style="font-style: oblique; "> Being able to Update any sort of items that is in place for the items that exists 
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns ="false">
                 <Columns>
                     <asp:BoundField DataField ="itemID" HeaderText ="itemID" />
                      <asp:BoundField DataField ="itemName" HeaderText ="itemName" />
                      <asp:BoundField DataField ="itemDescription" HeaderText ="itemDescription" />
                      <asp:BoundField DataField ="itemPrice" HeaderText ="itemPrice" />
                     <asp:TemplateField HeaderText =" itemImage">
                         <ItemTemplate>
                             <asp:Image ID="Image1" runat="server" Height ="100px" Width ="100px" 
                                 ImageUrl = ' <%#"data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("itemImage")) %>'/>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
            <table class="nav-justified">
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="item ID"></asp:Label>
                        <asp:TextBox ID="idTxt" runat="server"></asp:TextBox>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="item Image"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="item Name"></asp:Label>
                        <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="item Description"></asp:Label>
                        <asp:TextBox ID="descriptionTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="item Price"></asp:Label>
                        <asp:TextBox ID="priceTxt" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
         </p>
       
    </div>
</asp:Content>
