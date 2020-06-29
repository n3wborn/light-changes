<?php
/*
 * Connection serveur
 *$dsn = 'mysql:dbname=stephanep460_;host=localhost';
 *$user = 'stephanep460';
 *$password = 'lWKt+esA1AvVhA==';
 */

$host = "4d4d71817f62";
$db = "datas";
$dsn = "mysql:host=$host;dbname=$db";
$user = 'root';
$password = 'mariadb';
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'",
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_PERSISTENT
];

//throw error if impossible to connect to database
try {
    $pdo = new PDO($dsn, $user, $password, $options);
} catch (\Throwable $th) {
    throw $th;
}
?>