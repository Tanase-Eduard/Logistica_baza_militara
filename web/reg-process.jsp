
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryfive","root","eduard15");
Statement st=con.createStatement();
String Name=request.getParameter("Name");
String DateofBirth=request.getParameter("DateofBirth");
String Born=request.getParameter("Born");
String Password=request.getParameter("Password");
String Email=request.getParameter("Email");
String strQuery = "SELECT COUNT(*) FROM users where Email='"+Email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into users(Name,DateofBirth,Born,Password,Email)values('"+Name+"','"+DateofBirth+"','"+Born+"','"+Password+ "','" + Email +"')");
response.sendRedirect("index.html");
}
else{
out.println("Name or Email already exists.<a href='index.html'> Ok </a>!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>