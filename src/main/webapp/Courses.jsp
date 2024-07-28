<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSource"
       driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:3306/course_app"
       user="root"
       password="root"/>
<style>
/* Your existing CSS styles */
body {
  background-color: black;
  text-align: center;
  font-size: 20px;
  background-image: url('bg-img.jpg');
}
h2 {
  text-align: center;
  background-color: #e46161;
  color: white;
  padding-top: 30px;
  padding-bottom: 30px;
  width: 100%;
}
table {
  color: green;
  height: 20px;
  font-size: 10px;
  text-align: center;
  cellpading: 6;
  border: 35px;
  background-color: #ffe8cf;
  padding: 3px;
}
#button {
  background-color: #31aa75;
  border: none;
  color: white;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-right: 70px;
  padding-left: 70px;
  text-align: justify;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
}
#button:hover {
  background-color: orange;
}
input {
  text-align: left;
  font-size: 20px;
}
td {
  font-size: 25px;
  align: center;
  text-width: 20px;
  padding-right: 100px;
  padding-left: 50px;
  padding-top: 15px;
  padding-bottom: 15px;
  border: 35px;
  background-color: #a62671;
  color: white;
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

}
.center {
  margin-left: auto;
  margin-right: auto;
  width: 100%;
  border: 3px solid green;
  padding: 10px;
}
#coursehead {
  font-size: 40px;
  padding: 10px;
  text-align: center;
  font-family: "Lucida Console", "Courier New", monospace;
  width: 10%;
}
#coursedesc {
  font-size: 20px;
  padding: 10px;
  text-align: left;
  width: 40%;
}
#count {
  font-size: 25px;
  padding: 10px;
  text-align: center;
  width: 12%;
  color: white;
}
#regcourse {
  background-color: #683531;
  border: none;
  color: white;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-right: 70px;
  padding-left: 70px;
  text-align: justify;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
}
#regcourse:hover {
  background-color: green;
}
.alert {
  padding: 2px;
  margin-top:1px;
  margin-bottom: 3px;
  border: 5px solid transparent;
  border-radius: 50px;
  text-align: center;
  font-size: 15px;
	color:red
}
.alert-success {
  color: white;
  background-color: green;
  border-color: white;
}
.alert-danger {

  color:white;
  background-color:red;
  border-color: #ebccd1;
}
div 
{
display: flex;
justify-content:right;
padding-right:3px;
}
</style>

<body>
<sql:query var="courses" dataSource="${dataSource}">
  Select * from courses
</sql:query>

<h2>AVAILABLE COURSES</h2><br><br>

 <div>

<a href="Courses.jsp"><button id="regcourse">REGISTER COURSE </button></a><br>
<a href="registeredCourses.jsp"><button id="regcourse">DROP COURSE </button></a><br>
<a href="welcome.jsp"><button id="regcourse">LOG OUT </button></a><br>
  </div>
<!-- Alert container -->
<div id="alertContainer"></div>

<table class="center" border=2px>
    <tr>
        <th>COURSE NAME</th>
        <th>DESCRIPTION</th>
        <th>CAPACITY</th>
        <th>SCHEDULE</th>
        <th>Click to Register</th>
    </tr>
            
    <c:forEach var="Course" items="${courses.rows}">
        <tr>
            <td id="coursehead"><c:out value="${Course.course_name}"/></td>
            <td id="coursedesc"><c:out value="${Course.description}"/></td>
            <td id="count"><c:out value="${Course.capacity}"/></td>
            <td id="count"><c:out value="${Course.schedule}"/></td>
            <form action="register" method="post">
                <td><button id="button" type="submit" name="courseId" value="${Course.id}">Register</button></td>
            </form>
        </tr>
    </c:forEach>
</table>

<script>
  function getUrlParameter(name) {
      name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
      var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
      var results = regex.exec(location.search);
      return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
  }

  function validate() {
      var success = getUrlParameter('success');
      var error = getUrlParameter('error');
      var alertContainer = document.getElementById('alertContainer');
      
      if (success === 'true') {
          alertContainer.innerHTML = '<div class="alert alert-success"><h3>Successfully registered!...</h3></div>';
      }
      if (error === 'true') {
          alertContainer.innerHTML = '<div class="alert alert-danger"><h3>Registration failed.</h3></div>';
      }
      if (error === 'full') {
          alertContainer.innerHTML = '<div class="alert alert-danger"><h3>Course is full.</h3></div>';
      }
      if (error === 'alreadyRegistered') {
          alertContainer.innerHTML = '<div class="alert alert-danger"><h3>You are already registered for this course.</h3></div>';
      }
  }

  window.onload = validate;
</script>
</body>
