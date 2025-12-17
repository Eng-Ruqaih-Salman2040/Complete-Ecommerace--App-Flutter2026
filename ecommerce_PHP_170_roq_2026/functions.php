<?php

// ==========================================================
//  Copyright Reserved Wael Wael Abo Hamza (Course Ecommerce)
// ==========================================================
// date_default_timezone_set("Asia/Damascus");
define("MB", 1048576);

function filterRequest($requestname)
{
    return  htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getAllData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    if ($where == null) {
        $stmt = $con->prepare("SELECT  * FROM $table   ");
    } else {
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
        return $count;
    } else {
        if ($count > 0) {
            return  array("status" => "success", "data" => $data);
        } else {
            return  array("status" => "failure");
        }
    }
}

function getData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    } else {
        return $count;
    }
}




function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}




function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

//---------------------------- ImageUpload  Video 187 ----------------------------------------------

//---------------------------------- Old ImageUpload ----------------------------------------------
function imageUpload_Old( $dir,$imageRequest)
{
    global $msgError;
    if(isset($_FILES[$imageRequest])) //&& $_FILES[$imageRequest]['error'] == 0)
    {
       
    $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
    $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
    $imagesize  = $_FILES[$imageRequest]['size'];
    $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
    $strToArray = explode(".", $imagename);
    $ext        = end($strToArray);
    $ext        = strtolower($ext);

    if (!empty($imagename) && !in_array($ext, $allowExt)) {
        $msgError = "EXT";
    }
    if ($imagesize > 2 * MB) {
        $msgError = "size";
    }
    if (empty($msgError)) {
        move_uploaded_file($imagetmp,  $dir."/" . $imagename);
        return $imagename;
    } else {
        return "fail";
    }
}
    else{
        return "empty";
    }
}

//-----------------------------  New Last imageUpload
function imageUpload($dir, $imageRequest)
{
    global $msgError;
    if (isset($_FILES[$imageRequest])) {
        $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
        $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
        $imagesize  = $_FILES[$imageRequest]['size'];
        $allowExt   = array("jpg", "png", "gif", "mp3", "pdf" , "svg","jpeg");
        $strToArray = explode(".", $imagename);
        $ext        = end($strToArray);
        $ext        = strtolower($ext);

        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError = "EXT";
        }
        if ($imagesize > 2 * MB) {
            $msgError = "size";
        }
        if (empty($msgError)) {
            move_uploaded_file($imagetmp,  $dir . "/" . $imagename);
            return $imagename;
        } else {
            return "fail";
        }
    }else {
        return 'empty' ; 
    }
}


function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

    // End 
}


function   printFailure($message = "none")
{
    echo     json_encode(array("status" => "failure", "message" => $message));
}
function   printSuccess($message = "none")
{
    echo     json_encode(array("status" => "success", "message" => $message));
}

function result($count)
{
    if ($count > 0) {
        printSuccess();
    } else {
        printFailure();
    }
}

// function sendEmail($to, $title, $body)
// {
//     $header = "From: support@waelabohamza.com " . "\n" . "CC: waeleagle1243@gmail.com";
//     mail($to, $title, $body, $header);
// }
// function sendEmail($to,$title,$body)
// {
//     $header="From: ruqaih3.salman3@gmail.com"."\n"."CC:ruqsal3.flutter3@gmail.com";
//     mail($to,$title,$body,$header);
//     echo("Sucess to Send ");

// }



//--------------------------------------Old Methode ---------------------------------------

// function sendGCM_Old($title, $message, $topic, $pageid, $pagename)
// {


//     $url = 'https://fcm.googleapis.com/fcm/send';

//     $fields = array(
//         "to" => '/topics/' . $topic,
//         'priority' => 'high',
//         'content_available' => true,

//         'notification' => array(
//             "body" =>  $message,
//             "title" =>  $title,
//             "click_action" => "FLUTTER_NOTIFICATION_CLICK",
//             "sound" => "default"

//         ),
//         'data' => array(
//             "pageid" => $pageid,
//             "pagename" => $pagename
//         )

//     );


//     $fields = json_encode($fields);
//     $headers = array(
//         'Authorization: key=' . "",
//         'Content-Type: application/json'
//     );

//     $ch = curl_init();
//     curl_setopt($ch, CURLOPT_URL, $url);
//     curl_setopt($ch, CURLOPT_POST, true);
//     curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
//     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//     curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

//     $result = curl_exec($ch);
//     return $result;
//     curl_close($ch);
// }

