
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>C</title>

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

#flag1 {
    
    position: absolute;
    left:  175px;
    top: 400px;
    
}

#flag2 {
    
    position: absolute;
    right:  175px;
    top: 400px;
    
}
        </style>
</head>
<body>
    <% 
        if(session.getAttribute("Name") == null) {
       response.sendRedirect("index.html");
       return ;
    }
        
        String name=(String)session.getAttribute("Name"); %>

                                                
                                                
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryopt","root","eduard15");
Statement st=con.createStatement();


String Available = "Available";
String Bf ="On the Battlefield";
String Wounded="Wounded";
String MIA="MIA";

String Amount = request.getParameter("Amount");

String Type = request.getParameter("Type");






PreparedStatement ps = null;

Integer Er =0;



//String strQuery = "SELECT * FROM food where Name='"+Name+"'";
//String sql1 = "SELECT * FROM soldiers where ServiceNumber='"+ServiceNumber+"'";
String sql1 = "SELECT COUNT(*) FROM soldiers where Status='"+Available+"'";
String sql2 = "SELECT COUNT(*) FROM soldiers where Status='"+Bf+"'";
String sql9 = "SELECT COUNT(*) FROM soldiers where Status='"+Wounded+"'";
String sql8 = "SELECT COUNT(*) FROM soldiers where Status='"+MIA+"'";
String sql3 = "SELECT COUNT(*) FROM observations";
String sql4 = "SELECT COUNT(*) FROM soldiers";
//String sql2 = "SELECT * FROM equipment";
//String sql3= " SELECT * FROM food";
//String sql4= "SELECT * FROM ammunition where Name='"+Type+"'";

ResultSet rs = st.executeQuery(sql4);

rs.next();
%>
                <div class="topnav">
        <br>

        <h2></h2>
        <p> <a href="Home1.jsp" class="active"><b><strong>Home</strong></b></a></p>
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
        <h1 align="center">Welcome!</h1>
        <h2 align="center">There are a total of <%=rs.getString(1)%>  soldiers registered at the military base which:</h2> 
        <% rs=st.executeQuery(sql1);
        rs.next();
     
        %>
        <h2 align="center">- number of soldiers that are ready to fight: <%=rs.getString(1)%></h2>
        <% rs=st.executeQuery(sql2);
        rs.next();
        %>
        <h2 align="center">- number of soldiers that are on the battlefield: <%=rs.getString(1)%> </h2>
        <% rs=st.executeQuery(sql9);
        rs.next();%>
        <h2 align="center">- number of soldiers that are wounded: <%=rs.getString(1)%></h2>
                <% rs=st.executeQuery(sql8);
        rs.next();%>
        <h2 align="center">- number of soldiers that are MIA: <%=rs.getString(1)%></h2>
        
                <p align="center" id="flag1"><a href="https://www.fg-a.com/american-1.shtml" target="_blank"><img src="https://content.screencast.com/users/fg-a/folders/american-flags/media/f16faa33-b1bd-4879-9d1a-2b6293a33c40/usaCa.gif" width="250" height="200" border="0" alt="Flags" /></a></p>
 <p align="center" id="flag2"><a href="https://www.fg-a.com/american-1.shtml" target="_blank"><img src="https://content.screencast.com/users/fg-a/folders/american-flags/media/f16faa33-b1bd-4879-9d1a-2b6293a33c40/usaCa.gif" width="250" height="200" border="0" alt="Flags" /></a></p>
                                                
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                                <% rs = st.executeQuery(sql3);
                                                rs.next();
                                                %>
                                                <h1 align="center"> Current number of observations: <%=rs.getString(1)%></h1>


<%
con.close();

}

catch (Exception e){
e.printStackTrace();
}
%>


</body>
</html>
