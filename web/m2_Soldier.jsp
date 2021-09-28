<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Produse</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Produse:</h1>
        <br/>
        <p align="center"><a href="nou_Soldier.jsp"><b>Adauga un nou produs.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idsoldier"));
            String Name = request.getParameter("Name");
            String ServiceNumber = request.getParameter("ServiceNumber");
            String Rank = request.getParameter("Rank");
            String Unit = request.getParameter("Unit");
            String DateofBirth = request.getParameter("DateofBirth");
            String Country = request.getParameter("Country");
            String Branch = request.getParameter("Branch");
            

            String[] valori = {Name,ServiceNumber, Rank, Unit, DateofBirth, Country, Branch};
            String[] campuri = {"Name", "ServiceNumber", "Rank", "Unit", "DateofBirth", "Country", "Branch"};
            jb.modificaTabela("soldiers", "idsoldier", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

