<?php
$link = mysqli_connect("localhost","root","","amss");
if(mysqli_connect_errno())
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
$id = $_POST["id"];
$query = "SELECT * FROM paciente WHERE id = ".$id;
$show = mysqli_query($link, $query) or die ("Error");
$row = mysqli_fetch_array($show);

$array = array('n'=>$row['nombre']." ".$row['apellido'], 's'=>$row['sexo'], 'e'=>$row['edad']);
echo json_encode($array);
?>