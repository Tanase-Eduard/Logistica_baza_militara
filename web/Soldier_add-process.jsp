
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
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/militarysix","root","eduard15");
Statement st=con.createStatement();
String Name=request.getParameter("Name");
String ServiceNumber=request.getParameter("ServiceNumber");
String Rank=request.getParameter("Rank");
String Unit=request.getParameter("Unit");
String DateofBirth=request.getParameter("DateofBirth");
String Born=request.getParameter("Born");
String Branch=request.getParameter("Branch");
String Status=request.getParameter("Status");

String strQuery = "SELECT COUNT(*) FROM soldiers where ServiceNumber='"+ServiceNumber+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into soldiers(Name,ServiceNumber,Rank,Unit,DateofBirth,Born,Branch,Status)values('"+Name+"','"+ServiceNumber+"','"+Rank+"','"+ Unit+"','"+DateofBirth + "','"+ Born + "','"+ Branch + "','" + Status + "')");
response.sendRedirect("Soldiers.jsp");
}
else{
out.println("Service Number already exists.<a href='Soldiers.jsp'> Ok </a>!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>