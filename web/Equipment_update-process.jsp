<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/militaryopt";%>
<%!String user = "root";%>
<%!String psw = "eduard15";%>
<%
String idequipment = request.getParameter("idequipment");
String Name=request.getParameter("Name");
String Category=request.getParameter("Category");
String Quantity=request.getParameter("Quantity");
String Code=request.getParameter("Code");
if(idequipment != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(idequipment);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update equipment set idequipment=?,Name=?,Category=?,Quantity=?,Code=? where idequipment="+ idequipment;
ps = con.prepareStatement(sql);
ps.setString(1,idequipment);
ps.setString(2, Name);
ps.setString(3, Category);
ps.setString(4, Quantity);
ps.setString(5, Code);
int i = ps.executeUpdate();
if(i > 0)
{
//out.print("Record Updated Successfully Press <a href='Equipment.jsp'> Button </a> to continue.");
    response.sendRedirect("Equipment.jsp");
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