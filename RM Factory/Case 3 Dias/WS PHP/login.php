<?php 
	require_once('config.php');
		
	$user = $_GET['user'];
	$password = $_GET['password'];
	  	  

	$object = new stdclass();
	$object->result = validaUsuario($user,$password);
	echo json_encode($object); 
?>