//------------------------------------ New Methode  but error in it --------------------------------------
// function sendGCM_New($title, $message, $topic, $pageid, $pagename)
// {
//     $url = 'https://fcm.googleapis.com/v1/projects/ecommerceroqsal2026/messages:send';
//    // $token='cY_Aio4qSMuZpKF_QXccxs:APA91bFREvmbsLbITxqo1dhMQWUo4lSwxO5LllqZYbG99MwdsOT-UTVZK0ICydcq_mcVOryj7OQDdAL90T2J7c8M0sDDA__WM1vpxNa4cfjq75nYw3vfKjk4IaF-0xxDXfFg0fZnTr5W';

//     $fields = array(
//         "message" => array(
//             "topic" => $topic,
//             "notification" => array(
//                 "title" => $title,
//                 "body" => $message,
//                 "click_action" => "FLUTTER_NOTIFICATION_CLICK",
//                 "sound" => "default"
//             ),
//             "data" => array(
//                 "pageid" => $pageid,
//                 "pagename" => $pagename
//             ),
//             "android" => array(
//                 "priority" => "HIGH"
//             ),
//             "webpush" => array(
//                 "headers" => array(
//                     "Urgency" => "high"
//                 )
//             )
//         )
//     );

//     $fields = json_encode($fields);
//     $headers = array(
//         'Authorization: Bearer ' . "ya29.c.c0ASRK0GZJsyoFEL-THQ2uJSe2cg0XJIiEk2N14104uXSf_7Lzfu-93FTLmOefZ95nzNz3VU-OqftvDT6pPs1W4hUiADaYzif2UmbM6MV0RlbSXVjg513zbZZb2RRrJjTpDVZTobLI4HXdSREw41a1meQk5IYat3qg4Iucz9ezwzjmTlHZGy-mhqm2DGNg4uRoQhslRqcVdHPvEJ9P0PIf31iWaRBgVC5OXjcLFY_WTKJ5kfjZOoRjmyW6HgxtJ0NQ4YP7LyzDhOc1aHaeZlUi9iDm-bbOS3d37wiUqJE1Zs--3IqwfhPrkuqVtroXyxUcNcP5C3LozrIjr4aXR2n8uIn5IJSFXLMRc_mvxQPomkUjGDP0E6qz4_u_BCEE388D6XRrtVicyi0k7wRjw1iZkWv99abzI6Orss-WXBY8RyBZ-OQ4WctvdjUrFeBoufYrzVUsXUj6BXb0haS0uBJjJxfs8w2khBkJ8xkt64U2yznv5QgyOWx6pJUpIcUhmuSema-2UazntFnb8bhMcXqd47g_SJhXoRg68c3clbdbhx2zso1tYcUvbz2IfVuzgynMeVoX7-Iyej6ko31c-uoZVqFz_3kRz8sov2qQrJSngtxX-3gyw9U9i4qm4m1j6YBuFF_sluU2zjXdm8cVbanniZe1pvZ8nXWz2kOk9XltY5sJ5weXWXbir2d2fZfuO1ciya5f3tB3Vt4FXke0R4tYIF5fF8zwqa6phh1IkxzsYr06JJBZua0XnpkUZfupMSXXzjXei3SMhbFaIJgarbaZJjRjmvrthU64Iqfdxm_bvyz3evkitxf5rx2IBnXgnfvR5MzrO85i-pufWBZ7_MRegFlkze80aZX_Znber7g5zguizb0S9-3wcufln0W4-SJvcRIzoJ1cSug-1Bxck0Wg867UwcIcollSiFtJqb8c1e32s-heBXrzmW-5FQsqjgyvas0bWYtljSYZF11jrg5S9bQB7FOkhgm_FJa5yBZ3", // Use OAuth 2.0 token instead of API key
//         'Content-Type: application/json'
//     );

//     $ch = curl_init();
//     curl_setopt($ch, CURLOPT_URL, $url);
//     curl_setopt($ch, CURLOPT_POST, true);
//     curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
//     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//     curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

//     $result = curl_exec($ch);
//     return $result;
//     curl_close($ch);
// }

//------------------------------------ New Methode  but Correct in it Ramdan--------------------------------------

