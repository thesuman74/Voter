<?php
include("dbconnection.php");
$con = dbconnection();

if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else {
    echo json_encode(["success" => "false", "message" => "Name not provided"]);
    return;
}

// Define the SQL query for the upsert operation
$query = "INSERT INTO voters_table (candidate_name, votes)
          VALUES ('$name', 1)
          ON DUPLICATE KEY UPDATE votes = votes + 1";

$exe = mysqli_query($con, $query);

$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}

print(json_encode($arr));
