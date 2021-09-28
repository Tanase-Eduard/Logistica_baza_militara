
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
        <p> <a href="Vechiles.jsp"><b><strong>Vechiles</strong></b></a></p>
                <p> <a href="Observations.jsp"><b><strong>Observations</strong></b></a></p>  
                        <p> <a href="index.html"><b><strong>Log out</strong></b></a></p>
                        
                                                <p> <a class="name"><b> <strong> <% out.print("Hello " + name); %> </strong></b></a></p>
        <br/>

        </div>
                                                
                                                
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/militaryopt","root","eduard15");
Statement st=con.createStatement();

String Name=request.getParameter("Name");
String ServiceNumber=request.getParameter("ServiceNumber");
String Rank=request.getParameter("Rank");
String Unit=request.getParameter("Unit");
String DateofBirth=request.getParameter("DateofBirth");
String Born=request.getParameter("Born");
String Branch=request.getParameter("Branch");
String Status=request.getParameter("Status");
String Cal="0";
String WeaponP=request.getParameter("WeaponP");

String WeaponS=request.getParameter("WeaponS");







PreparedStatement ps = null;





//String strQuery = "SELECT * FROM food where Name='"+Name+"'";
String strQuery = "SELECT COUNT(*) FROM soldiers where ServiceNumber='"+ServiceNumber+"'";
String sql1 = "SELECT * FROM weapons where Name='"+WeaponP+"'";
String mno = "SELECT * FROM weapons where Name='"+WeaponS+"'";
String sql2 = "SELECT * FROM equipment";
String sql3= " SELECT * FROM food";
//String sql4= "SELECT * FROM ammunition where Name='"+Type+"'";

ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);

if(Countrow.equals("0")){
int i=st.executeUpdate("insert into soldiers(Name,ServiceNumber,Rank,Unit,DateofBirth,Born,Branch,Status,WeaponP,WeaponS)values('"+Name+"','"+ServiceNumber+"','"+Rank+"','"+ Unit+"','"+DateofBirth + "','"+ Born + "','"+ Branch + "','" + Status + "','" + WeaponP + "','" + WeaponS + "')");

rs = st.executeQuery(sql1);
rs.next();
Integer Er = rs.getInt("Quantity");
Integer Na = Er - 1;


ps = con.prepareStatement("Update weapons set Quantity=? where Name=?");
ps.setInt(1, Na);
ps.setString(2, WeaponP);

ps.executeUpdate();

rs= st.executeQuery(mno);
rs.next();

Integer Er1 = rs.getInt("Quantity");
Integer Na1 = Er1 - 1;

ps=con.prepareStatement("Update weapons set Quantity=? where Name=?");
ps.setInt(1, Na1);
ps.setString(2, WeaponS);

ps.executeUpdate();


response.sendRedirect("Soldiers.jsp");

}
else{
//out.println("Service Number already exists.<a href='Soldiers.jsp'> Ok </a>!");
}



con.close();
}

catch (Exception e){
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
<br><br><br><br>
<h2 align="center">Error.Invalid or incomplete data</h2>
<br>
<h3 align="center"><a href='Soldiers.jsp'> Ok </a></h3>
</body>
</html>