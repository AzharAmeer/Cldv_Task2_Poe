<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="Cldv_Task2_Poe.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h1 style="font-family: 'Arial Narrow'; background-color: #AFE1AF">You have selected to delete items </h1>
        <p class="lead" style="font-style: oblique; "> Being able to delete any sort of items that already exists 
            <asp:Label runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="itemID" HeaderText="itemID" ReadOnly="True" SortExpression="itemID" />
                    <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                    <asp:BoundField DataField="itemDescription" HeaderText="itemDescription" SortExpression="itemDescription" />
                    <asp:BoundField DataField="itemPrice" HeaderText="itemPrice" SortExpression="itemPrice" />
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CldvTask2_POEConnectionString2 %>" SelectCommand="SELECT * FROM [itemDetail]"></asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource2" onItemDeleted="FormView1_ItemDeleted">
                <EditItemTemplate>
                    itemID:
                    <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                    <br />
                    itemName:
                    <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                    <br />
                    itemDescription:
                    <asp:TextBox ID="itemDescriptionTextBox" runat="server" Text='<%# Bind("itemDescription") %>' />
                    <br />
                    itemPrice:
                    <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    itemID:
                    <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                    <br />
                    itemName:
                    <asp:TextBox ID="itemNameTextBox0" runat="server" Text='<%# Bind("itemName") %>' />
                    <br />
                    itemDescription:
                    <asp:TextBox ID="itemDescriptionTextBox0" runat="server" Text='<%# Bind("itemDescription") %>' />
                    <br />
                    itemPrice:
                    <asp:TextBox ID="itemPriceTextBox0" runat="server" Text='<%# Bind("itemPrice") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    itemID:
                    <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                    <br />
                    itemName:
                    <asp:Label ID="itemNameLabel" runat="server" Text='<%# Bind("itemName") %>' />
                    <br />
                    itemDescription:
                    <asp:Label ID="itemDescriptionLabel" runat="server" Text='<%# Bind("itemDescription") %>' />
                    <br />
                    itemPrice:
                    <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Bind("itemPrice") %>' />
                    <br />
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CldvTask2_POEConnectionString2 %>" DeleteCommand="DELETE itemDetail
WHERE itemID =@itemID" SelectCommand="SELECT itemDetail.itemID, itemDetail.itemName, itemDetail.itemDescription ,itemDetail.itemPrice FROM itemDetail

 WHERE itemDetail.itemID = @itemID">
                <DeleteParameters>
                    <asp:Parameter Name="itemID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="itemID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
         </p>
       
    </div>
</asp:Content>
