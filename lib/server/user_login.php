<?php
include('connection.php');
$msg = '';
$arra = [];
$response = [];

if (isset($_POST["username"]) && isset($_POST["password"])) {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $sql = "SELECT * FROM user WHERE username='$username' AND password='$password'";
    $res = mysqli_query($con, $sql);
    $count = mysqli_num_rows($res);

    if ($count > 0) {
        $row = mysqli_fetch_assoc($res);
        $response['message'] = "Login successful";
        $response['user'] = $row;
    } else {
        $response['message'] = "Invalid username and password";
    }
} else {
    $response['message'] = "Invalid request parameters";
}

echo json_encode($response);
?>