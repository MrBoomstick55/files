<?php

$db = new Mysqli;

$db->connect('localhost', 'root', '', 'finalproject');

if(!$db){
	echo "DB Connection Failed";
}


?>