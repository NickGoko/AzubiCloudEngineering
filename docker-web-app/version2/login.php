<!-- version2/login.php -->
<?php
$correct_username = "Beanstalk";
$correct_password = "@dewrongs1d3";

$entered_username = $_POST["username"];
$entered_password = $_POST["password"];

if ($entered_username == $correct_username && $entered_password == $correct_password) {
    echo "Welcome! This is an admin";
} else {
    echo "Invalid username or password";
}
?>