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
        <p align="center"><a href="nou_Soldier.jsp"><b>Adauga o noua componenta.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("soldiers", "idsoldier", aux);
            rs.first();
            String Name = rs.getString("Name");
            String Rank = rs.getString("Rank");
            Integer ServiceNumber = rs.getInt("ServiceNumber");
            String Unit = rs.getString("Unit");
            String DateofBirth = rs.getString("DateofBirth");
            String Country = rs.getString("Country");
            String Branch = rs.getString("Branch");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Soldier.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">id:</td>
                    <td> <input type="text" name="idsoldier" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" placeholder="Name" name="Name" size="30" value="<%= Name%>"/></td>
                </tr>
                <tr>
                    <td align="right">Rank:</td>
                    <td> <input type="text" placeholder="Rank" name="Rank" size="30" value="<%= Rank%>"/></td>
                </tr>
                <tr>
                    <td align="right">ServiceNumber:</td>
                    <td> <input type="text" placeholder="ServiceNumber" name="ServiceNumber" size="30" value="<%= ServiceNumber%>"/></td>
                </tr>
                <tr>
                    <td align="right">Unit:</td>
                    <td> <input type="text" placeholder="Unit" name="Unit" size="30" value="<%= Unit%>"/></td>
                </tr>
                <tr>
                    <td align="right">DateofBirth:</td>
                    <td> <input type="text" placeholder="DateofBirth" name="DateofBirth" size="30" value="<%= DateofBirth%>"/></td>
                </tr>
                <tr>
                    <td align="right">Country:</td>
                    <td> <input type="text" placeholder="Country" name="Country" size="30" value="<%= Country%>"/></td>
                </tr>
                <tr>
                    <td align="right">Branch:</td>
                    <td> <input type="text" placeholder="Branch" name="Branch" size="30" value="<%= Branch%>"/></td>
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
