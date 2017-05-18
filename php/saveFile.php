<?php
	include "db.php";
	$link = connectDB();
    $json = $_POST["json"];
	$id = $_POST["id"];
	$comment = $_POST["comment"];
    $my_file = "json/paciente".$id.".json";
	if (!$handle = fopen("../".$my_file, 'w')) {
         echo "Cannot open file ($my_file)";
         exit;
    }

    if (fwrite($handle, $json) === FALSE) {
        echo "Cannot write to file ($my_file)";
        exit;
    }

    fclose($handle);
	$query = "UPDATE FAMILIOGRAMA SET `json` = '{$my_file}', `comment` = '{$comment}'  WHERE `familiograma`.`id` = {$id}";
	$show = mysqli_query($link, $query) or die ("Error");
?>
