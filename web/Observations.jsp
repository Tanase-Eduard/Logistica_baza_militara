<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String idobservation = request.getParameter("idobservation");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "militaryopt";
String userid = "root";
String password = "eduard15";


try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

if(session.getAttribute("Name") == null) {
       response.sendRedirect("index.html");
       return ;
    }

String name=(String)session.getAttribute("Name");


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
            .topnav a:hover, .subnav:hover .subnavbtn {
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
                width: 95%;
            }
            
            #model td, #model th {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            
            #model tr:nth-child(even) { background-color: #f2f2f2;}
             #model tr:nth-child(odd) { background-color: #f2f2f2;}
            
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
                                background-color: #4CAF50 ;
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
  background-color: inherit;
  margin: 0;
}

/* Add a red background color to navigation links on hover */
.navbar a:hover, .subnav:hover .subnavbtn {
                   background-color: #ddd;
                color: black;
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
     /*                 body{
   background-image: url("background4.png");
    background-repeat: no-repeat;
  background-size: cover;
    background-position-y: 10%;
     margin: 0;

}
*/

        </style>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        
    </head>
<body>
    
        <div class="topnav">
        <br>

        <h2></h2>
        <p> <a href="Home1.jsp" ><b><strong>Home</strong></b></a></p>
        <p> <a href="Ammunition.jsp" ><b><strong>Ammunition</strong></b></a></p>
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
        <p> <a href="Observations.jsp" class="active"><b><strong>Observations</strong></b></a></p>  
                        <p> <a href="index.html"><b><strong>Log out</strong></b></a></p>
                        
                        <p> <a class="name"><b> <strong> <% out.print("Hello " + name); %> </strong></b></a></p>
        <br/>

        </div>
        
        
    </body>
    <h1 align="center"> Observations </h1>
<table border="1" align="center" id="model">
<tr>

<th>Name</th>
<th>Module</th>
<th>Observation</th>
<th>Date</th>
<th>Delete</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from observations order by Date";
String sql1 = "SELECT * FROM users where Name='"+name+"'";
resultSet = statement.executeQuery(sql);
int i =0;
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Module") %></td>
<td><%=resultSet.getString("Observation") %></td>
<td><%=resultSet.getString("Date") %></td>
<!--
<td><a href="Ammunition_update.jsp?idammunition=<%=resultSet.getString("idobservation")%>"><button type="button" class="button"> update</button></a></td>
<td><a href="Ammunition_delete.jsp?idammunition=<%=resultSet.getString("idobservation") %>"><button type="button" class="button">Delete</button></a></td>
-->
<td><button type="button" id="<%=resultSet.getString("idobservation") %>" class="delete">Delete</button></td>
</tr>
<%
    i++;
}

%>
</table>

<br> 
<br>
<br>
<br>

                <form  method="post" >
            <table align="center">
                <tr>
                   
                    <% resultSet = statement.executeQuery(sql1); 
                         resultSet.next();
                    %>
                    <td> <input type="hidden" name="Name" size="40" id="Name" value="<%=resultSet.getString("Name") %>"  /></td>
                </tr>
                <tr>
                    <td align="right">Module:</td>
                    <td> <select  name="Module" id="Module" >
                    
                                         <option value="No module" selected  hidden> </option> 
                            <option value="Ammunition">Ammunition</option>
                            <option value="Equipment" >Equipment</option>
                            <option value="Weapons">Weapons</option>
                            <option value="Food">Food</option>
                            <option value="Soldiers">Soldiers</option>
                    
                        </select></td>
                </tr>
                <tr>
                    <td align="right">Observation:</td>
                    <td> <input type="text" name="Observation" size="40" id="Observation"/></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td> <input type="hidden" name="Date" size="40" id="Date"  /></td>
                </tr>

            </table>
                    <p align="center"><input type="submit" value="submit" id="save_data"/> </p>
        </form>


<%
//String name=(String)session.getAttribute("Name");
//out.print("Hello " + name);
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
                url: "Observation_delete.jsp",
                type:"post",
                data:{
                    id  : id
                },
                
               success : function(data){
                  // alert(data);
                   location.reload();
                   
               }
                
            });
        });
    });
    </script>

<script>
$(document).ready(function() {
$("#save_data").click(function() {
//alert("succeess");
$.ajax({
url: "Observation_add.jsp",
type: "post",
data: {
Name:$('#Name').val(),
Module:$('#Module').val(),
Observation:$('#Observation').val(),
success : function(data){
//alert(data);
location.reload(true);
}
}
});
});
});
    </script>

</body>
</html>