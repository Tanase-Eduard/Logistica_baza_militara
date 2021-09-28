<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Componente</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Componente:</h1>
        <br/>
        <p align="center"><a href="nou_Food.jsp"><b>Adauga o noua componenta.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("food", "idfood", aux);
            rs.first();
            String Name = rs.getString("Name");
            String Description = rs.getString("Description");
            Integer Quantity = rs.getInt("Quantity");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Food.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">id:</td>
                    <td> <input type="text" name="idfood" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" placeholder="Name" name="Name" size="30" value="<%= Name%>"/></td>
                </tr>
                <tr>
                    <td align="right">Description:</td>
                    <td> <input type="text" placeholder="Category" name="Description" size="30" value="<%= Description%>"/></td>
                </tr>
                <tr>
                    <td align="right">Quantity:</td>
                    <td> <input type="text" placeholder="Quantity" name="Quantity" size="30" value="<%= Quantity%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
