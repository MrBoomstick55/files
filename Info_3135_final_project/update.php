<!DOCTYPE html>

<!-- Included the DB connector -->
<?php include 'db.php'; ?>
<?php

$id = $_GET['id'];
$sql = "select * from events where id='$id'";
$rows = $db->query($sql);
$row = $rows->fetch_assoc();
if(isset($_POST['send'])){
	
	$category = $_POST['category'];
	$name = $_POST['event'];
	$date = $_POST['date'];
	$time = $_POST['time'];
	
	$sql2 = "update events set category= '$category' where id = '$id'";
	$db->query($sql2);
	
	$sql2 = "update events set name= '$name' where id = '$id'";
	$db->query($sql2);
	
	$sql2 = "update events set date= '$date' where id = '$id'";
	$db->query($sql2);
	
	$sql2 = "update events set time= '$time' where id = '$id'";
	$db->query($sql2);

header('location: index.php');
}
?>

<html>
<head>
<!-- This below is the JQuery code that is mandatory -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- This below is the JavaScript code that is mandatory -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- This below is the CSS code that is mandatory -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity+sha384-BVYiiSIFeK1dGmJRAkycuHAHRg320mUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<title>Event Scheduling Calendar</title>
</head>
<body>
<center><h1>Events</h1></center>
<div class="container>
	
	<div class="row style="margin-top: 70px;">
		<div class="col-md-10 col-md-offset-1">			
			<table class="table">
				<hr>

	  <!-- Send the form to add.php -->
        <form method="post">
			<div class="form-group">
				<label>Event Category</label>
				<input type="text" required name="category" value="<?php echo $row['category'];?>" class="form-control">
				<label>Event Name</label>
				<input type="text" required name="event" value="<?php echo $row['name'];?>" class="form-control">
				<label>Event Date</label>
				<input type="date" required name="date" value="<?php echo $row['date'];?>" class="form-control">
				<label>Event Time</label>
				<!-- the name, is passed on submit, to the add.php page-->
				<input type="time" required name="time" value="<?php echo $row['time'];?>" class="form-control">			
			</div>
			<input type="submit" name="send" value="Submit" class="btn btn-success"> &nbsp;
			<a href="index.php" class="btn btn-warning">Back</a>
		</form>


</table>
		</div>
	</div>
</div>		
</body>
</html>