<?php
	include "db.php";
	
	$link = connectDB("socialis.cpivj72xcp0f.us-west-2.rds.amazonaws.com", "root", "developer", "Socialis-dev");
	$id = $_POST["id"];
	$query = "SELECT nombre, apellido_materno, apellido_paterno, fecha_nacimiento, genero FROM PACIENTE WHERE id = {$id}";
	$show = mysqli_query($link, $query) or die ("Error");
	$row = mysqli_fetch_array($show);
	$nombre = $row["nombre"];
	$apellido_materno = $row["apellido_materno"];
	$apellido_paterno = $row["apellido_paterno"];
	$fecha_nacimiento = $row["fecha_nacimiento"];
	$edad = floor((time() - strtotime($fecha_nacimiento)) / 31556926);
	$genero = $row["genero"];
	if($genero == "Mujer")
		$sexo = "F";
	else
		$sexo = "M";
	$patient = mysqli_query($link, "SELECT * FROM FAMILIOGRAMA WHERE id= {$id}");
	if(mysqli_num_rows($patient) == 0) {
		echo json_encode(array('nombre'=>$nombre." ".$apellido_paterno." ".$apellido_materno, 'edad'=>$edad, 'sexo'=>$sexo));	
	} else {
		echo json_encode(array());
	}
	
?>