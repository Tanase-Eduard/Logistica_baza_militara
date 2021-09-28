<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE HTML>
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
        <p> <a href="Ammunition.jsp"><b><strong>Ammunition</strong></b></a></p>
        <p> <a href="Equipment.jsp"><b><strong>Equipment</strong></b></a></p>
        <p> <a href="Food.jsp" class="active"><b><strong>Food</strong></b></a></p>
        <p> <a href="tabela_Users.jsp"><b><strong>Users</strong></b></a></p>
        <p> <a href="Soldiers.jsp"><b><strong>Soldiers</strong></b></a></p>
        <p> <a href="Vechiles.jsp"><b><strong>Vechiles</strong></b></a></p>
        <br/>

        </div>
        <%
            
            String Name = request.getParameter("Name");
            String Description = request.getParameter("Description");
            String Quantity = request.getParameter("Quantity");
            if (Name != null) {
                jb.connect();
                jb.adaugaFood(Name, Description, java.lang.Integer.parseInt(Quantity));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Pacient.</h1>
        <form action="nou_Food.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" name="Name" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Description:</td>
                    <td> <input type="text" name="Description" size="30" /></td>
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
        <a href="Food.jsp"><b>Home</b></a>
        <br/>
    </body>
</html>

