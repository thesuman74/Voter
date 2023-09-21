<?php
include("dbconnection.php");
$con = dbconnection();

$query = "SELECT `id`, `uname`, `uemail`, `upassword` FROM `user_table` ";
$exe = mysqli_query($con, $query); // Use mysqli_query to execute the query

$arr = [];

while ($row = mysqli_fetch_array($exe)) { // Loop through the result set
    $arr[] = $row;
}

print(json_encode($arr));
