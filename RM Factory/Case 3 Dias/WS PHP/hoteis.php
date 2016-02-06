<?php 
    require_once('config.php');
		
	$user = $_GET['user'];
	
	echo json_encode(getHotelByUser($user)); 
	
	function getHotelByUser($userid) {
	  global $_SG;
	  
	  $sql = "SELECT h.id, h.nome, h.ultimaatualizacao 
    		    FROM user_hotel uh, hotel h  
			   where h.id = uh.hotelid  
			     and uh.userid = $userid";

	  $result = mysql_query($sql);
	  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
         $hotels[] = array('id' => $row[id],'nome' => $row[nome],'atualizacao' => $row[ultimaatualizacao]);
      }
	  
      mysql_free_result($result);
	  
	  return $hotels;
	}


?>