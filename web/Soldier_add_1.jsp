<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String ServiceNumber = request.getParameter("ServiceNumber");
String Status= "On Battlefield";
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
PreparedStatement ps = null;

ResultSet rs1 = null;
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
                text-align: center;
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
        <p> <a href="Home1.jsp" ><b><strong>Home</strong></b></a></p>
        <p> <a href="Ammunition.jsp"><b><strong>Ammunition</strong></b></a></p>
        <p> <a href="Equipment.jsp"><b><strong>Equipment</strong></b></a></p>
        <p> <a href="Food.jsp" ><b><strong>Food</strong></b></a></p>
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
        <h1 align="center">Add Soldier </h1>


<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from weapons";
String sql0 = "SELECT * FROM weapons where Category!='"+Pistol+"'";
String sql10 = "SELECT * FROM weapons where Category='"+Pistol+"'";
String sql1="Update soldiers set Status=?  where ServiceNumber="+ ServiceNumber;
String sql2="select * from soldiers where ServiceNumber="+ ServiceNumber;
String sql3="select * from ammunition";
//String sql2="select * from soldiers ";
//ps = connection.prepareStatement(sql1);
//ps.setString(1,Status);
//int i=ps.executeUpdate();


%>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
                <form action="Soldier_add-process_1.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" name="Name" /></td>
                </tr>
                <tr>
                    <td align="right">Service Number:</td>
                    <td> <input type="text" name="ServiceNumber"  /></td>
                </tr>
                <tr>
                    <td align="right">Rank:</td>
                <!--    <td> <input list="Ranks" name="Rank" size="40" /> -->
                <td>  <select id="Ranks" name="Rank">
                                         <option value="No rank" selected  hidden> </option> 
                            <option value="Private">Private</option>
                            <option value="Corporal">Corporal</option>
                            <option value="Sergeant" >Sergeant</option>
                            <option value="Captain">Captain</option>
                             <option value="Second Lieutenant">Second Lieutenant</option>
                             <option value="First Lieutenant">First Lieutenant</option>
                                <option value="Major">Major</option>
                            <option value="Colonel">Colonel</option>
                      
                            
                    </select>
                       </td>
                </tr>
                <tr>
                    <td align="right">Unit:</td>
                    <td> <input type="text" name="Unit" /></td>
                </tr>
                <tr>
                    <td align="right">Date:</td>
                    <td> <input type="date" name="DateofBirth"  min="1950-01-01" > </td>
                </tr>
                <tr>
                    <td align="right">Born:</td>
                    <td> <input type="text" name="Born" /></td>
                </tr>
                <tr>
                    <td align="right">Branch:</td>
                    <td> <input type="text" name="Branch"  /></td>
                </tr>
                <tr>
                    <td align="right">Status:</td>
               <!--     <td> <input list="Stat" name="Status" size="40" /> -->
               <td> <select id="Stat" name="Status">
                     
                  <!--     <option value="" selected disabled hidden>Choose here</option> -->
                             <option value="No status" selected  hidden> </option> 
                            <option value="Available">Available</option>
                            <option value="On the Battlefield">On the Battlefield</option>
                            <option value="MIA">MIA</option>  
                            <option value="Wounded">Wounded</option>
                   </select></td>
                </tr>
                
                <tr>
                    <td align="right">Primary Weapon</td>
                    <td> <select id="WeaponP" name="WeaponP">
                            
                 <option value="No weapon" selected  hidden> </option> 
                            <% resultSet= statement.executeQuery(sql0);
                              
                              while(resultSet.next()){
                                  
                                  %>
                                  
                                  <option value="<%=resultSet.getString("Name") %>"><%=resultSet.getString("Name") %> (<%=resultSet.getString("Category")%>)</option>
                                  
                                  <%
                              }
                        
                        
                        
                      %>
                        </select>
                    </td>
                    
                </tr>
                
                              <tr>
                    <td align="right">Secondary Weapon</td>
                    <td> <select id="WeaponS" name="WeaponS">
                            
                 <option value="No weapon" selected  hidden> </option> 
                            <% resultSet= statement.executeQuery(sql10);
                              
                              while(resultSet.next()){
                                  
                                  %>
                                  
                                  <option value="<%=resultSet.getString("Name") %>"><%=resultSet.getString("Name") %> (<%=resultSet.getString("Category")%>)</option>
                                  
                                  %<%
                              }
                        
                        
                        
                      %>
                        </select>
                    </td>
                    
                </tr>
            </table>
                    <p align="center"> <input type="submit" value="Register " /> </p>
        </form>



<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>



</body>
</html>