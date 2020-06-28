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


function populate() {
	$pdo = dbconnect();
	$sql = 	'SELECT appartments.ID AS id, appartments.changement AS "Date",	appartments.etage AS "Floor",	appartments.position AS "Location",	ampoules.puissance AS "Power", ampoules.marque AS "Brand"	FROM ampoules	INNER JOIN appartments ;';

	$req = $pdo->prepare($sql);
	$req->execute();
	$results = $req->fetchAll();
	//Déclaration ou gestion des formats des dates en français
	$intlDateFormater = new IntlDateFormatter('fr_FR', IntlDateFormatter::SHORT, IntlDateFormatter::NONE);
	//boucle sur le resultat
	$population = foreach($result as $row){
		echo '<tr>';
		echo '<td>' .$row['id']. '</td>';
		echo '<td>' .$intlDateFormater->format(strtotime($row['Date'])). '</td>';
		echo '<td>' .$row['Floor']. '</td>';
		echo '<td>' .$row['Location']. '</td>';
		echo '<td>' .$row['Power']. '</td>';
		echo '<td>' .$row['Brand']. '</td>';
		echo '<td><a href="edit.php?id=' .$row['id']. '><span class="fa fa-edit fa-lg"></span></a></td>';
		echo '<td><a href="delete.php?id=' .$row['id']. '><span class="fa fa-trash fa-lg"></span></a></td>';
		echo '</tr>';
	}
	return $population;
}


