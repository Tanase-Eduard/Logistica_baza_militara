<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/militaryopt";%>
<%!String user = "root";%>
<%!String psw = "eduard15";%>
<%
String idsoldier = request.getParameter("idsoldier");
String Name=request.getParameter("Name");
String ServiceNumber=request.getParameter("ServiceNumber");
String Rank=request.getParameter("Rank");
String Unit=request.getParameter("Unit");
String DateofBirth=request.getParameter("DateofBirth");
String Born=request.getParameter("Born");
String Branch=request.getParameter("Branch");
String Status=request.getParameter("Status");

String WeaponP = request.getParameter("WeaponP");
String WeaponS = request.getParameter("WeaponS");
if(idsoldier != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(idsoldier);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update soldiers set idsoldier=?,Name=?,ServiceNumber=?,Rank=?,Unit=?,DateofBirth=?,Born=?,Branch=?,Status=?,WeaponP=?,WeaponS=?  where idsoldier="+ idsoldier;
ps = con.prepareStatement(sql);
ps.setString(1,idsoldier);
ps.setString(2, Name);
ps.setString(3, ServiceNumber);
ps.setString(4, Rank);
ps.setString(5, Unit);
ps.setString(6, DateofBirth);
ps.setString(7, Born);
ps.setString(8, Branch);
ps.setString(9, Status);
ps.setString(10, WeaponP);
ps.setString(11, WeaponS);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully Press <a href='Soldiers.jsp'> Button </a> to continue.");
response.sendRedirect("Soldiers.jsp");
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