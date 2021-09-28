<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Ammunition</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Ammunition:</h1>
        <br/>
        <p align="center"><a href="nou_Ammunition.jsp"><b>Add Ammunition.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form  action="sterge_Ammunition.jsp" method="post" > 

            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Id:</b></td>
                    <td><b>Name:</b></td>
                    <td><b>Category:</b></td>
                    <td><b>Quantity:</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("ammunition");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idammunition");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("Name")%></td>
                    <td><%= rs.getString("Category")%></td>
                    <td><%= rs.getInt("Quantity")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate"  />
            </p>

        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
