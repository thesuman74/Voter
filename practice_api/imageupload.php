<?php

include("dbconnection.php");
$con = dbconnection();

// if (isset($_POST["caption"])) {
//     $cap = $_POST["caption"];
// } else return;

//image data 
if (isset($_POST["data"])) {
    $data = $_POST["data"];
} else return;

if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else return;

$path = "upload/$name";


$query = "INSERT INTO `user_table`(`image_path`) 
VALUES ('$path')";
file_put_contents($path, base64_decode($data));

$arr = [];
$exe = mysqli_query($con, $query);

if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}

print(json_encode($arr));
