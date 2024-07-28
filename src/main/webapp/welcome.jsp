<%--This is a login application  --%>
<%--Login.jsp , Register.jsp, registerservlet.jsp, loginservlet.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<head>
<blink><h1><strong><marquee scrollamount="15" behavior="scroll" direction="right"> <p class="rainbow-text">
COURSE REGISTRATION APPLICATION</p></marquee></strong></h1></blink>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

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
width: 400px;
 

}

table {
margin: top 200px;
position:fixed;
top:170px;
left:33%;
cellspacing:2;
font-size:15;
align:center;
cellpading:6;
border:35;
background-color:#f1b963;
padding:50px;
width:170px;
}


td,tr
{
text-align:center;
font-size: 25px;
align:center;
padding: 16px;

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
  button {
  width:300px;
  }
</style>
</head>
<body >
<table align="center">

<tr><td></td></tr>
<tr text-align="right"><th><h2>  LOGIN </h2></th></tr>
<tr>  <td> <a href="Login.jsp"><button id="regcourse"> As a Student</button></a> </td><br><br>
<tr> <td> <a href="admin.jsp"><button id="regcourse"> As an admin</button></a>  </td><br>
 

</table>

</body>