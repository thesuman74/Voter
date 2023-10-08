<?php
function dbconnection()
{
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "practice";

    // Create a connection
    $con = mysqli_connect($servername, $username, $password, $dbname);

    // Check the connection
    if (!$con) {
        die("Connection failed: " . mysqli_connect_error());
    }
    // echo "connection sucessful";

    return $con;
}
