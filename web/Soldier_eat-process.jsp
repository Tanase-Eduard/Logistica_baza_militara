
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
                color: white;;
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
        <p> <a href="Vechiles.jsp"><b><strong>Weapons</strong></b></a></p>
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
String Unit=request.getParameter("Unit");
String ServiceNumber=request.getParameter("ServiceNumber");
String Grenade = "M67";

String Eqone=request.getParameter("Eqone");
String Eqtwo=request.getParameter("Eqtwo");

String Status ="On the Battlefield";

//String Amount = request.getParameter("Amount");

String Type = request.getParameter("Type");

String Type1="9 X 19 mm NATO";





PreparedStatement ps = null;

Integer Er =0;



String strQuery = "SELECT * FROM food where Name='"+Name+"'";
String sql1 = "SELECT * FROM soldiers where ServiceNumber='"+ServiceNumber+"'";
String sql2 = "SELECT * FROM equipment where Name='"+Eqone+"'";
String sql0 = "SELECT * FROM equipment where Name='"+Eqtwo+"'";
//String sql2 = "SELECT * FROM equipment";
String sql3= " SELECT * FROM food";
String sql4= "SELECT * FROM ammunition where Name='"+Type+"'";
String sql5= "SELECT * FROM ammunition where Name='"+Type1+"'";




ResultSet rs = st.executeQuery(sql3);

while(rs.next()){
    
    String We = request.getParameter(rs.getString("Name"));
       Er = Er + java.lang.Integer.parseInt(We);
}

rs = st.executeQuery(sql3);

if( Er <=4){

while(rs.next())
{
   //String abc = rs.getString("idfood");
    String Ab = request.getParameter(rs.getString("Name"));
    
    Integer qr = rs.getInt("Quantity");
    
    if( qr>0 ) {
    
    Integer ui = qr - java.lang.Integer.parseInt(Ab);
    
    String Na = rs.getString("Name");
    
    ps = con.prepareStatement("Update food set Quantity=? where Name=?");
    ps.setInt(1, ui);
    ps.setString(2, Na);
    
    ps.executeUpdate();
    
      //  out.print("Nu  e suficiente.<a href='Soldiers.jsp'> Ok </a>");
    
    
    
    }
    
}

rs = st.executeQuery(sql1);
rs.next();

   %>
   
   <br>
   <br>
   <br>
   <h1 align="center">Soldier <%=rs.getString("Name")%> succesfully sent to the battlefield. </h1> <br>
   <h1 align="center"><a href="Soldiers1.jsp">Ok!</a> </h1>
   
   
   <%
}
else {
  //  out.print(" Da no <a href='Soldiers.jsp'> Ok </a> ");
  %>
  <br>
  <br>
  <br>
  <h2 align="center">Error! <a href="Soldiers.jsp">Ok!</a></h2>
  
  
  <%
}

//rs = st.executeQuery(strQuery);
//rs.next();
//Integer Countrow = rs.getInt("Quantity");

//rs = st.executeQuery(sql1);
//rs.next();
//Integer Val = rs.getInt("Val");


rs = st.executeQuery(sql2);

if( Er<=4) {

while(rs.next()){
    

Integer Ty = rs.getInt("Quantity");
String Nm = rs.getString("Name");

if( Ty > 0)
{
Integer Ui = Ty - 1;


ps= con.prepareStatement("Update equipment set Quantity=? where Name=?");
ps.setInt(1, Ui);
ps.setString(2, Eqone);

ps.executeUpdate();

//out.print(" \n SHAAAAAAAAA    ");

}




}

}

rs = st.executeQuery(sql0);

if( Er<=4) {

while(rs.next()){
    

Integer Ty = rs.getInt("Quantity");
String Nm = rs.getString("Name");

if( Ty > 0)
{
Integer Ui = Ty - 1;


ps= con.prepareStatement("Update equipment set Quantity=? where Name=?");
ps.setInt(1, Ui);
ps.setString(2, Eqtwo);

ps.executeUpdate();

//out.print(" \n SHAAAAAAAAA    ");

}




}

}

rs = st.executeQuery(sql4);

if(Er <=4){

rs.next();

Integer Op = rs.getInt("Quantity");
if (Op > 4) {
//Integer Po = Op - java.lang.Integer.parseInt(Amount);
Integer Po = Op - 4;
ps = con.prepareStatement("Update ammunition set Quantity=? where Name=?");
ps.setInt(1, Po);
ps.setString(2, Type);

ps.executeUpdate();

}

else {

Integer Po = 0;
ps = con.prepareStatement("Update ammunition set Quantity=? where Name=?");
ps.setInt(1, Po);
ps.setString(2, Type);

}
}


rs = st.executeQuery(sql5);

if(Er <=4){

rs.next();

Integer Op = rs.getInt("Quantity");
if (Op > 3) {
//Integer Po = Op - java.lang.Integer.parseInt(Amount);
Integer Po = Op - 3;
ps = con.prepareStatement("Update ammunition set Quantity=? where Name=?");
ps.setInt(1, Po);
ps.setString(2, Type1);

ps.executeUpdate();

}

else {

Integer Po = 0;
ps = con.prepareStatement("Update ammunition set Quantity=? where Name=?");
ps.setInt(1, Po);
ps.setString(2, Type1);

}
}




rs = st.executeQuery(sql1);

if( Er <=4){

rs.next();

ps = con.prepareStatement("Update soldiers set Status=? where ServiceNumber=?");
ps.setString(1, Status);
ps.setString(2, ServiceNumber);

ps.executeUpdate();
}

/*
rs=st.executeQuery(sql2);
while(rs.next()){
Integer Equip = rs.getInt("Quantity");
String Name1 = rs.getString("Name");


if(Equip > 0)
{
ps=con.prepareStatement("Update equipment set Quantity=? where Name=?");
    
ps.setInt(1, Equip);

ps.setString(2, Name1);

ps.executeUpdate();

  //  out.print("Nu  e suficiente.<a href='Soldiers.jsp'> Ok </a>");
}



}

*/


//Integer Nou = Countrow - java.lang.Integer.parseInt(Unit);
//Integer As = Val + java.lang.Integer.parseInt(Unit);

//Integer Equip1 = Equip - java.lang.Integer.parseInt(Grenade);
//int i=st.executeUpdate("update food set Quantity="+ Nou + "Where Name="+ Name );

/*
if(Nou>0 && As<=5){
ps=con.prepareStatement("Update food set Quantity=? where Name=?");

ps.setInt(1, Nou);
ps.setString(2, Name);
ps.executeUpdate();

ps=con.prepareStatement("Update soldiers set Val=? where ServiceNumber=?");
ps.setInt(1, As);
ps.setString(2, ServiceNumber);
ps.executeUpdate();



response.sendRedirect("Soldiers.jsp");
}
else {
    out.print("Nu  e suficiente.<a href='Soldiers.jsp'> Ok </a>");
}

*/

//response.sendRedirect("Soldiers.jsp");


//out.println("Service Number already exists.<a href='Soldiers.jsp'> Ok </a>!");
con.close();
//session.setAttribute("Quantity", "update ("+Nou+") cacat");
}

catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>