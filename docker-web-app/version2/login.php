<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from the form
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Perform validation or processing here (e.g., check credentials against a database)
    // For demonstration purposes, we'll simply print the received data
    echo "Received username: " . $username . "<br>";
    echo "Received password: " . $password . "<br>";
}
?>

