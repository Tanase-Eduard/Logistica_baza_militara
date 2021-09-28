<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String Name=request.getParameter("Name");
String Module=request.getParameter("Module");
String Observation=request.getParameter("Observation");
//String Date=request.getParameter("Date");

java.util.Date date=new java.util.Date();
			
java.sql.Date Date=new java.sql.Date(date.getTime());
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryopt", "root", "eduard15");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into observations(Name,Module,Observation,Date)values('"+Name+"','"+Module+"','"+Observation+"','"+Date+"')");
//out.println("Data is successfully inserted!");
//response.sendRedirect("Observations.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>