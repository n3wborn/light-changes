<?php
$host = "fd9c3c72d354";
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

//On se connecte à la BDD
try {
    $pdo = new PDO($dsn, $user, $password, $options);
} catch (\Throwable $th) {
    throw $th;
}
?>