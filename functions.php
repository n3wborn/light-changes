<?php

function dbconnect() {
	$host = "837194dfd971";
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
		return $pdo;
	} catch (\Throwable $th) {
		throw $th;
	}
}


// set_string($arg)
// return true if arg is a not empty string
function set_string($arg) {
	if (!empty($arg) && is_string($arg)) {
		return true;
	} else {
		return false;
	}
}

// set_intstring($arg)
// return true if arg is set and is a numeric string
function set_intstring($arg) {
	if (!empty($arg) && is_numeric($arg)) {
		return true;
	} else {
		return false;
	}
}

// set_isint($arg)
// return true only if $arg is set, and an int
function set_isint($arg) {
	if (isset($arg) && is_int($arg)) {
		return true;
	} else {
		return false;
	}
}

//return true if $date is a valid date
function validateDate($date, $format = 'Y-m-d')
{
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) === $date;
}

// set_date($arg)
// return true if arg is a valid date format (ex: 2020-06-30)
function set_date($arg) {
	if (!empty($arg) && validateDate($arg)) {
		return true;
	} else {
		return false;
	}
}