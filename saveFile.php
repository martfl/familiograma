<?php
	$link = mysqli_connect("localhost","root","","amss");
	if(mysqli_connect_errno())
    	echo "Failed to connect to MySQL: " . mysqli_connect_error();
    $json = $_POST["json"];
	$id = $_POST["id"];
    $my_file = "json/paciente".$id.".json";
    $handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file);
    fwrite($handle, $json);
    fclose($handle);
	$query = "UPDATE `familiograma` SET `json` = '{$my_file}' WHERE `familiograma`.`id` = {$id}";
	$show = mysqli_query($link, $query) or die ("Error");
?>
