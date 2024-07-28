
<%--This is a login application  --%>
<%--Login.jsp , Register.jsp, registerservlet.jsp, loginservlet.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
width: 180%;
 

}
.login-input {
    font-family: 'Helvetica', sans-serif;
    font-size: 18px;
    font-weight: bold;
}
table {
margin: top 200px;
position:fixed;
top:300px;
left:30%;
cellspacing:2;
font-size:15;
align:cnter;
cellpading:6;
border:35;
background-color:#f1b963;
padding: 10px;
}
#button 
{
border: none;
color: white;
padding:10px 10px;
text-align:center;
text-decoration: none;
display: inline-block;
font-size:20px;
background-color:orange;
width:100%;
}
#button:hover 
{background-color:#347474;}

input
{
text-align:left;
font-size:20px;
}
td,tr
{
text-align:left;
font-size: 25px;
align:center;
padding: 16px;
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
    <div>
<a href="adminHome.jsp"><button id="regcourse">HOME PAGE </button></a><br>
<a href="addCourse.jsp"><button id="regcourse">Add COURSE </button></a><br>
<a href="listCourses.jsp"><button id="regcourse">DELETE COURSE </button></a><br>
<a href="welcome.jsp"><button id="regcourse">LOG OUT</button></a><br>
  </div> <br>
    <table>
    <tr><th> <h2>ADD NEW COURSE</h2></th></tr>
    <tr/>
    <form action="addCourse" method="post">
    <tr> <td>Course Name:</td><td> <input type="text" name="courseName" required></td> </tr><br>
    <tr><td>Description:</td><td>  <input type="text" name="description" required></td> </tr><br>
        <tr><td>Capacity: </td><td> <input type="number" name="capacity" required></td> </tr><br>
        <tr><td>Schedule:</td><td>  <input type="text" name="schedule" required></td> </tr> <br>
       <tr><td></td><td> <input type="submit" value="Add Course" id="button"> </td></tr>
    </form>
    </table>
</body>
</html>
