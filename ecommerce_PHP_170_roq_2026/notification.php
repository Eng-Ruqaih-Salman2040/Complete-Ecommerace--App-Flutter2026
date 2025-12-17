<?php 

include "./connect.php"  ;

$userid = filterRequest("id") ; 
//$userid = 44;

getAllData("notification"  , "notification_userid = $userid") ; 


?>