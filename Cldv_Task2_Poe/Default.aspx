<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cldv_Task2_Poe._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" background-color: #AFE1AF" style="background-color: #AFE1AF">
        <h1>Welcome to ABC Supermarket</h1>
        <p class="lead">Here you will be able to insert, update and delete items :) </p>
       
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Insert Items of choice </h2>
            <p>
                Here you will have the ability to insert new items as it comes in
            </p>
            <p>
                <a class="btn btn-default" href="Insert">Insert &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Update Items of choice </h2>
            <p>
                Here you will be directed to update the items that is already in place 
            </p>
            <p>
                <a class="btn btn-default" href="Update">Update  &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Delete items of choice </h2>
            <p>
                Here you will be deleting the items that is already in place 
            </p>
            <p>
                <a class="btn btn-default" href="Delete">Delete &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
