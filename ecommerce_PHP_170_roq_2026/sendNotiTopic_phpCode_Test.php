<?php

// function sendGCM_Old($title, $message, $topic, $pageid, $pagename){}
function sendNotificationTopic($topic, $title, $message, $imageUrl = null)
//function sendNotificationTopic($title, $message,$topic, $pageid, $pagename,$imageUrl = null)
{
    $pathToJson = __DIR__ . '/json/filejson.json';

if (!file_exists($pathToJson)) {
    die("Error: Firebase JSON key file not found at: $pathToJson");
}

$serviceAccount = json_decode(file_get_contents($pathToJson), true);
if (!$serviceAccount) {
    die("Error: JSON file is corrupted.");
}

echo "Firebase JSON file loaded successfully.\n";
echo "Client Email: " . $serviceAccount['client_email'] . "\n";

$jwtToken = generateJWT($serviceAccount);
echo "Generated JWT Token: $jwtToken\n";

$accessToken = getAccessToken($jwtToken);
echo "Generated OAuth2 access token: $accessToken\n";


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
    $url = 'https://fcm.googleapis.com/v1/projects/roqsalfirebase2025/messages:send';

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

    // Handle response
    if ($httpCode == 200) {
        return json_decode($response, true);
    } else {
        return "Error: HTTP Code $httpCode - Response: $response";
    }
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


$topic = "Roq";
$title = "Breaking News!";
$message = "A major event just happened. Rammmmmmmmmmadan";
$imageUrl = "https://example.com/image.jpg";

$response = sendNotificationTopic($topic, $title, $message, $imageUrl);
print_r($response);

?>
