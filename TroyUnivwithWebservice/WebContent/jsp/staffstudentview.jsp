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
<script src="./../js/jquery.loadingoverlay.min.js"
	type="text/javascript"></script>
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
	background-color: white;
}

input[type=text], input[type=password] {
	width: 60%;
	padding: 12px 150px;
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

.btn-size {
	width: 150px
}

span.psw {
	float: right;
	padding-top: 16px;
}

.back {
    background-image: url("./../images/stu9.jpg");
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
	
	loadsubjects();
	
	
});

function loadsubjects() {
	
		
	$("table tbody").find('input[name="chkboxName"]').each(function(){
        
        $(this).parents("tr").remove();
    
	});
			$.ajax({
			type : 'POST',
			url : "./getStudList.htm",
			dataType : 'json',
			success : function(data) {
				$.each(data.subjectdetails, function(i, item) {
					var seme="";
					if(item.semester=1)
						{
							seme="Spring";
							
						}else if(item.semester=2)
						{
							seme="Fall";
							
						}else if(item.semester=1)
						{
							seme="Summer";
							
						}
					var markup;
					if(item.marks != undefined && item.marks != "" && item.remarks != undefined && item.remarks != ""){
					 markup = "<tr><td>" + item.stname + "</td><td>" + item.department + "</td><td>" +seme+"</td><td>" +item.subjectname +"</td><td>"+item.marks+"</td><td>"+item.remarks+"</td></tr>";
					} else{
					 markup = "<tr><td>" + item.stname + "</td><td>" + item.department + "</td><td>" +seme+"</td><td>" +item.subjectname +"</td><td><input type='text' style='padding: 1px 1px;width: 55px;' name='marks_"+item.id+"_"+item.subjectid+"' id='marks_"+item.id+"_"+item.subjectid+"'></td><td><input type='text' style='padding: 1px 1px;width: 55px;' name='remarks_"+item.id+"_"+item.subjectid+"' id='feedBack_"+item.id+"_"+item.subjectid+"'></td></tr>";	
					}
		            $("table tbody").append(markup);
				});
			},
			failure : function() {
				alert("Failed!");
			}
		});
	}
$(document).on('click','#questionSub',function(){
	var marksList=[];
	var feedBackList=[];
	$('input').each( function(index){  
		        var input = $(this);
		        if(input.val() != ""){
		        	console.log(input.attr('id').indexOf("marks"));
		        	if(input.attr('id').indexOf("marks") > -1){
		        	marksList.push(input.attr('id')+"_"+input.val());
		        	} 
		        	if(input.attr('id').indexOf("feedBack_") > -1){
		        		feedBackList.push(input.attr('id')+"_"+input.val());
			        	} 
		        console.log('Type: ' + input.attr('type') + 'id: ' + input.attr('id') + 'Value: ' + input.val());
		        }
		    }
		)
		console.log(feedBackList);
		console.log(marksList);
	console.log(marksList.length);
	if(marksList.length > 0  ){
		$.ajax({
			type : 'POST',
			url : "./saveStudentMarks.htm?marksList="+marksList,
		//	data : {'marksList' : "test"},
			dataType : 'json',
			success: function(data){
				console.log(data);
				if(data.status == 'success')
					alert(' update Successfully');
				location.reload();
			},
			failure : function() {
				alert("Failed!");
			}
		}); 
	}
	
	if( feedBackList.length > 0 ){
		$.ajax({
			type : 'POST',
			url : "./saveStudentfeedBackList.htm?feedBackList="+feedBackList,
		//	data : {'marksList' : "test"},
			dataType : 'json',
			success: function(data){
				console.log(data);
				if(data.status == 'success')
					alert(' update Successfully');
				location.reload();
			},
			failure : function() {
				alert("Failed!");
			}
		}); 
	}
});


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
				<li><a href="redirect.htm?id=staffsubjectReg"><b>SubjectRegistration</b></a></li>
				<li><a href="redirect.htm?id=subjectteach"><b>Subject
							To Teach</b></a></li>
				<li><a href="redirect.htm?id=mysubject"><b>MySubjects</b></a></li>							
				<li><a href="redirect.htm?id=staffsubDrop"><b>Subject
							Drop</b></a></li>
				<li><a href="redirect.htm?id=staffstudentview"
					style="background-color: #adc4ea"><b>Student View</b></a></li>
				<li><a href="redirect.htm?id=index"><b>logout</b></a></li>

			</ul>
			<div style="padding-left: 850px; padding-top: 40px;">
				<b>Hi <%out.print( request.getSession().getAttribute("User")) ;%>!
				</b>
			</div>

		</div>




	</nav>



	<div class="back">



		<h1 align="middle">
			<u>Students View</u>
		</h1>
		<br>
		<br>
		<span style='width: 1px;padding: 1180px;'><button type='submit' id='questionSub' class='cancelbtn1'>Update</button></span>
		<table border="1" class="table table-hover">
			<tr>
				<th>Student Name</th>
				<th>Department</th>
				<th>Semister</th>
				<th>Subject</th>
				<th>Credits</th>
				<th>Remarks</th>
			</tr>

		</table>
		<!-- <span class="btn-size" style="padding-left:550px"><b><input type="submit" value="Submit"></b></span> -->


	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer>
		<p style="text-align: center; height: 10px">All rights
			@ESAIP</p>
	</footer>
</body>
</html>
