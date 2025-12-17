<?php

include "../../connect.php";
 
$password = sha1($_POST['password']);


$email = filterRequest("email"); 

getData("delivery" , "delivery_email = ? AND  delivery_password = ?" , array($email , $password)) ; 
//getData("users" , "users_email = ? AND  users_password = ?" , array($email , $password)) ; 


//getData("users" , "users_email = ? AND  users_password = ? AND users_approve = 1 " , array($email , $password)) ; 
