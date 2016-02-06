<?php 
    require_once('config.php');
		
	$hotel   = $_GET['hotelid'];
	$data    = $_GET['data'];
	$getdays = $_GET['getdays'];
	
	
	if (isset($_GET['getdays'])){
	  echo json_encode(getReservas($hotel));  
	}else{
	  echo json_encode(getReservaByData($hotel, $data));  
	}
	
	
	function getReservas($hotelid) {
	  global $_SG;
	  
	  $sql = "select distinct date_format(data, '%d/%m/%Y') reserva from hotel_reserva where hotelid = $hotelid order by data";
	  
	  $result = mysql_query($sql);
	  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
         $reserva[] = array(htmlentities('Data') => htmlentities($row[reserva]));
      }
	  
      mysql_free_result($result);
	  
	  return $reserva;
	}
	
	function getReservaByData($hotelid, $data) {
	  global $_SG;
	  
	  $sql = "SELECT data, descricao, quantidade FROM hotel_reserva h where hotelid = $hotelid and data = '$data'";
	  
	  $result = mysql_query($sql);
	  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
         $reserva[] = array(htmlentities($row[descricao]) => htmlentities($row[quantidade]));
      }
	  
      mysql_free_result($result);
	  
	  return $reserva;
	}

?>