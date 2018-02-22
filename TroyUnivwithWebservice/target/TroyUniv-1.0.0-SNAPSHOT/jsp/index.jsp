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
	width:100%;
	height:100%;
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
.forgotbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #C2C4CB;
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
	
function displaygraduate(){
	
	if($('#utype').val()=="S"){
	
	$("#graduate").show();
	}else
		{
		$("#graduate").hide();
		}
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
			for(var i=2015; i<2051; i++){
				console.log(i);
				var option="<option value='"+i+"'>"+i+"</option>";
				$("#registerYear").append(option);
			}
	}
	
function saveData() {
	var name = $('#name').val();
	var id = $('#id').val();
	var uname = $('#uname').val();
	var password = $('#psw').val();
	var dept = $('#dept').val();
	var sem = $('#reg').find('option:selected').val();
	var utype  = $('#utype').val();
	var gendertype= $('#genderType').find('option:selected').val();
	var addr=$('#addr').val();
	var cont=$('#cont').val();
	var registerYear=$('#registerYear').find('option:selected').val();
	var question1=$('#secQuestion1').find('option:selected').val();	
	var question2=$('#secQuestion2').find('option:selected').val();
	var question3=$('#secQuestion3').find('option:selected').val();
	var answer1=$('#answer1').val();
	var answer2=$('#answer2').val();	
	var answer3=$('#answer3').val();
	
	$.ajax({
		type : 'POST',
		url : "./validateUsename.htm",
		data : { 'uname':uname},
		dataType : 'json',
		success: function(data){
			console.log(data);
			if(data){
				console.log('if');
				alert('Username already exist,Please select different userName');
				return false;
			} else {
				 $.ajax({
						type : 'POST',
						url : "./saveSignup.htm",
						data : { 'name' : name, 'id':id,'uname':uname,'password':password,'dept':dept,'sem' :sem ,'utype':utype,'gendertype':gendertype,'addr':addr,'cont':cont,'question1':question1,'answer1':answer1,'question2':question2,'answer2':answer2,'question3':question3,'answer3':answer3,'registerYear':registerYear},
						dataType : 'json',
						success: function(data){
							if(data.status == 'success')
								alert(' Saved Successfully,Please contact Admin for Approve!!!');
							document.getElementById('id01').style.display='none';
							document.getElementById('id02').style.display='block';	
						},
						failure : function() {
							alert("Failed!");
						}
					}); 
			}
		},
		failure : function() {
			alert("Failed!");
		}
	});
	
	document.getElementById('id01').style.display='none';
	document.getElementById('id02').style.display='block';
	
}
function id04Click(){
	document.getElementById('id02').style.display='none';
	document.getElementById('id04').style.display='none';
}
$(document).on('click','#forgotbtn',function(){
	 unamein=$('#unamein').val();
	if(unamein == ""){
		alert("Please enter username and proceed forgot password");
	} else{
		$.ajax({
			type : 'POST',
			url : "./getQuestions.htm",
			data : { 'unamein':unamein},
			dataType : 'json',
			success: function(data){
				if(data.question[0] != undefined){
					document.getElementById('id03').style.display='block';
					$("#label1").html(data.question[0].question1);
					$("#label2").html(data.question[0].question2);
					$("#label3").html(data.question[0].question3);
					return false;
				} else {
					alert("Invalid Username,Please try again!!!");	
				}
			},
			failure : function() {
				alert("Failed!");
			}
		});
	}
});
$(document).on('click','#resubmitPswd',function(){
	console.log('click resubmit pswd');
	var newPswd1=$('#newPswd1').val();	
	var newPswd2=$('#newPswd2').val();
	console.log(newPswd1);
	console.log(newPswd2);
	if(newPswd1 !== newPswd2){
		alert("password and retype password should be same");
	} else {
		$.ajax({
			type : 'POST',
			url : "./updatePassword.htm",
			data : { 'newPswd':newPswd2,'unamein':unamein},
			dataType : 'json',
			success: function(data){
				if(data.status == 'success'){
					alert('Password updated Successfully');
				document.getElementById('id04').style.display='none';
				document.getElementById('id02').style.display='block';
				}
			},
			failure : function() {
				alert("Failed!");
			}
		});
	}
});
	$(document).on('click','#questionSub',function(){
		var forGotquestion1=$('#forGotquestion1').val();	
		var forGotquestion2=$('#forGotquestion2').val();	
		var forGotquestion3=$('#forGotquestion3').val();
		console.log(forGotquestion1);
		console.log(forGotquestion2);
		console.log(forGotquestion3);
	 if(forGotquestion1 == "" || forGotquestion2 == "" || forGotquestion3 == ""){
		alert("Three quetions are mandatory");
		return false;
	} else { 
		console.log(unamein);
			$.ajax({
			type : 'POST',
			url : "./validateQuestions.htm",
			data : { 'question1':forGotquestion1,'question2':forGotquestion2,'question3':forGotquestion3,'unamein':unamein},
			dataType : 'json',
			success: function(data){
				if(data){
					console.log('if');
					document.getElementById('id03').style.display='none';
					document.getElementById('id04').style.display='block';
				} else {
					alert('Answers are not mismatching,Please try again!!!');
					return false;					
				}
			},
			failure : function() {
				alert("Failed!");
			}
		}); 
	}
});

