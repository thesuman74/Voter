<?php

include("dbconnection.php");
$con = dbconnection();

// Form data
if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else {
    echo json_encode(["success" => "false", "message" => "Name not provided"]);
    return;
}

if (isset($_POST["email"])) {
    $email = $_POST["email"];
} else {
    echo json_encode(["success" => "false", "message" => "Email not provided"]);
    return;
}

if (isset($_POST["password"])) {
    $password = $_POST["password"];
} else {
    echo json_encode(["success" => "false", "message" => "Password not provided"]);
    return;
}

if (isset($_POST["PollValue"])) {
    $PollValue = $_POST["PollValue"];
} else {
    echo json_encode(["success" => "false", "message" => "Poll name not provided"]);
    return;
}

// Image data
if (isset($_POST["data"])) {
    $data = $_POST["data"];
} else {
    echo json_encode(["success" => "false", "message" => "Image data not provided"]);
    return;
}

if (isset($_POST["image_name"])) {
    $image_name = $_POST["image_name"];
} else {
    echo json_encode(["success" => "false", "message" => "Image name not provided"]);
    return;
}

$path = "upload/$image_name";

$query = "INSERT INTO `user_table`(`uname`, `uemail`, `upassword`, `poll_name`, `image_path`)
 VALUES ('$name', '$email' ,'$password','$PollValue', '$path')";
file_put_contents($path, base64_decode($data));

$exe = mysqli_query($con, $query);

$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}

echo json_encode($arr);
