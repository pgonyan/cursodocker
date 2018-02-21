<?php
$mysqli = new mysqli("localhost", "testuser", "pr4eba","testdb");

if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";



$mysqli = new mysqli("127.0.0.1", "testuser", "pr4eba","testdb");
if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

echo $mysqli->host_info . "\n";

phpinfo();

?>
