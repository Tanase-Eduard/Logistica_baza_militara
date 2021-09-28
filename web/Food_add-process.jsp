
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
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryopt","root","eduard15");
Statement st=con.createStatement();
String Name=request.getParameter("Name");
String Description=request.getParameter("Description");
String Quantity=request.getParameter("Quantity");
String Code=request.getParameter("Code");


String strQuery = "SELECT COUNT(*) FROM food where Name='"+Code+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into food(Name,Description,Quantity,Code)values('"+Name+"','"+Description+"','"+ Quantity +"','"+ Code + "')");
response.sendRedirect("Food.jsp");
}
else{
//out.println("Service Number already exists.<a href='Food.jsp'> Ok </a>!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br><br><br>
<h2 align="center">Error.Invalid or incomplete data</h2>
<br>
<h3 align="center"><a href='Food.jsp'> Ok </a></h3>
</body>
</html>
