<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/militaryopt";%>
<%!String user = "root";%>
<%!String psw = "eduard15";%>
<%
String idammunition = request.getParameter("idammunition");
String Name=request.getParameter("Name");
String Category=request.getParameter("Category");
String Quantity=request.getParameter("Quantity");
String Code=request.getParameter("Code");
if(idammunition != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(idammunition);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update ammunition set idammunition=?,Name=?,Category=?,Quantity=?,Code=? where idammunition="+ idammunition;
ps = con.prepareStatement(sql);
ps.setString(1,idammunition);
ps.setString(2, Name);
ps.setString(3, Category);
ps.setString(4, Quantity);
ps.setString(5, Code);
int i = ps.executeUpdate();
if(i > 0)
{
//out.print("Record Updated Successfully Press <a href='Ammunition.jsp'> Button </a> to continue.");
response.sendRedirect("Ammunition.jsp");
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