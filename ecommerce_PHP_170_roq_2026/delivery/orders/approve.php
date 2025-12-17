<?php

include "../../connect.php";

$orderid = filterRequest("ordersid");

$userid = filterRequest("usersid");

$deliveryid = filterRequest("deliveryid");

$data = array(
    "orders_status" => 3 , 
    "orders_delivery" => $deliveryid 
);

updateData("orders", $data, "orders_id = $orderid AND orders_status = 2");

// sendGCM("success" , "The Order Has been Approved" , "users$userid" , "none" , "refreshorderpending"); 

insertNotify("success", "Your order is on the way", $userid, "users$userid", "none",  "refreshorderpending");


//sendGCM_New("warning" , "The Order Has been Approved by delivery" , "services" , "none" , "none"); 

$response = sendNotificationTopic("warning", "The Order Has been Approved by delivery","services", "none" , "none",imageUrl: "");
//sendGCM_New("warning" , "The Order Has been Approved by delivery  " . $deliveryid , "delivery" , "none" , "none"); 
$response2 = sendNotificationTopic("warning", "The Order Has been Approved by delivery  " . $deliveryid,"delivery", "none" , "none","");
