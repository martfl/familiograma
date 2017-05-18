<?php 
	function connectDB() {
		$link = new mysqli("localhost", "admin", "admin", "socialis");
		if(mysqli_connect_errno())
			echo "Failed to connect to MySQL: " . mysqli_connect_error();
		mysqli_query($link, "SET NAMES 'utf8'");
		return $link;
	}
?>