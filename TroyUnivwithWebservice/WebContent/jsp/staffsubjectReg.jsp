<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ESAIP</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./../js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="./../js/jquery.treetable.js" type="text/javascript"></script>
<script src="./../js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="./../js/jquery.loadingoverlay.min.js" type="text/javascript"></script>
<script src="./../js/jquery.loadingoverlay_progress.min.js"
	type="text/javascript"></script>
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
	padding: 14px 150px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 150px;
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
    background-image: url("./../images/stu8.jpg");
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
}
</style>

<script type="application/x-javascript">
	

$(document).ready(function() {
	
	GetDropDownData();
	GetFacultyData();
});

function GetDropDownData() {
	
	
			$.ajax({
			type : 'POST',
			url : "./getdept.htm",
			dataType : 'json',
			success : function(data) {
				$.each(data.districts, function(i, item) {
					$('#dept').append($('<option />', {
						value : item.departmentid,
						text : item.departmentname
					}));
				});
			},
			failure : function() {
				alert("Failed!");
			}
		});
	}
	
function GetFacultyData() {
	
	
			$.ajax({
			type : 'POST',
			url : "./getfaculty.htm",
			dataType : 'json',
			success : function(data) {
				$.each(data.districts, function(i, item) {
					$('#faculty').append($('<option />', {
						value : item.id,
						text : item.name
					}));
				});
			},
			failure : function() {
				alert("Failed!");
			}
		});
			for(var i=2015; i<2051; i++){
				var option="<option value='"+i+"'>"+i+"</option>";
				$("#registerYear").append(option);
			}			

	}
	
function saveData() {
	
	var msg = $('textarea#name').val();
	//alert('msg'+msg);

	var notifyto=$('#dept').find('option:selected').val();
	
	
	$.ajax({
		type : 'POST',
		url : "./saveNotify.htm",
		data : { 'msg' : msg,'notifyto':notifyto},
		dataType : 'json',
		success : function(data) {
			if(data.status == 'success')
				alert(' Saved Successfully');
		},
		failure : function() {
			alert("Failed!");
		}
	});
}


</script>

</head>
<body>
	<nav class="navbar navbar-fixed">
		<div class="container-fluid">
			<div class="navbar-header">
				<img src="./../images/esaip1.png" height="70" width="100" />
			</div>
			<div class="navbar-header" style="padding-left: 10px">
				<h1
					style="font-family: Broadway; color: #9400D3; text-align: center; padding-top: 15px">
					<b>ESAIP</b></h1>
				</h6 > Graduate School of Engineering</h6>

			</div>

			<ul class="nav navbar-nav"
				style="padding-left: 30px; padding-top: 25px;">
				<li class="active"><a href="redirect.htm?id=stafflogin"><b>Home</b></a></li>
				<li><a href="redirect.htm?id=staffsubjectReg"
					style="background-color: #adc4ea"><b>Send Notification</b></a></li>
				<li><a href="redirect.htm?id=subjectteach"><b>View Notifications</b></a></li>
				<li><a href="redirect.htm?id=mysubject"><b>Issue Mgmt</b></a></li>
				<li><a href="redirect.htm?id=staffsubDrop"><b>Issue Resolution
							</b></a></li>
				<li><a href="redirect.htm?id=index"><b>logout</b></a></li>

			</ul>
			<div style="padding-left: 850px; padding-top: 40px;">
				<b>Hi <%
					out.print(request.getSession().getAttribute("User"));
				%>!
				</b>
			</div>

		</div>




	</nav>



	<div class="back">
		
			<h1 align="middle">
				<u>Sent Notification</u>
			</h1>
			<div align="center">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><b>Notify Messages	</b></label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea 
				rows="4" cols="50"  placeholder="Enter Notification  Message" name="name" id ="name" required></textarea ><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="white-space: pre-wrap;"><br></span>
				
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><b>Notify To</b></label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
				 name="dept" id="dept"
				style="width: 30%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;">
				<option value="0">ALL</option>

			</select><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				</div>
  		
				
			<div align="center">
				<button type="submit" style="padding-left: 100px"  onclick="saveData()">Notify</button>
			</div>
			&nbsp;&nbsp;&nbsp;

<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>
			<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>	<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>

	</div>

		
	

	<footer style="margin-top: -15px">
		<p style="text-align: center; height: 10px">All rights
			@ESAIP</p>
	</footer>
	<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>
<span style="white-space: pre-wrap;"><br></span>
		
	
</body>
</html>
