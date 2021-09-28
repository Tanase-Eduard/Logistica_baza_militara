<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Pacienti</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Pacienti:</h1>
        <br/>
        <p align="center"><a href="nou_Soldier.jsp"><b>Adauga un nou pacient.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="sterge_Soldier.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdPac:</b></td>
                    <td><b>Name:</b></td>
                    <td><b>ServiceNumber:</b></td>
                    <td><b>Rank:</b></td>
                    <td><b>Unit:</b></td>
                    <td><b>Date:</b></td>
                    <td><b>Country:</b></td>
                    <td><b>Branch:</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("soldiers");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idsoldier");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("Name")%></td>
                    <td><%= rs.getInt("ServiceNumber")%></td>
                    <td><%= rs.getString("Rank")%></td>
                    <td><%= rs.getString("Unit")%></td>
                    <td><%= rs.getDate("DateofBirth")%></td>
                    <td><%= rs.getString("Country")%></td>
                    <td><%= rs.getString("Branch")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
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