function signIn() {
	
	
	var name = $('#unamein').val();
	var psw = $('#pswin').val();
		
	$.ajax({
		type : 'POST',
		url : "./userRegistration.htm",
		data : { 'uname' : name, 'psw':psw},
		dataType : 'json',
		success: function(data){
			if(data.status == 'A'){
				window.location.href ="./redirect.htm?id=adminlogin"; }
			else if(data.status == 'S'){
				window.location.href ="./redirect.htm?id=studentlogin"; }
			else if(data.status == 'F'){
				window.location.href ="./redirect.htm?id=stafflogin"; }
			else if(data.status == '1'){
				alert('Your request not yet approve by Admin,Please contact Admin!!!!');
				$('#unamein').val("");
				 $('#pswin').val("");
			} else {
				alert(' Invalid Username and Password, Please try again!!!!');
				 $('#unamein').val("");
				 $('#pswin').val("");
			}
		},
		failure : function() {
			alert("Failed!");
		}
	});
	
}


</script>
</head>
<body>
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<img src="./../images/esaip1.png" height="70" width="100" />

			</div>
			<div class="navbar-header"
				style="padding-left: 10px; padding-top: -10px">
				<h1
					style="font-family: Broadway; color: #9400D3; text-align: center; padding-top: 15px">
					<b>ESAIP</b></h1>
				</h6 > Graduate School of Engineering</h6>


			</div>

			<ul class="nav navbar-nav" style="float: right">

				<li style="padding-top: 15px"><button
						onclick="document.getElementById('id02').style.display='block'"
						style="width: 100px; height: 45px; background-color: white; color: black; font-size: 15px; padding-top: 10px">
						<strong>Sign In</strong>
					</button></li>
				<li style="padding-top: 15px"><button
						onclick="document.getElementById('id01').style.display='block';GetDropDownData();"
						style="width: 100px; height: 45px; background-color: white; color: black; font-size: 15px; padding-top: 10px">
						<strong>Sign Up</strong>
					</button></li>
			</ul>
		</div>
	</nav>
	<div style="margin-top: -20px">
		<img height="500px" width="100%" src="./../images/banner.jpg" />
	</div>
	<h3
		style="font-family: Comic Sans MS; color: black; text-align: center; padding-top: 15px">
		<b><u>About Us</u></b>
	</h3>
	<p
		style="font-style: Monospace; font-size: 20px; color: black; text-align: justify; text-indent: 50px; padding: 50px">Studying in France gives you the opportunity to explore a unique art of living, food & wine, fashion. Angers is in the heart of the Loire Valley, 1h30 from Paris and 1h from international Airport (Nantes). 

