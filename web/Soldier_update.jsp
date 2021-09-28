<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String idsoldier = request.getParameter("idsoldier");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "militaryopt";
String userid = "root";
String password = "eduard15";

String Pistol="Pistol";

if(session.getAttribute("Name") == null) {
       response.sendRedirect("index.html");
       return ;
    }

String name=(String)session.getAttribute("Name");

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from soldiers where idsoldier="+ idsoldier;
String sql0 = "SELECT * FROM weapons where Category!='"+Pistol+"'";
String sql10 = "SELECT * FROM weapons where Category='"+Pistol+"'";
String sql1 ="select * from weapons";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
    <head>
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
            
                        .topnav a.name {
                direction: rtl;
                float: right;
                text-align: right;
            }
            
                                    body{
    margin: 0;
                        }
                        
            /* The navigation menu */
.navbar {
  overflow: hidden;
  background-color: #333;
}

/* Navigation links */
.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* The subnavigation menu */
.subnav {
  float: left;
  overflow: hidden;
}

/* Subnav button */
.subnav .subnavbtn {
  font-size: 17px;
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
                background-color: #4CAF50;
                color: white;
  margin: 0;
}

/* Add a red background color to navigation links on hover */
.navbar a:hover, .subnav:hover .subnavbtn {
                                background-color: #4CAF50;
                color: white;
}

/* Style the subnav content - positioned absolute */
.subnav-content {
  display: none;
  position: absolute;
  left: 0;
  background-color: #4CAF50;
  width: 100%;
  z-index: 1;
}

/* Style the subnav links */
.subnav-content a {
  float: left;
  color: white;
  text-decoration: none;
}

/* Add a grey background color on hover */
.subnav-content a:hover {
  background-color: #eee;
  color: black;
}

/* When you move the mouse over the subnav container, open the subnav content */
.subnav:hover .subnav-content {
  display: block;
}
        </style>
    </head>
<body>
                <div class="topnav">
        <br>

        <h2></h2>
        <p> <a href="Home1.jsp"><b><strong>Home</strong></b></a></p>
        <p> <a href="Ammunition.jsp"><b><strong>Ammunition</strong></b></a></p>
        <p> <a href="Equipment.jsp"><b><strong>Equipment</strong></b></a></p>
        <p> <a href="Food.jsp"><b><strong>Food</strong></b></a></p>
        <p> <a href="Users.jsp"><b><strong>Users</strong></b></a></p>
  
        
                          <div class="subnav">
               <button class="subnavbtn"><b><strong>Soldiers </strong></b><i class="fa fa-caret-down"></i></button> 
    <div class="subnav-content">
      <a href="Soldiers.jsp">See all soldiers</a>
      <a href="Soldiers1.jsp">See available soldiers</a>
      <a href="Soldiers2.jsp">See the soldiers on the battlefield</a>
    </div>
  </div>
        <p> <a href="Vechiles.jsp"><b><strong>Weapons</strong></b></a></p>
                <p> <a href="Observations.jsp"><b><strong>Observations</strong></b></a></p>  
                                <p> <a href="index.html"><b><strong>Log out</strong></b></a></p>
        
        
                                <p> <a class="name"><b> <strong> <% out.print("Hello " + name); %> </strong></b></a></p>
        <br/>

        </div>
    <h1 align="center"> Update Soldier </h1>
    <p align="center"><strong><% out.println("Soldier " + resultSet.getString("Name")); %> </strong></p>
<form method="post" action="Soldier_update-process.jsp" align="center">
<input type="hidden" name="idsoldier" value="<%=resultSet.getString("idsoldier") %>">
<input type="hidden" name="idsoldier" value="<%=resultSet.getString("idsoldier") %>">
<br>
Name:<br>
<input type="text" name="Name" value="<%=resultSet.getString("Name") %>">
<br>
Service Number:<br>
<input type="text" name="ServiceNumber" value="<%=resultSet.getString("ServiceNumber") %>">
<br>
Rank:<br>
<!-- <input type="text" name="Rank" value="<%=resultSet.getString("Rank") %>"  list="Ranks"> -->
<select id="Ranks" name="Rank" >
    
    <option value="<%=resultSet.getString("Rank")%>" selected  hidden><%=resultSet.getString("Rank") %></option>
                                                     <option value="Private">Private</option>
                            <option value="Corporal">Corporal</option>
                            <option value="Sergeant" >Sergeant</option>
                            <option value="Captain">Captain</option>
                             <option value="Second Lieutenant">Second Lieutenant</option>
                             <option value="First Lieutenant">First Lieutenant</option>
                                <option value="Major">Major</option>
                            <option value="Colonel">Colonel</option>

</select>
<br>
Unit:<br>
<input type="text" name="Unit" value="<%=resultSet.getString("Unit") %>">
<br>
Date of Birth:<br>
<input type="date" name="DateofBirth" value="<%=resultSet.getString("DateofBirth") %>">
<br>
Born:<br>
<input type="text" name="Born" value="<%=resultSet.getString("Born") %>">
<br>
Branch:<br>
<input type="text" name="Branch" value="<%=resultSet.getString("Branch") %>">
<br>
Status:<br>
<!-- <input type="text" name="Status" value="<%=resultSet.getString("Status") %>"  list="Stat"> -->
<select id="Stat" name="Status">
    
   <option value="<%=resultSet.getString("Status")%>" selected  hidden><%=resultSet.getString("Status") %></option> 
                                <option value="Available">Available</option>
                            <option value="On the Battlefield">On the Battlefield</option>

                            <option value="MIA">MIA</option>  
                            <option value="Wounded">Wounded</option>

</select>
<br>
Weapon 2:<br>
<% resultSet= statement.executeQuery(sql);
   resultSet.next();
%>
<input type="text" name="WeaponS" value="<%=resultSet.getString("WeaponS") %>">
<br>

Weapon 1:<br>
<!-- <input type="text" name="Status" value="<%=resultSet.getString("Status") %>"  list="Stat"> -->
<select id="WeaponP" name="WeaponP" >
    
   <option value="<%=resultSet.getString("WeaponP")%>" selected  hidden><%=resultSet.getString("WeaponP") %></option> 
                                <% resultSet= statement.executeQuery(sql0);
                              
                              while(resultSet.next()){
                                  
                                  %>
                                  
                                  <option value="<%=resultSet.getString("Name") %>"><%=resultSet.getString("Name") %> (<%=resultSet.getString("Category")%>)</option>
                                  
                                  <%
                              }
                        
                        
                        
                      %>
</select>
<br>

<br>
<br>

<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>