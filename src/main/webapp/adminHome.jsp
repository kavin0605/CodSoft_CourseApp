<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="dataSource"
       driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:3306/course_app"
       user="root"
       password="root"/>
       
<html>
<head>
<blink><h1><strong><marquee scrollamount="15" behavior="scroll" direction="right"> <p class="rainbow-text">
COURSE REGISTRATION APPLICATION</p></marquee></strong></h1></blink>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0; }
            100% { opacity: 1; }
        }

        .blinking-button {
            background-color:red;
            color:white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            animation: blink 1s infinite;
        }

        .blinking-button:hover {
            background-color: red;
        }

        .rainbow-text {
        background: linear-gradient(to right, violet, indigo, blue, green, yellow, orange, red);
        -webkit-background-clip: text;
        color: transparent;
        animation: rainbow-animation 5s linear infinite;
    }

    @keyframes rainbow-animation {
        0% {
            background-position: 0%;
        }
        100% {
            background-position: 100%;
        }
    }
body {
  background-color: C8ACD6;
  text-align: center;
  font-size:25;
  background-image:url('bg-img.jpg');
   
}
h2 {
text-align:center;
background-color:#e46161;
color:white;
margin: auto;
width: 100%;
 

}
table {
  color: green;
  height: 20px;
  font-size: 10px;
  text-align: center;
  cellpading: 6;
  border: 25px;
  background-color: #ffe8cf;
  padding: 3px;
 display: flex;
    justify-content: center;
}
#button 
{
border: none;
color: black;
padding:10px 10px;
text-align:center;
text-decoration: none;
display: inline-block;
font-size:20px;
background-color:orange;
width:100%;
}
#button:hover 
{background-color:red;}

input
{
text-align:left;
font-size:20px;
}
td {
  font-size: 25px;
  align: center;
  text-width: 20px;
  padding-right: 100px;
  padding-left: 50px;
  padding-top: 10px;
  padding-bottom: 10px;
  border: 25px;
  background-color: #f1b963;
  color: black;
}
tr {
  text-align: right;
  font-size: 20px;
  padding-right: 100px;
  padding-left: 50px;
  padding-top: 15px;
  padding-bottom: 15px;
  border: 35px;
}
th {
  text-align: left;
  text-indent: justify;
  color: white;
  font-left: 15px;
  font-size: 25px;
  padding-top: 15px;
  padding-bottom: 15px;
  text-align: center;
  text-shadow: 2px 2px 10px #000000;
  background-color: #5c3551;
}
#button 
{
border: none;
color: white;
padding:10px 100px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size:20px;
background-color:green;
}
#button:hover 
{background-color:#347474;
color:black;}


div 
{
text-align:center;
}
#regcourse {
  background-color:green;

  color: white;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-right: 70px;
  padding-left: 70px;
  
  display: inline-block;
  font-size: 20px;
   display: flex;
    justify-content:lext;
}
#regcourse:hover {
  background-color:brown;
}
div 
{
display: flex;
justify-content:right;
padding-right:3px;
}
</style>
</head>
<body>
   
<sql:query var="courses" dataSource="${dataSource}">
  Select * from courses
</sql:query>
<div>
<a href="adminHome.jsp"><button id="regcourse">HOME PAGE </button></a><br>
<a href="addCourse.jsp"><button id="regcourse">Add COURSE </button></a><br>
<a href="listCourses.jsp"><button id="regcourse">DELETE COURSE </button></a><br>
<a href="welcome.jsp"><button id="regcourse">LOG OUT </button></a><br>
  </div> <br>
    <table >
      <h2> AVAILABLE COURSES</h2>  
    <tr>
        <th>COURSE NAME</th>
        <th>DESCRIPTION</th>
        <th>CAPACITY</th>
        <th>SCHEDULE</th>
        
    </tr>
            
    <c:forEach var="Course" items="${courses.rows}">
        <tr>
            <td id="coursehead"><c:out value="${Course.course_name}"/></td>
            <td id="coursedesc"><c:out value="${Course.description}"/></td>
            <td id="count"><c:out value="${Course.capacity}"/></td>
            <td id="count"><c:out value="${Course.schedule}"/></td>
           
        </tr>
    </c:forEach>
</table>
  

</body>
</html>
 