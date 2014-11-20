<?php
include('.conf.php');

$function = $_GET["do"];

if($function == "getuser") {
  getUser();
} else {
  $json = $_POST["json"];
  echo "Data dump: ";
  var_dump($json);
  $data = json_decode($json, true);
  if($function == "times") storeTimes($data);
  elseif($function == "survey") storeSurvey($data);
}

function getUser() {
  $user_agent = $_SERVER['HTTP_USER_AGENT'];
  $short_ua = substr($user_agent, 0, 200);
  $sql = 'SELECT UUID()';
  $result = mysql_query($sql);
  $row = mysql_fetch_row($result);
  $uuid = $row[0];
  $sql = "INSERT INTO user (uuid, user_agent) VALUES ('$uuid', '$short_ua')";
  $result = mysql_query($sql) or die('Could not enter data: ' . mysql_error());
  
  echo $uuid;
}

function storeTimes($data) {
 $uuid = $data['uuid'];
 $sql = "SELECT * FROM user WHERE uuid='$uuid'";
 $result = mysql_query($sql);
 $row = mysql_fetch_row($result);
 if(!$row) {
   echo "Error unknown uuid: " . $uuid;
   return;
 }
 
 $timelist = $data['times'];
 foreach($timelist as $value) {
   $sql = "INSERT INTO reaction_time (uuid, time) VALUES ('$uuid', '$value')";
   $result = mysql_query($sql) or die('Could not enter data: ' . mysql_error());
 }
 echo 'Success';
}

function storeSurvey($data) {
  $uuid = $data['uuid'];
  $sql = "SELECT * FROM user WHERE uuid='$uuid'";
  $result = mysql_query($sql);
  $row = mysql_fetch_row($result);
  if(!$row) {
   echo "Error unknown uuid";
   return;
  }
  $sql = "SELECT * FROM survey WHERE uuid='$uuid'";
  $result = mysql_query($sql);
  $row = mysql_fetch_row($result);
  if($row) {
   echo "Error survey already submitted for uuid";
   return;
  }
  $diag = $data['is_diagnosed'];
  $medi = $data['is_medicated'];
  $gender = $data['gender'];
  $age = $data['age'];
  
  $sql = "INSERT INTO survey (uuid, is_diagnosed, is_medicated, gender, age) VALUES ('$uuid', '$diag', '$medi', '$gender', '$age')";
  $result = mysql_query($sql) or die('Could not enter data: ' . mysql_error());
  
  echo 'Success';
}
?>
