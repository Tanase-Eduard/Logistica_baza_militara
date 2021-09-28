<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/militaryopt";%>
<%!String user = "root";%>
<%!String psw = "eduard15";%>
<%
String iduser = request.getParameter("iduser");
String Name=request.getParameter("Name");
String Identificator=request.getParameter("Identificator");
String Born=request.getParameter("Born");
String Password=request.getParameter("Password");
String Email=request.getParameter("Email");

String Role=request.getParameter("Role");


java.util.Date date=new java.util.Date();
			
java.sql.Date Date=new java.sql.Date(date.getTime());

if(iduser != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(iduser);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update users set iduser=?,Name=?,Identificator=?,Born=?,Password=?,Email=?,Role=? where iduser="+ iduser;
ps = con.prepareStatement(sql);
ps.setString(1,iduser);
ps.setString(2, Name);
ps.setString(3, Identificator);
ps.setString(4, Born);
ps.setString(5, Password);
ps.setString(6, Email);
ps.setString(7, Role);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully Press <a href='Users.jsp'> Button </a> to continue.");
response.sendRedirect("Users.jsp");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>