<?php
	include "db.php";
	$link = connectDB("socialis.cpivj72xcp0f.us-west-2.rds.amazonaws.com", "root", "developer", "Socialis-dev");
	$id = $_POST["id"];
	$query = "SELECT json, comment FROM FAMILIOGRAMA WHERE id = ".$id;
	$show = mysqli_query($link, $query) or die ("Error");
	$row = mysqli_fetch_array($show);
	$array = array('json'=>$row['json'], 'comment'=>$row['comment']);
	echo json_encode($array);
?>
