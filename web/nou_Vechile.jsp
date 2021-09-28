<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga pacient</title>
                <style>
            .topnav{
                overflow: hidden;
                background-color: #333;
               
            }
            .topnav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
                <div class="topnav">
        <br>

        <h2></h2>
        <p> <a href="indexnou.html" ><b><strong>Home</strong></b></a></p>
        <p> <a href="Ammunition.jsp" ><b><strong>Ammunition</strong></b></a></p>
        <p> <a href="Equipment.jsp"><b><strong>Equipment</strong></b></a></p>
        <p> <a href="Food.jsp"><b><strong>Food</strong></b></a></p>
        <p> <a href="tabela_Users.jsp"><b><strong>Users</strong></b></a></p>
        <p> <a href="Soldiers.jsp"><b><strong>Soldiers</strong></b></a></p>
        <p> <a href="Vechiles.jsp" class="active"><b><strong>Vechiles</strong></b></a></p>
        <br/>

        </div>
        <%
            String Image = request.getParameter("Image");
            String Name = request.getParameter("Name");
            String Category = request.getParameter("Category");
            String Quantity = request.getParameter("Quantity");
            if (Name != null) {
                jb.connect();
                jb.adaugaVechile(Name, Category, java.lang.Integer.parseInt(Quantity));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Pacient.</h1>
        <form action="nou_Vechile.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" name="Name" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Category:</td>
                    <td> <input type="text" name="Category" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Quantity:</td>
                    <td> <input type="text" name="Quantity" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga " />
        </form>
        <%
            }
        %>
        <br/>
        <a href="Vechiles.jsp"><b>Home</b></a>
        <br/>
    </body>
</html>

