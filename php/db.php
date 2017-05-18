<?php 
	function connectDB($host, $user, $pass, $db) {
		$link = new mysqli($host, $user, $pass, $db);
		if(mysqli_connect_errno())
			echo "Failed to connect to MySQL: " . mysqli_connect_error();
		mysqli_query($link, "SET NAMES 'utf8'");
		return $link;
	}
?>