<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>index</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
        
        <% 
            if(session.getAttribute("Name") == null) {
       response.sendRedirect("index.html");
       return ;
    }

            
            String name=(String)session.getAttribute("Name"); %>
        <div class="topnav">
        <br>

        <h2></h2>
        <p> <a href="Home1.jsp" ><b><strong>Home</strong></b></a></p>
        <p> <a href="Ammunition.jsp"><b><strong>Ammunition</strong></b></a></p>
        <p> <a href="Equipment.jsp"><b><strong>Equipment</strong></b></a></p>
        <p> <a href="Food.jsp"><b><strong>Food</strong></b></a></p>
        <p> <a href="Users.jsp" ><b><strong>Users</strong></b></a></p>
                                  <div class="subnav">
               <button class="subnavbtn"><b><strong>Soldiers </strong></b><i class="fa fa-caret-down"></i></button> 
    <div class="subnav-content">
      <a href="Soldiers.jsp">See all soldiers</a>
      <a href="Soldiers1.jsp">See avaible soldiers</a>
      <a href="Soldiers2.jsp">See the soldiers on the battlefield</a>
    </div>
  </div>
        <p> <a href="Vechiles.jsp"><b><strong>Weapons</strong></b></a></p>
                <p> <a href="Observations.jsp"><b><strong>Observations</strong></b></a></p>  
                <p> <a href="index.html"><b><strong>Log out</strong></b></a></p>
                
                       <p> <a class="name"><b> <strong> <% out.print("Hello " + name); %> </strong></b></a></p>
        <br/>

        </div>
        <br>
            
        <br>
        <br>
        <br>
        <br>
        <h2 align="center">There are no available soldiers </h2>
    </body>
</html>
