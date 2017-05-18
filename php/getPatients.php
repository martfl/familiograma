<?php
	include "db.php";
	
	$link = connectDB();
	$query = "SELECT id, nombre FROM PACIENTE";
	$show = mysqli_query($link, $query) or die ("Error");
	while ($row = mysqli_fetch_array($show)) {
			echo '<option value="'.$row['id'].'">'.$row['nombre'].'</option>';	
	   	}
	
?>