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
        <h1 align="center">Packages available </h1>
<table border="1" align="center" id="model">

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from food";
String sql1="Update soldiers set Status=?  where ServiceNumber="+ ServiceNumber;
String sql2="select * from soldiers where ServiceNumber="+ ServiceNumber;
String sql4 = "SELECT * FROM equipment";
String sql3="select * from ammunition";
//String sql2="select * from soldiers ";
//ps = connection.prepareStatement(sql1);
//ps.setString(1,Status);
//int i=ps.executeUpdate();
rs1 = statement.executeQuery(sql2);
rs1.next();
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<th><%=resultSet.getString("Name") %>: <%=resultSet.getString("Quantity") %> left</th>



<%
}
%>
<tr>
<%
resultSet = statement.executeQuery(sql);

while(resultSet.next()) 
{

%>


    
    <td><%=resultSet.getString("Description") %></td>

<%
}
%>
</tr>
</table>
<br>
<h1 align="center">Magazines available</h1>
<br>

<table border="1" align="center" id="model">
    <% resultSet = statement.executeQuery(sql3);
    
    while(resultSet.next()){
        
        %>
        
        <th><%=resultSet.getString("Category") %></th>
        
       <% 
    }
          %>
          
          <tr>
              <%
                  resultSet = statement.executeQuery(sql3);
                  
                  while(resultSet.next())
                  {
                      %>
                      <td><%=resultSet.getString("Quantity") %> Magazines</td>
                      
                      <%
                          
                  }
              %>
          </tr>
    
    
    
    
    
</table>



                <form action="Soldier_eat-process.jsp" method="post">
                    
                   

            <table align="center">
                <br>
                <% resultSet= statement.executeQuery(sql2);
                resultSet.next();
                %>
                
                <h2 align="center">Select packages and ammunition. (The soldier is using a <%=resultSet.getString("WeaponP")%>)</h2>
                          
                          
           
             
                <% resultSet=statement.executeQuery(sql);
                while(resultSet.next()){
                    %>
                
                <tr>
                    <td align="right"><%=resultSet.getString("Name")%> :</td>
                 <!--   <td> <input list="Numbers" name=<%=resultSet.getString("Name")%>  size="40"  value="0"/> -->
                    <td > <select id="Imo" name=<%=resultSet.getString("Name") %>>
                    
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                        </select></td>
                <br> 
                </tr>
                
                <tr>
                    <% }
%>
                                      
                    <td> 
                            <% resultSet = statement.executeQuery(sql2);
                            while(resultSet.next())
                            {
                            %>
                          
                            
                            <input type="hidden" name="ServiceNumber" value=<%=resultSet.getString("ServiceNumber") %>>
                            
                            <%
                                }
                           %>

                        </td>
                    
                </tr>
                
                <tr>
                    
                    <td align="center">Select type of ammunition :</td>
                   <!-- <td> <input id="Ammo" name="Type"  size="40" /> -->
                    <td>    <select id="Ammo" name="Type">
                    <% 
                        resultSet=statement.executeQuery(sql3);
                        while(resultSet.next())
                        {
                            %>
                            <option value="<%=resultSet.getString("Name") %>" > <%=resultSet.getString("Category") %> (<%=resultSet.getString("Name")%>)</option>
                    
                    <%
                        }
                   %>
                    
                        </select>
                        </td>   
                </tr>
                
                <tr>
                    
                    <td align="right">Select equipment 1:</td>
             <!--       <td> <input list="Num" name="Amount" type="text" size="40" /> -->
             <td> <select id="Eqone" name="Eqone">
                    
                                      <% 
                        resultSet=statement.executeQuery(sql4);
                        while(resultSet.next())
                        {
                            %>
                            <option value="<%=resultSet.getString("Name") %>" > <%=resultSet.getString("Category") %> (<%=resultSet.getString("Name")%>) (<%=resultSet.getString("Quantity")%>)</option>
                    
                    <%
                        }
                   %>

                    
                 </select>
                    
                    </td>
                    
                    
                </tr>
                
                                <tr>
                    
                    <td align="right">Select equipment 2:</td>
             <!--       <td> <input list="Num" name="Amount" type="text" size="40" /> -->
             <td> <select id="Eqtwo" name="Eqtwo">
                    
                                      <% 
                        resultSet=statement.executeQuery(sql4);
                        while(resultSet.next())
                        {
                            %>
                            <option value="<%=resultSet.getString("Name") %>" > <%=resultSet.getString("Category") %> (<%=resultSet.getString("Name")%>) (<%=resultSet.getString("Quantity")%>)</option>
                    
                    <%
                        }
                   %>

                    
                 </select>
                    
                    </td>
                    
                    
                </tr>

            </table>
                           
     
                    <p align="center"> <input type="submit" value="Submit " /> </p>
        </form>

<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>



</body>
</html>