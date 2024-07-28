<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql" %>

<sql:setDataSource var="dataSource"
       driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:3306/course_app"
       user="root"
       password="root"/>
       
<body>
 <sql:query var="course_app" dataSource="${dataSource}">
  
 Select * from course_list
 </sql:query>
 <div>
<a href="adminHome.jsp"><button id="regcourse">HOME PAGE </button></a><br>
<a href="addCourse.jsp"><button id="regcourse">REGISTER COURSE </button></a><br>
<a href="listCourses.jsp"><button id="regcourse">DELETE COURSE </button></a><br>
<a href="welcome.jsp"><button id="regcourse">LOG OUT </button></a><br>
  </div>
 <table >
 
 <c:forEach var="course" items ="${course_app.rows}">
 
  Course ID: <c:out value="${course.couId}"/> <br>
  Course Name:<c:out value="${course.couName}"/><br>
  Course Description: <c:out value="${course.couDesc}"/><br>
  Capacity:<c:out value="${course.couCapac}"/><br>
  Course Schedule:<c:out value="${course.couSchdl}"/><br> 
 
 
 <input type="submit" value="Apply" onclick="Login.jsp"> 
 <br><br>
 </c:forEach>

 
 </table>
 </body>
       
 