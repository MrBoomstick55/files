<?php 

include 'db.php';

if(isset($_POST['send'])){
	
	$category = $_POST['category'];
	$name = $_POST['event'];
	$date = $_POST['date'];
	$time = $_POST['time'];
	
	$sql = "insert into events (category, name, date, time) values ('$category','$name', '$date', '$time')";
	
	$val = $db->query($sql);
	
	if($val){
		// The header will take you anywhere
	header('location: index.php');
	}
}





 ?>