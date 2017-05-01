<?php
    $paciente = $_POST["data"];
    $json = array($paciente);
    $my_file = "json/paciente".$_POST["id"].".json";
    $handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file);
    fwrite($handle, json_encode($json));
    fclose($handle);    
?>