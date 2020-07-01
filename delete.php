<?php require_once "header.php" ?>
<?php require_once "functions.php" ?>

<?php

$pdo = dbconnect();

//if "seems to be an int"
if (set_intstring($id)){
	//prepare to delete
	$sql = 'DELETE FROM appartments WHERE ID = :id';
	$req = $pdo->prepare($sql);
	//specify an int to avoi script k1ddi3s
	$req->bindParam(':id',  $id, PDO::PARAM_INT);
	//exec and go back to index
	$req->execute();
	header('Location: index.php');
}

?>