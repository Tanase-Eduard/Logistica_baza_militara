<!DOCTYPE HTML>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>new registation</title>
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
        </style>
    </head>
    <body>
        
        <% String name=(String)session.getAttribute("Name"); %>
                    <div class="topnav">
        <br>

        <h2></h2>
        <p> <a href="Home1.jsp"><b><strong>Home</strong></b></a></p>
        <p> <a href="Ammunition.jsp"><b><strong>Ammunition</strong></b></a></p>
        <p> <a href="Equipment.jsp"><b><strong>Equipment</strong></b></a></p>
        <p> <a href="Food.jsp"><b><strong>Food</strong></b></a></p>
        <p> <a href="Users.jsp"><b><strong>Users</strong></b></a></p>
        <p> <a href="Soldiers.jsp" class="active"><b><strong>Soldiers</strong></b></a></p>
        <p> <a href="Vechiles.jsp"><b><strong>Weapons</strong></b></a></p>
        
                                <p> <a href="index.html"><b><strong>Log out</strong></b></a></p>
        
                                <p> <a class="name"><b> <strong> <% out.print("Hello " + name); %> </strong></b></a></p>
        <br/>

                    </div><br>
                    
                                        <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
                <form action="Soldier_add-process.jsp" method="post">
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
                            <option value="Private">Private</option>
                            <option value="Sergeant">Sergeant</option>
                            <option value="Captain">Captain</option>
                            <option value="General">General</option>
                            
                    </select>
                       </td>
                </tr>
                <tr>
                    <td align="right">Unit:</td>
                    <td> <input type="text" name="Unit" /></td>
                </tr>
                <tr>
                    <td align="right">Date:</td>
                    <td> <input type="date" name="DateofBirth"  min="1950-01-01" /></td>
                </tr>
                <tr>
                    <td align="right">Country:</td>
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
                            <option value="Active">Active</option>
                            <option value="On Battlefield">On Battlefield</option>
                            <option value="KIA">KIA</option>
                            <option value="MIA">MIA</option>  
                            <option value="Injured">Injured</option>
                            <option value="Retired">Retired</option>
                   </select></td>
                </tr>
            </table>
                    <p align="center"> <input type="submit" value="Register " /> </p>
        </form>
    </body>
</html>
