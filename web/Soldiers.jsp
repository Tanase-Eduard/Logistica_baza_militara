<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String idsoldier = request.getParameter("idsoldier");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "militaryopt";
String userid = "root";
String password = "eduard15";
String status="Available";


if(session.getAttribute("Name") == null) {
       response.sendRedirect("index.html");
       return ;
    }

String name=(String)session.getAttribute("Name");


String Role ="Responsible of stocks";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
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
                        #model {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 80%;
            }
            
            #model td, #model th {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            
            #model tr:nth-child(even) { background-color: #f2f2f2;}
            
            #model tr:hover {background-color: #ddd;}
            
            #model th{
                
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
            
            .button {
                background-color: #4CAF50;
                border: none;
                color: whitesmoke;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                margin: 4px 2px;
                cursor: pointer;
                align-self: center;
            }
            
            .delete{
                                background-color: #4CAF50;
                border: none;
                color: whitesmoke;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                margin: 4px 2px;
                cursor: pointer;
                align-self: center;
                
            }
            
            

.navbar {
  overflow: hidden;
  background-color: #333;
}


.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}


.subnav {
  float: left;
  overflow: hidden;
}


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


.navbar a:hover, .subnav:hover .subnavbtn {
                                   background-color: #4CAF50;
                color: white;
}


.subnav-content {
  display: none;
  position: absolute;
  left: 0;
  background-color: #4CAF50;
  width: 100%;
  z-index: 1;
}


.subnav-content a {
  float: left;
  color: white;
  text-decoration: none;
}


.subnav-content a:hover {
  background-color: #eee;
  color: black;
}


.subnav:hover .subnav-content {
  display: block;
}
        </style>
        
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
        
        

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
// String sql ="select * from soldiers WHERE Branch='Active' ORDER BY Name";
String sql ="select * from soldiers ORDER BY Name";

String sql4= "SELECT * FROM users where Name='"+name+"'";

resultSet = statement.executeQuery(sql4);
resultSet.next();
if(resultSet.getString("Role").equals(Role))
{
    %>
    
    <br><br><br><br><br><br>
      <h1 align="center"> You don't have access here. </h1>
    
    <%
}

else {

%>

        <h1 align="center"> Soldiers </h1>
<table border="1" align="center" id="model">
<tr>

<th>Name</th>
<th>Service Number</th>
<th>Rank</th>
<th>Unit</th>
<th>Date of Birth</th>
<th>Born</th>
<th>Branch</th>
<th>Status</th>
<th>Weapon 1</th>
<th>Weapon 2</th>
<th>update</th>
<th>Delete</th>

</tr>

<%
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
    
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("ServiceNumber") %></td>
<td><%=resultSet.getString("Rank") %></td>
<td><%=resultSet.getString("Unit") %></td>
<td><%=resultSet.getString("DateofBirth") %></td>
<td><%=resultSet.getString("Born") %></td>
<td><%=resultSet.getString("Branch") %></td>
<td><%=resultSet.getString("Status") %> </td>
<td><%=resultSet.getString("WeaponP") %></td>
<td><%=resultSet.getString("WeaponS") %></td>

<td><a href="Soldier_update.jsp?idsoldier=<%=resultSet.getString("idsoldier")%>"><button type="button" class="button"> update</button></a></td>
<!-- <td><a href="Soldier_delete.jsp?idsoldier=<%=resultSet.getString("idsoldier") %>"><button type="button" class="button">Delete</button></a></td>
-->
<td><button type="button" id="<%=resultSet.getString("idsoldier") %>" class="delete">Delete</button></td>
<!-- <td><a href="Soldier_eat.jsp?ServiceNumber=<%=resultSet.getString("ServiceNumber") %>"><button type="button" class="button">Send to Battlefield</button></a></td>
-->
</tr>

<% }
%>

</table>

<p align="center" > <a href="Soldier_add_1.jsp"><button type="button" class="button" >Add</button></a>.</p>

<%
    
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<script>
    $(document).ready(function()  {
        
        $(".delete").click(function() {
            var id = +this.id;
            $.ajax( {   
                url: "Soldier_delete.jsp",
                type:"post",
                data:{
                    id  : id
                },
                
                success : function(data){
                 //   alert(data);
                    location.reload();
                }
                
            });
        });
    });
    </script>
</body>
</html>