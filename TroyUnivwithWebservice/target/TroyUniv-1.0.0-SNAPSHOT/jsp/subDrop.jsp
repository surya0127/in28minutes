<!DOCTYPE html>
<html lang="en">
<head>
  <title>ESAIP</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
	background-color:white;
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

.back {
    background-image: url("./../images/stu6.jpg");
	width:100%;
	height:100%;
   color:black;
   }
   

.container {
    padding: 12px;
}

.btn-size{
width:150px}

span.psw {
    float: right;
    padding-top: 16px;
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
			url : "./getDropList.htm",
			dataType : 'json',
			success : function(data) {
				$.each(data.subjectdetails, function(i, item) {
					var markup = "<tr><td>" + item.subjectid + "</td><td>" + item.subjectname + "</td><td>" + item.faculty + "</td><td>" +item.timings+"</td><td>" +item.Officehours +"</td><td>" +item.LastDt+"<td><input type='checkbox' name='chkboxName' id ='"+item.subjectid+"' value='"+item.subjectid+"'></td></tr>";
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
	
	var selsubjects =$("input[name=chkboxName]:checked").map(
		     function () {return this.value;}).get().join(",");
	$.ajax({
		type : 'POST',
		url : "./dropReg.htm",
		dataType : 'json',
		data : {'selctedsub':selsubjects },
		success : function(data) {
			if(data.status == 'success')
				alert(' Saved Successfully');
			},		
		failure : function() {
			alert("Failed!");
		}
	});
	
	loadsubjects();
	$("#dept").val("0");
	$('#sem').val("0");
	GetDropDownData();
}
	
function GetDropDownData() {
	
	
	$.ajax({
		type : 'POST',
		url : "./getnotifications.htm",
		dataType : 'json',
		success : function(data) {
			$.each(data.notificationdetails, function(i, item) {
				var markup = "<tr><td>" + item.notificationid + "</td><td>" + item.notificationmsg + "</td><td>" + item.notifiedby + "</td><td>" +item.notifieddate+"</td></tr>";
	            $("table tbody").append(markup);
			});
		},
		failure : function() {
			alert("Failed!");
		}
	});
}	

</script>

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
	
    <ul class="nav navbar-nav" style="padding-left:150px;padding-top:25px;">
   <li ><a href="redirect.htm?id=studentlogin"><b>Home</b></a></li>
<li><a href="redirect.htm?id=subjectReg"><b>Submit Issue</b></a></li>
<li ><a href="redirect.htm?id=subDrop" style="background-color:#adc4ea"><b>Notifications</b></a></li>
<li ><a href="redirect.htm?id=subInfo"><b>View Issue Updates</b></a></li>
<li ><a href="redirect.htm?id=updateInfo"><b>Update Info</b></a></li>
<li><a href="redirect.htm?id=index"><b>logout</b></a></li>

    </ul>
	<div style="padding-left:1200px; padding-top:40px;" >
  <b>Hi <%out.print( request.getSession().getAttribute("User")) ;%>!</b>
  </div>
  
</div>




</nav>


<div class="back">



		<h1 align="middle">
			<u>Notifications</u>
		</h1>
		<br>
		
		
		
		
		<table border="1" class="table table-hover">
			<tr>
				<th>Notification Id</th>
				<th>Notification</th>
				<th>Notified By</th>
				<th>Notification Released Date</th>
				
			</tr>

		</table>
		<!-- <span class="btn-size" style="padding-left:550px"><b><input type="submit" value="Submit"></b></span> -->
		


	</div>
<br><br>
<br>
<br><br><br><br><br><br><footer >
  <p style="text-align:center;height:10px">All rights @ESAIP</p>
</footer>
</body>
</html>
