<?php 

include '../../connect.php';

$msgError = array()  ;

$table = "categories";

$name = filterRequest("name");

$namear = filterRequest("namear"); 

$imagename = imageUpload( "../../upload/categories" , "files") ;

$data = array( 
"categories_name" => $name,
"categories_name_ar" => $namear,
 "categories_image" => $imagename,
);

insertData($table , $data);


// if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//     echo "<pre>";
//     print_r($_FILES);
//     echo "</pre>";