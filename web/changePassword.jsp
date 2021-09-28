<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%

String Email = request.getParameter("Email");
String Newpass=request.getParameter("new");
String Conpass=request.getParameter("confirm");
String connurl = "jdbc:mysql://localhost:3306/militarysix";
Connection con=null;
String pass="";
int id=0;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "eduard15");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users where Email='"+Email+"' and Password='"+Newpass+"'");




Statement st1=con.createStatement();
int i=st1.executeUpdate("update users set password='"+Newpass+"' where Email='"+Email+"'");
out.println(" <br> Password changed successfully <a href='index.html'> Button </a> to continue.");
st1.close();
con.close();
}

catch(Exception e){
out.println(e);
}
%>