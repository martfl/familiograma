<?php
	include "db.php";
	$link = connectDB("localhost", "root", "", "amss");
    $json = $_POST["json"];
	$id = $_POST["id"];
	$comment = $_POST["comment"];
    $my_file = "json/paciente".$id.".json";
    $handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file);
    fwrite($handle, $json);
    fclose($handle);
	$query = "INSERT INTO `familiograma` (`id`, `json`, `comment`) VALUES ('{$id}', '{$my_file}', '{$comment}')";
	//print_r($query);
	$show = mysqli_query($link, $query) or die ("Error");
?>
