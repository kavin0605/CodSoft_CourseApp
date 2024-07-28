<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head> 
<style>
  
body {
  background-color: black;
  text-align: center;
  font-size:20;
    background-image:url('bg-img.jpg');
   
}
h2 {
text-align: center;
background-color:#e46161;
color:white;
padding-top:30px;
padding-bottom:30px;

width: 100%;
}

table {
color:green;
height:20px;
font-size:10;
text-align:center;
cellpading:6;
border:35px;
background-color:white;
padding:3px;
 


}
#button 
{
background-color:orange;
border: none;
color: white;
padding-top:10px;
padding-bottom:10px;
padding-right:40px;
padding-left:40px;
text-align:center;
text-decoration: none;
display: inline-block;
font-size:20px;
width:80%;
}
#button:hover 
{
background-color:red;
}
input
{
text-align:left;
font-size:20px;
}
td
{
font-size: 25px;
align:center;
text-width:20px;
padding-right:100px;
padding-lext:50px;
padding-top:15px;
padding-bottom:15px;
border:35px;
background-color:#a62671;
color:white;
}
tr
{
text-align:right;
font-size: 20px;
padding-right:100px;
padding-lext:50px;
padding-top:15px;
padding-bottom:15px;
border:35px;
}
th
{
text-align:left;
text-indent:justify;
color:white;
font-left:15px;
font-size: 25px;
padding-top:15px;
padding-bottom:15px;
text-align:center;
text-shadow:2px 2px 10px #000000;
background-color:#5c3551;
}

.center {
  margin-left: auto;
    margin-right: auto;
  width: 100%;
  border: 3px solid green;
  padding: 10px;
}
#coursehead
{
font-size:40px;
padding: 10px;
text-align:center;
font-family: "Lucida Console", "Courier New", monospace;
 
width:10%;
}
#coursedesc
{
font-size:20px;
padding: 10px;
text-align:left;
 
width:40%;
}
#count {
font-size:25px;
padding: 10px;
text-align:center;
 
width:12%;
}
#regcourse
{

background-color:#683531;
border: none;
color: white;
padding-top:10px;
padding-bottom:10px;
padding-right:70px;
padding-left:70px;
text-align:justify;
text-decoration: none;
display: inline-block;
font-size:20px;

}
#regcourse:hover 
{
background-color:green;]
}
div 
{
display: flex;
justify-content:right;
padding-right:3px;
}
</style>
<script type="text/javascript">
        function confirmDrop(courseId) {
            if (confirm("Are you sure you want to drop the course?")) {
                document.getElementById("dropCourseForm_" + courseId).submit();
            }
        }
    </script>
</head>
<body>
 <h2>REGISTERED COURSES</h2><br> <br> 
  <div>

<a href="Courses.jsp"><button id="regcourse">REGISTER COURSE </button></a><br>
<a href="registeredCourses"><button id="regcourse">DROP COURSE </button></a><br>
<a href="welcome.jsp"><button id="regcourse">LOG OUT </button></a><br>
  </div>
<table class="center" border=2px>
   
        <tr>
            <th>COURSE NAME</th>
            <th>DESCRIPTION</th>
            <th>CAPACITY</th>
            <th>SCHEDULE</th>
            <th>ACTION</th>
        </tr>
   
   
    
        <c:forEach var="course" items="${registeredCourses}">
            <tr>
                <td id="coursehead"><c:out value="${course.courseName}"/></td>
                <td id="coursedesc"><c:out value="${course.description}"/></td>
                <td id="count"><c:out value="${course.capacity}"/></td>
                <td id="count"><c:out value="${course.schedule}"/></td>
                <td>
                   <form id="dropCourseForm_${course.id}" action="dropCourse" method="post">
                        <input type="hidden" name="courseId" value="${course.id}">
                        <button type="button" onclick="confirmDrop(${course.id})" id="button">Drop Course</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
 
</table>

</body>