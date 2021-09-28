
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="ext/html; charset=ISO-8859-1">
<title>Count Rows JSP</titlte>
</head>
<body>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryopt","root","eduard15");
Statement st=con.createStatement();
String Name=request.getParameter("Name");
String Born=request.getParameter("Born");
String Password=request.getParameter("Password");
String Email=request.getParameter("Email");

String Identificator=request.getParameter("Identificator");

String Role="Admin";

java.util.Date date=new java.util.Date();
			
java.sql.Date Date=new java.sql.Date(date.getTime());

String strQuery = "SELECT COUNT(*) FROM users where Email='"+Email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into users(Name,Born,Password,Email,Identificator,Role,Date)values('"+Name+"','"+Born+"','"+ Password +"','"+ Email + "','" + Identificator + "','"+ Role + "','"+ Date + "')");
response.sendRedirect("Users.jsp");
}
else{
//out.println("Email already exists.<a href='Users.jsp'> Ok </a>!");
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
<h3 align="center"><a href='Users.jsp'> Ok </a></h3>

</body>
</html>