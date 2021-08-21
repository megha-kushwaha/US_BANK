<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>US BANK</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

         <link rel="icon" href="img/logo1.png" type="image/gif" sizes="20x20">
         
         
<style>
    
html,body{
    height: 100%;
    width: 100%;
}
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

*:focus {
  outline: 0;
}


nav {
	width: 100%;
}

ul {
	list-style: none;
	display: flex;
}

li {
	display: flex;
}

li a:before {
	left: 0;
}

li a:before,
li a:after {
	background-color: #dadada;
	border-radius: 0 10px 0 10px;
	bottom: 0;
	content: '';
	position: absolute;
	height: 3px;
	transition: width 0.5s ease-in-out;
	width: 0;
	z-index: -1;
}

li a:after {
	right: 0;
}

li a:hover:before,
li a:focus:before,
li a:active:before,
li a:hover:after,
li a:focus:after,
li a:active:after {
	width: 55%;
}

li a {
	background-color: rgba(4, 10, 24, 0.4);
	border-radius: 0 10px 0 10px;
	color: #ffffff;
	cursor: pointer;
	font: 400 1.5rem 'Dancing Script', sans-serif;
	margin: 0 10px;
	overflow: hidden;
	padding: 0.5rem 1rem;
	position: relative;
	transition: text-shadow 0.25s 0.5s ease-in-out;
	text-decoration: none;
	text-shadow: 0 0 10px #000000;
	z-index: 2;
}

li a:hover,
li a:focus,
li a:active {
	text-shadow: 0 0 5px rgba(0, 130, 200, 0.9);
	transition: text-shadow 0.5s 0.25s ease-in-out;
}






#back{
    height: 100%;
    width: 100%;
    background-color: #000000f8;
    opacity: .9;
}

.line1{
    position: absolute;
    right: 25%;
    top: 0;
    height: 20%;
    width: 4px;
    background-color: rgb(255, 255, 0);
    box-shadow: 1px 1px 20px yellow;
}

.line2{
    position: absolute;
    right: 25%;
    bottom: 0;
    height: 20%;
    width: 4px;
    background-color: rgb(255, 255, 0);
    box-shadow: 1px 1px 20px yellow;
}

#content{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    height: 60%;
    width: 60%;
    border-radius: 30px;
    background-image: linear-gradient(To bottom right,rgba(0, 0, 0, 0.541),rgba(255, 255, 255, 0.103),black);
    box-shadow: 0px 0px 30px rgba(61, 61, 61, 0.459);
}


#rect{
    position: absolute;
    top: -15%;
    left: 14%;
    height: 70%;
    width: 25%;
    border: 3px solid yellow ;
    box-shadow: 0px 0px 10px rgba(255, 255, 0, 0.842);
}


@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table { 
	  	width: 100%; 
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}

}

</style>

    </head>
    <body>
        
         <nav class="navbar navbar-expand-md bg-dark navbar-dark">
         <img class="navbar-brand m-0 p-0" src="img/logo1.png" alt="US BANk"  width="200" height="56" />
         
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
         <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="collapsibleNavbar">
           
            <ul class="navbar-nav ml-auto">
               <li class="nav-item ">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Locate</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" >Help</a>
                </li>
            </ul>
         </div>  
         </nav>
      <!-- end of nav bar-->