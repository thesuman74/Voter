<?php
include("dbconnection.php");
$con = dbconnection();

$query = "SELECT * FROM `voters_table` ORDER BY votes DESC";
$exe = mysqli_query($con, $query); // Use mysqli_query to execute the query

$arr = [];

while ($row = mysqli_fetch_array($exe)) { // Loop through the result set
    $arr[] = $row;
}

print(json_encode($arr));
