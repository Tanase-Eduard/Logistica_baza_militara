<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Email=request.getParameter("Email");
//session.setAttribute("Email",Email);
String Password=request.getParameter("Password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryopt","root","eduard15");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where Email='"+Email+"'");
try{
rs.next();
String Name = rs.getString("Name");
session.setAttribute("Name", Name);
String Ema = rs.getString("Email");
String Pas = rs.getString("Password");
if(rs.getString("Password").equals(Password) && rs.getString("Email").equals(Email)  )
{
//out.println("Welcome " + rs.getString("Name"));
//response.sendRedirect("Home1.jsp");
response.sendRedirect("Home3.jsp");
%>
        <style>
            .topnav{
                overflow: hidden;
                background-color: #333;
                
               
            }
            .topnav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
            
            body{
    margin: 0;
    
}
        </style>

    <body>

    </body>
<%
    out.println("Welcome " + rs.getString("Name"));
}
else {
  
//out.println("Invalid password or username. Please try again <a href='index.html'> Button </a>");
%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- <p align="center">Invalid password or email.Please try again.<a href="index.html"<strong>Ok</strong></a></p> -->
<!-- <h2 align="center">Invalid password or email.Please try again.</h2> <br>
<h3 align="center"><a href="index.html">Ok</a></h3> -->
<%
}

}

catch (Exception e) {
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
<br>

<h2 align="center">Invalid password or email.Please try again.</h2> <br>
<h3 align="center"><a href="index.html">Ok</a></h3>
