<?php

$notAuth = "" ; 

include "connect.php" ; 
$topic = "users";
$title = "Breaking News!";
$message = "A major event just happened. Rammmmmmmmmmadan";
$imageUrl = "https://example.com/image.jpg";

$response = sendNotificationTopic($title, $message,$topic, "" , "","");

print_r($response);
 
//sendGCM_New("hi"  , "How Are You" , "users43" , "" , "") ; 
//sendNotificationTopic("hi"  , "How Are You" , "users43" , "" , "") ;

echo "\n\n---------------------------- Send ----------------------------\n\n"  ;

?>