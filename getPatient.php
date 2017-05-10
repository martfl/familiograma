<?php
	include "db.php";
	
	$link = connectDB("socialis.cpivj72xcp0f.us-west-2.rds.amazonaws.com", "root", "developer", "Socialis-dev");
	$id = $_POST["id"];
	$query = "SELECT nombre FROM PACIENTE WHERE id = {$id}";
	$show = mysqli_query($link, $query) or die ("Error");
	$row = mysqli_fetch_array($show);
	
	$nombre = $row["nombre"];
	$link2 = connectDB("localhost", "root", "", "amss");
	$patient = mysqli_query($link2, "SELECT * FROM familiograma WHERE id= {$id}");

	if(mysqli_num_rows($patient) == 0){
		echo $nombre;	
	}
?>