//function sendNotificationTopic($topic, $title, $message, $imageUrl = null)
function sendNotificationTopic($title, $message,$topic, $pageid, $pagename,$imageUrl = null)
{
    $pathToJson = __DIR__ . '/json/roqsalecommerce2026.json';

if (!file_exists($pathToJson)) {
    die("Error: Firebase JSON key file not found at: $pathToJson");
}

$serviceAccount = json_decode(file_get_contents($pathToJson), true);
if (!$serviceAccount) {
    die("Error: JSON file is corrupted.");
}

//echo "Firebase JSON file loaded successfully.\n";
//echo "Client Email: " . $serviceAccount['client_email'] . "\n";

$jwtToken = generateJWT($serviceAccount);
//echo "Generated JWT Token: $jwtToken\n";

$accessToken = getAccessToken($jwtToken);
//echo "Generated OAuth2 access token: $accessToken\n";


    $notification = [
        'message' => [
            'topic' => $topic,
            'notification' => [
                'title' => $title,
                'body' => $message,
            ],
        ],
    ];

    if (!empty($imageUrl)) {
        $notification['message']['notification']['image'] = $imageUrl;
    }

    // Set the request headers
    $headers = [
        'Authorization: Bearer ' . $accessToken,
        'Content-Type: application/json',
    ];

    // Firebase Cloud Messaging (FCM) API URL
    $url = 'https://fcm.googleapis.com/v1/projects/roqsalecommerce2026-6ce2c/messages:send';

    // Initialize cURL
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($notification));

    // Execute request and get response
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    //Orginal  Handle response
    if ($httpCode == 200) {
        return json_decode($response, true);
    } else {
        return "Error: HTTP Code $httpCode - Response: $response";
    }

    //New Handle response
    // if ($httpCode == 200) {
    //     echo json_encode(array("status" => "success"));
    // } else {
    //     echo json_encode(array("status" => "failure"));
    // }
}

/**
 * Function to generate JWT (JSON Web Token) for Firebase authentication
 */

 function generateJWT($serviceAccount)
{
    $header = [
        'alg' => 'RS256',
        'typ' => 'JWT',
    ];

    $issuedAt = time();
    $expiresAt = $issuedAt + 3600; // Token valid for 1 hour

    $payload = [
        'iss' => $serviceAccount['client_email'],
        'scope' => 'https://www.googleapis.com/auth/firebase.messaging',
        'aud' => $serviceAccount['token_uri'],
        'exp' => $expiresAt,
        'iat' => $issuedAt,
    ];

    // Encode JWT
    $base64UrlHeader = base64UrlEncode(json_encode($header));
    $base64UrlPayload = base64UrlEncode(json_encode($payload));

    $signatureInput = $base64UrlHeader . "." . $base64UrlPayload;
    
    //openssl_sign($signatureInput, $signature, file_get_contents($serviceAccount['private_key']), OPENSSL_ALGO_SHA256);
    // $privateKey = $serviceAccount['private_key'];
    // $privateKey = str_replace(["\n", "\r"], '', $privateKey); // Remove unwanted characters
    // $privateKey = "-----BEGIN PRIVATE KEY-----\n" . chunk_split($privateKey, 64, "\n") . "-----END PRIVATE KEY-----\n";
    
    $privateKey = $serviceAccount['private_key'];

// Ensure private key is properly formatted
$privateKey = str_replace("\\n", "\n", $privateKey);

$keyResource = openssl_pkey_get_private($privateKey);
if (!$keyResource) {
    die("Error: Invalid private key. Ensure the private key in the JSON file is correctly formatted.");
}

    $keyResource = openssl_pkey_get_private($privateKey);
    if (!$keyResource) {
        die("Error: Invalid private key. Please check your Firebase JSON file.");
    }
    
    // Sign the JWT
    openssl_sign($signatureInput, $signature, $keyResource, OPENSSL_ALGO_SHA256);
    openssl_free_key($keyResource);
    
    
    
    $base64UrlSignature = base64UrlEncode($signature);
    return $signatureInput . "." . $base64UrlSignature;
}


function getAccessToken($jwt)
{
    $url = "https://oauth2.googleapis.com/token";
    
    $postData = [
        'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        'assertion'  => $jwt
    ];

    $headers = [
        'Content-Type: application/x-www-form-urlencoded'
    ];

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postData));

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode == 200) {
        $jsonResponse = json_decode($response, true);
        return $jsonResponse['access_token'];  // Return valid access token
    } else {
        die("Error: Failed to get OAuth2 access token. Response: $response");
    }
}

/**
 * Base64 URL Encoding (without padding)
 */
function base64UrlEncode($data)
{
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

//-------------------------------- Test ----------------------------------------------
// $topic = "Roq";
// $title = "Breaking News!";
// $message = "A major event just happened. Rammmmmmmmmmadan";
// $imageUrl = "https://example.com/image.jpg";

// $response = sendNotificationTopic($topic, $title, $message, $imageUrl);
// print_r($response);

//----------------------------- End Test ----------------------------------------------
function insertNotify($title, $body, $userid, $topic, $pageid, $pagename)
{
    global $con;
    $stmt  = $con->prepare("INSERT INTO `notification`(  `notification_title`, `notification_body`, `notification_userid`) VALUES (? , ? , ?)");
    $stmt->execute(array($title, $body, $userid));
    //sendGCM_New($title,  $body, $topic, $pageid, $pagename);
    $response =sendNotificationTopic($title, $body, $topic, $pageid, $pagename);
    $count = $stmt->rowCount();
    return $count;
}
