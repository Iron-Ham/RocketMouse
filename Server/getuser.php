<?php
include('.conf.php');
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$short_ua = substr($user_agent, 0, 200);
$sql = 'SELECT UUID()';
$result = mysql_query($sql);
$row = mysql_fetch_row($result);
$uuid = $row[0];
$sql = "INSERT INTO user (uuid, user_agent) VALUES ('$uuid', '$short_ua')";
$result = mysql_query($sql) or die('Could not enter data: ' . mysql_error());

echo $uuid;
?>
