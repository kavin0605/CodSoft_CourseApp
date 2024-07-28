
<%--This is a login application  --%>
<%--Login.jsp , Register.jsp, registerservlet.jsp, loginservlet.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<head>
<blink><h1><strong><marquee scrollamount="15" behavior="scroll" direction="right"> <p class="rainbow-text">
COURSE REGISTRATION APPLICATION</p></marquee></strong></h1></blink>
<meta name="viewp


ort" content="width=device-width, initial-scale=1.0">


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
width: 211%;
 

}
.login-input {
    font-family: 'Helvetica', sans-serif;
    font-size: 18px;
    font-weight: bold;
}
table {
margin: top 200px;
position:fixed;
top:170px;
left:33%;
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
padding:10px 100px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size:20px;
background-color:green;
}
#button:hover 
{background-color:#347474;}

#button1 
{
position:fixed;
top:590px;
left:35%;
border: none;
color: white;
padding:10px 100px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size:20px;
background-color:red;

}
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
div 
{
text-align:center;
}


</style>
</head>
<body >
<table  align="center">
<form action ="adminLogin" name ="f1" method = "post" onSubmit ="return validate()">
<tr><td></td></tr>
<tr text-align="right"><th><h2> ADMIN LOGIN </h2></th></tr>
<tr> <td text-align="left"> USER NAME: </td> <td><input  type ="text" name ="username"/> </td><br><br>
<tr> <td text-align="left"> PASSWORD :</td> <td>  <input type="password" name="password"/> </td><br>
<tr align = "centre" ><td></td> <td><h6><input id="button" type = "submit" value ="Login"/></h6></td></tr>
</form>
</table>
<script>
function validate()
{
	var x1 = document.f1.username.value;
	var x2 = document.f1.password.value;
	if(x1== null|| x1=="")
		{
		alert ("Please enter username!");
		return false;
	}
	if(x2== null|| x2=="")
	{
	alert ("Please enter password!");
	return false;
}
	return true;
}
</script>
<c:if test="${param.error == 'true'}">
<p class="blinking-button" id="button1" > Invalid UserName or Password!... </p> </button>
</c:if>
</body>