<!DOCTYPE html>
<html lang="en">
<head>
  <title>ESAIP</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
   
    
   footer {
      background-color: #555;
      color: white;
      padding: 10px;
    }
	.back {
    background-image: url("./../images/banner.jpg");
   
   }
   form {
    border: 10px solid #f1f1f1;
}


input[type=text], input[type=password] {
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}


button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}


button:hover {
    opacity: 0.8;
}


.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}


.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}



.container {
    padding: 12px;
}


span.psw {
    float: right;
    padding-top: 16px;
}

.back {
    background-image: url("./../images/stu7.jpg");
	width:100%;
	height:100%;
   color:black;
   }

@media screen and (max-width: 300px) {
    span.psw {
        display: block;
        float: none;
    }
    .cancelbtn {
        width: 100%;
    }
  
  </style>
</head>
<body >
<nav class="navbar navbar-fixed">
  <div class="container-fluid">
    <div class="navbar-header">
      <img src="./../images/esaip1.png" height="70" width="100"/>
    </div>
	<div class="navbar-header" style="padding-left:10px">
    <h1
					style="font-family: Broadway; color: #9400D3; text-align: center; padding-top: 15px">
					<b>ESAIP</b></h1>
				</h6 > Graduate School of Engineering</h6>

    </div>
	
    <ul class="nav navbar-nav" style="padding-left:30px;padding-top:25px;">
   <li  class="active" style="background-color:#adc4ea"><a href="redirect.htm?id=stafflogin"><b>Home</b></a></li>
<li><a href="redirect.htm?id=staffsubjectReg"><b>Send Notification</b></a></li>
<li><a href="redirect.htm?id=subjectteach"><b>View Notifications</b></a></li>
<li><a href="redirect.htm?id=mysubject"><b>Issue Mgmt</b></a></li>
<li><a href="redirect.htm?id=staffsubDrop"><b>Issue Resolution
							</b></a></li>

<li><a href="redirect.htm?id=index"><b>Logout</b></a></li>

    </ul>
	<div style="padding-left:850px; padding-top:40px;" >
  <b>Hi <%out.print( request.getSession().getAttribute("User")) ;%>!</b>
  </div>
  
</div>




</nav>
<div style="margin-top:-20px">
<img height="500px" width="100%"src="./../images/staff.jpg"/>
</div>


<h3 style="font-style:Comic Sans MS;color:black;text-align:center;padding-top:15px"><b><u>About Us</u></b></h3>

<p style="font-style:Monospace;font-size:20px;color:black;text-align:justify; text-indent: 50px;padding:50px">Troy University, located in Alabama in the US, offers undergraduate and graduate degrees through
 its colleges and schools of Arts and Sciences, Communication and Fine Arts, Education,
 Health and Human Services, The Sorrell College of Business and Graduate School.
 Troy University was founded on February 26, 1887 after an act of the Alabama Legislature established Troy State Normal School.
 The School was formed for the purpose of training teachers for Alabama’s schools. In 1893 the name changed to Troy State Normal College and offered extension courses aimed at teachers and until 1929 awarded teaching certificates. This is when the State Board of Education renamed the school as Troy State Teacher’s College. The College saw a huge growth in enrollment after World War II and as a result introduced new degrees, in disciplines apart from teaching. Seeing this change the State Board of Education removed 'Teacher’s' from the College’s name in 1957. In 1967 the College was removed from the control of the State Board of Education and handed over to the Troy State College Board of Trustees. The new board changed the College’s name to Troy State University, which became official on December 14, 1967. 
 In April 2004 the Board of Trustees voted to remove 'State' from the University’s name.</p>


  



<footer style="margin-top:-15px">
  <p style="text-align:center;height:10px">All rights @ESAIP</p>
</footer>
</body>
</html>
