<?php
include("dbconnection.php");
$con = dbconnection();


if (isset($_POST["passedValue"])) {
    $PollValue = $_POST["passedValue"];
} else {
    echo json_encode(["success" => "false", "message" => "PollValue is not  provided"]);
    return;
}


$query = "SELECT `id`, `uname`, `uemail`, `upassword`, `poll_name`, `image_path` 
FROM `user_table` 
WHERE poll_name = '$PollValue'";

$exe = mysqli_query($con, $query); // Use mysqli_query to execute the query

$arr = [];

while ($row = mysqli_fetch_array($exe)) { // Loop through the result set
    $arr[] = $row;
}

print(json_encode($arr));
