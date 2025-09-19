<?php
    
    $conn = mysqli_connect ("localhost", "root", "", "socias_set_f");

if ($conn){
    die("Failed!");
}

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM employees WHERE email = '$email' AND password = '$password'";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result)>0){
    echo ("SUCCESS!");
    exit();
}else{
    echo ("LOG IN FAILED!");
}
mysqli_close($conn);

?>