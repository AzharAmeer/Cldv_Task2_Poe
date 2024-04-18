<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="Cldv_Task2_Poe.Insert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron"background-color: #AFE1AF">
        <h1 style="font-family: 'Arial Narrow'; background-color: #AFE1AF">You have selected to insert items </h1>
        <p class="lead" style="font-style: oblique; "> Being able to insert any sort of new items 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CldvTask2_POEConnectionString2 %>" SelectCommand="SELECT * FROM [itemDetail]"></asp:SqlDataSource>
            <table class="nav-justified">
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="item Image"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="item Name"></asp:Label>
                        <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="item Description"></asp:Label>
                        <asp:TextBox ID="descriptionTxt" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="item Price"></asp:Label>
                        <asp:TextBox ID="priceTxt" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
         </p>
         <p class="lead" style="font-style: oblique; "> 
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
         </p>
 
    </div>
</asp:Content>

