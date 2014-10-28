<?php
$servername = "localhost";
$username = "REDACTED";
$password = "REDACTED";

$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$user_agent = $_SERVER['HTTP_USER_AGENT'];
$short_ua = substr($user_agent, 0, 200);
$uuid = 'SELECT UUID()'
$sql = 'INSERT INTO user (uuid, user_agent) VALUES ($uuid, $short_ua)

echo $uuid;
?>
