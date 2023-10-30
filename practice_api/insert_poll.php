<?php

include("dbconnection.php");
$con = dbconnection();

if (isset($_POST["poll_name"])) {
    $poll_name = $_POST["poll_name"];
} else {
    echo json_encode(["success" => "false", "message" => "poll_name not provided"]);
    return;
}

// Create a prepared statement
$query = "INSERT INTO `poll_name`(`poll_name`) VALUES (?)";
$stmt = mysqli_prepare($con, $query);

if ($stmt) {
    // Bind the parameter
    mysqli_stmt_bind_param($stmt, "s", $poll_name);

    // Execute the statement
    $exe = mysqli_stmt_execute($stmt);

    $arr = [];
    if ($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
        $arr["message"] = mysqli_error($con); // Include error message for debugging
    }

    echo json_encode($arr);

    // Close the statement
    mysqli_stmt_close($stmt);
} else {
    echo json_encode(["success" => "false", "message" => "Failed to prepare statement"]);
}
