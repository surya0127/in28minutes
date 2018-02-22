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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	width: 40%;
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
	background-image: url("./../images/stu12.jpg");
	width: 100%;
	height: 100%;
	color: black;
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
	
});

function loadsubjects() {
	
	var dept = $('#dept').val();
	var sem = $('#sem').val();
	if(dept ==0 ){
		alert('Please select Department ');
		return;
	}
	if(sem ==0 ){
		alert('Please select Semester ');
		return;
	}
	
	$("table tbody").find('input[name="chkboxName"]').each(function(){
        
        $(this).parents("tr").remove();
    
	});
			$.ajax({
			type : 'POST',
			url : "./getSubjectReg.htm",
			dataType : 'json',
			data : {'dept':dept,'sem' :sem },
			success : function(data) {
				$.each(data.subjectdetails, function(i, item) {
					var dateVar = item.LastDt;
					var dsplit = dateVar.split("-");
					var d=new Date(dsplit[0],dsplit[1]-1,dsplit[2]);
					if(new Date() > new Date(item.LastDt)){
					var markup = "<tr><td>" + item.subjectid +"</td><td>" + item.subjectname + "</td><td>" + item.name + "</td><td>" +item.timings+"</td><td>" +item.Officehours +"</td><td>" +item.LastDt+"</td><td>" +item.LastDatetodrop+"</td><td><input type='checkbox' disabled name='chkboxName' id ='"+item.subjectid+"' value='"+item.subjectid+"'></td></tr>";
					} else {
						var markup = "<tr><td>" + item.subjectid +"</td><td>" + item.subjectname + "</td><td>" + item.name + "</td><td>" +item.timings+"</td><td>" +item.Officehours +"</td><td>" +item.LastDt+"</td><td>" +item.LastDatetodrop+"</td><td><input type='checkbox' name='chkboxName' id ='"+item.subjectid+"' value='"+item.subjectid+"'></td></tr>";	
					}
		            $("table tbody").append(markup);
				});
			},
			failure : function() {
				alert("Failed!");
			}
		});
	}
	
function showSelectedValues()
{
	var cont =true;
	$.ajax({
		type : 'POST',
		url : "./checkIssues.htm",
		dataType : 'json',
		success : function(data) {
			if(data.status == 'fail')
				//alert(' Saved Successfully');
			alert(' Maximum allowed issues per day is 2 only.');
			cont =false;
		},
		failure : function() {
			alert("Failed!");
		}
	});
	
	if(!cont)
		{
			return;
		}
	var msg = $('textarea#name').val();
	//alert('msg'+msg);

	var notifyto=$('#dept').find('option:selected').val();
	
	
	$.ajax({
		type : 'POST',
		url : "./saveIssue.htm",
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
				style="padding-left: 150px; padding-top: 25px;">
				<li><a href="redirect.htm?id=studentlogin"><b>Home</b></a></li>
				<li><a href="redirect.htm?id=subjectReg"
					style="background-color: #adc4ea"><b>Submit Issue</b></a></li>
				<li><a href="redirect.htm?id=subDrop"><b>Notifications</b></a></li>
				<li><a href="redirect.htm?id=subInfo"><b>View Issue
							Updates</b></a></li>
				<li ><a href="redirect.htm?id=updateInfo"><b>Update Info</b></a></li>							
				<li><a href="redirect.htm?id=index""><b>logout</b></a></li>

			</ul>
			<div style="padding-left: 1200px; padding-top: 40px;">
				<b>Hi <%
					out.print(request.getSession().getAttribute("User"));
				%>!
				</b>
			</div>

		</div>




	</nav>



	<div class="back">

		<h1 align="middle">
			<u>Issue Registration</u>
		</h1>


		<div align="center">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><b>Issue
					Description</b></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea rows="4" cols="50"
				placeholder="Enter Notification  Message" name="name" id="name"
				required></textarea>
			<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
				style="white-space: pre-wrap;"><br></span>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><b>Issue
					Related To</b></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="dept"
				id="dept"
				style="width: 30%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;">
				<option value="0">Other</option>

			</select><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		</div>

		<div align="center">
			<button type="submit" style="padding-left: 50px"
				onclick="showSelectedValues()">Register</button>
		</div>
		<br>
		<br> &nbsp;&nbsp;&nbsp;

	</div>
	<br>
	<br>
	<br>
	<br>
	<footer style="margin-top: -15px">
		<p style="text-align: center; height: 10px">All rights @ESAIP</p>
	</footer>
</body>
</html>