18th largest French student city with 270 000 inhabitants, this is a university town : 33 000 students, more than 4 000 foreigners (Medical School, many university campuses, 6 Graduate Schools of Engineering and Management "Grandes Écoles"). .</p>



	</div>
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>


				<div class="container">

					<h1>
						<u>SIGN</u> <u>UP</u>
					</h1>

					<label><b>Name</b></label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="text" placeholder="Enter Name" name="name" id="name"
						required><br> <label><b>Identity No</b></label>
					&nbsp;&nbsp;<input type="text" placeholder="Enter id no" name="id"
						id="id" required><br> <label><b>Username</b></label>
					&nbsp;&nbsp;&nbsp;<input type="text" placeholder="Enter User Name"
						name="uname" id="uname" required><br> <label><b>Password</b></label>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"
						placeholder="Enter Password" name="psw" id="psw" required><br>
						
						<label><b>Gender</b></label> &nbsp;&nbsp;&nbsp;&nbsp;<select
						name="genderType" id="genderType"
						style="width: 8%;padding: 7px 10px;margin: 8px 18px;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;">
						<option value="M">Male</option>
						<option value="F">Female</option>
						</select><br>
					
						<label><b>Address</b></label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
						placeholder="Address" name="addr" id="addr" required><br>
						<label><b>Contact</b></label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
						placeholder="Contact" name="cont" id="cont" required><br>
						

					<label><b>Register For :-</b></label> &nbsp;&nbsp;&nbsp;&nbsp;<select
						name="utype" id="utype"
						style="width: 30%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;"
						onchange="displaygraduate();">
						<option value="F">Faculty</option>
						<option value="S">Student</option>
					</select><br> <br>

					<div name="graduate" id="graduate" style="display: none">
						<label><b>Register For :</b></label><br> <input type="radio"
							name="reg" value="1" id="reg"> <b>Graduate</b>
						&nbsp;&nbsp; <input type="radio" name="reg" value="2" id="reg"><b>Under
							Graduate</b><br>
					</div>
					
					<label><b>Registration Year :-</b></label> &nbsp;&nbsp;&nbsp;&nbsp;<select
						name="registerYear" id="registerYear"
						style="width: 30%; padding: 12px 20px; margin: 8px 9px; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;">
					</select><br> <br>
					
					<label><b>Security Question1 :</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<select
						name="secQuestion1" id="secQuestion1"
						style="width: 30%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;"
						onchange="displaygraduate();">
						<option value="None">--Please Select--</option>
						<option value="Which place you where born?">Which place you where born?</option>
						<option value="What is your favorite movie?">What is your favorite movie?</option>
						<option value="Who is your best friend">Who is your best friend</option>
						<option value="Who is your favorite actor?">Who is your favorite actor?</option>
						<option value="What is your first pet name?">What is your first pet name?</option>
					</select><br>
					
					<label style="margin: 14px 83px;"><b>Answer</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" style="width: 54%;padding: 9px 0px;margin: 14px -82px;" name="answer1" id="answer1" required><br>

					<label><b>Security Question2 :</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<select
						name="secQuestion2" id="secQuestion2"
						style="width: 30%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;"
						onchange="displaygraduate();">
						<option value="None">--Please Select--</option>
						<option value="Which place you where born?">Which place you where born?</option>
						<option value="What is your favorite movie?">What is your favorite movie?</option>
						<option value="Who is your best friend">Who is your best friend</option>
						<option value="Who is your favorite actor?">Who is your favorite actor?</option>
						<option value="What is your first pet name?">What is your first pet name?</option>
					</select><br>
					
					<label style="margin: 14px 83px;"><b>Answer</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" style="width: 54%;padding: 9px 0px;margin: 14px -82px;" name="answer1" id="answer2" required><br>

					<label><b>Security Question3 :</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<select
						name="secQuestion3" id="secQuestion3"
						style="width: 30%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;"
						onchange="displaygraduate();">
						<option value="None">--Please Select--</option>
						<option value="Which place you where born?">Which place you where born?</option>
						<option value="What is your favorite movie?">What is your favorite movie?</option>
						<option value="Who is your best friend">Who is your best friend</option>
						<option value="Who is your favorite actor?">Who is your favorite actor?</option>
						<option value="What is your first pet name?">What is your first pet name?</option>
					</select><br>
					
					<label style="margin: 14px 83px;"><b>Answer</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" style="width: 54%;padding: 9px 0px;margin: 14px -82px;" name="answer1" id="answer3" required><br>
					
					
					 <label><b>Department</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;<select name="dept" id="dept" required><option
							value="0">Select Department</option>

					</select><br></label><!-- <label><b>Semester</b></label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
						name="sem" id="sem" required><option value="0">Select
							Semester</option>
						<option value="1">Spring</option>
						<option value="2">Fall</option>
						<option value="3">Summer</option>

					</select> -->
					<br> <span style="padding-left: 100px;"><button
							type="submit" style="width: 100px; height: 40px"
							class="cancelbtn1" onclick="saveData()">Sign up</button></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
						style="padding-button: 10px;"><button
							onclick="document.getElementById('id01').style.display='none'"
							class="cancelbtn" style="width: 100px; height: 40px;">Cancel</button>
					</span>

				</div>


			</div>
		</div>
	</div>
	<div id="id02" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>


				<div class="container">

					<h1 align="left">
						<u>SIGN</u> <u>IN</u>
					</h1>


					<label><b>Username</b></label> <input type="text"
						placeholder="Enter User Name" name="unamein" id="unamein" required><br>

					<label><b>Password</b></label> &nbsp;<input type="password"
						placeholder="Enter Password" name="pswin" id="pswin" required><br>

					<span style="padding-left: 100px;"><button type="submit"
							style="width: 100px; height: 45px" class="cancelbtn1"
							onclick="signIn()">Sign In</button></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<button
						onclick="document.getElementById('id02').style.display='none'"
						class="cancelbtn" style="width: 100px; height: 45px">Cancel</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button
						class="forgotbtn" id="forgotbtn" style="width: 142px;height: 44px;">Forgot Password</button>	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				</div>

			</div>
		</div>
	</div>
		<div id="id03" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span onclick="document.getElementById('id03').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<div class="container">
					<h2 align="left" style="color: #D361BD;">
						<u>Security</u> <u>Questions</u>
					</h2>
					<label><b>Security Question1 :</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<label id="label1"></label> &nbsp;&nbsp;&nbsp;&nbsp;<br>
					
					<label style="margin: 14px 83px;"><b>Answer</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" style="width: 54%;padding: 9px 0px;margin: 14px -82px;" name="forGotquestion1" id="forGotquestion1" required><br>
					
					<label><b>Security Question2 :</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<label id="label2"></label> &nbsp;&nbsp;&nbsp;&nbsp;<br>
					
					<label style="margin: 14px 83px;"><b>Answer</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" style="width: 54%;padding: 9px 0px;margin: 14px -82px;" name="forGotquestion2" id="forGotquestion2" required><br>
				
					<label><b>Security Question3 :</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<label id="label3"></label> &nbsp;&nbsp;&nbsp;&nbsp;<br>
					
					<label style="margin: 14px 83px;"><b>Answer</b></label> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" style="width: 54%;padding: 9px 0px;margin: 14px -82px;" name="forGotquestion3" id="forGotquestion3" required><br>
					
					<span style="padding-left: 100px;"><button type="submit" id="questionSub"
							style="width: 100px; height: 45px" class="cancelbtn1">Submit</button></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>
	
	
	<div id="id04" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span onclick="id04Click()"
					class="w3-button w3-display-topright">&times;</span>
				<div class="container">
					<h2 align="left" style="color: #D361BD;">
						<u>Reset</u> <u>Password</u>
					</h2>
						<label><b>Password</b></label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"
						placeholder="Enter Password" name="newPswd1" id="newPswd1" required><br>
						
							<label><b>Retype Password</b></label> &nbsp;<input type="password"
						placeholder="Enter Password" name="newPswd2" id="newPswd2" required><br>
					
					<span style="padding-left: 100px;"><button type="submit"
							style="width: 100px; height: 45px" class="cancelbtn1" id="resubmitPswd">Submit</button></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>
	<footer style="margin-top: -20px; background-color: black">
		<p style="text-align: center; height: 20px; color: white">All
			rights @ESAIP</p>
	</footer>
</body>
</html>
