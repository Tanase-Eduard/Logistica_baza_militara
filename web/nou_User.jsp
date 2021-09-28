<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga pacient</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Image = request.getParameter("Image");
            String Name = request.getParameter("Name");
            String DateofBirth = request.getParameter("DateofBirth");
            String Country = request.getParameter("Country");
            String Password = request.getParameter("Password");
            if (Name != null) {
                jb.connect();
                jb.adaugaUser(Name, DateofBirth, Country,Password);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Pacient.</h1>
        <form action="nou_User.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" name="Name" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">DateofBirth:</td>
                    <td> <input type="text" name="DateofBirth" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Country:</td>
                    <td> <input type="text" name="Country" size="30" /></td>
                </tr>
                 <tr>
                    <td align="right">Password:</td>
                    <td> <input type="text" name="Password" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga " />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
