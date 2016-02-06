<?php 
    require_once('config.php');
		
	$hotel = $_GET['hotelid'];
	
	//if (!needAuth()) { 
	//  UnAuthAcess();
	//}else {
	  echo json_encode(getStatusByHotel($hotel));   
	//}
	
	function getStatusByHotel($hotelid) {
	  global $_SG;
	  
	  $sql = "SELECT hotelid, descricao, valor
     	        FROM hotel_status 
			   where hotelid = $hotelid";

	  $result = mysql_query($sql);
	  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
         $status[] = array(htmlentities($row[descricao]) => htmlentities($row[valor]));
      }
	  
      mysql_free_result($result);
	  
	  return $status;
	}
?>