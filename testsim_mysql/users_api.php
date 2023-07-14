<?php
require 'connect.php';


$sql = "SELECT * FROM users";
$hasil = $conn->query($sql);
 
 
if(mysqli_num_rows($hasil) > 0 ){
  $response = array();
  $response["data"] = array();
  while($x = mysqli_fetch_array($hasil)){
    $h['id'] = $x["id"];
    $h['nama'] = $x["nama"];
    $h['email'] = $x["email"];
    $h['password'] = $x["password"];
    array_push($response["data"], $h);
  }
  echo json_encode($response);
}else {
  $response["message"]="tidak ada data";
  echo json_encode($response);
}
?>