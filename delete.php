<?php require_once "header.php" ?>
<?php require_once "functions.php" ?>

<?php

//check if admin
//redirect to index.php if not
if (!connected()) {
	header('Location: index.php');
}

//we keep our pdo object
$pdo = dbconnect();
//and take care of our inputs
$id = htmlentities($_GET['id']);
$id = intval($id);


//Now we start doing the job
try {
	//is $id really an int ?!
	if (set_isint($id)){
		//prepare request
		$sql = 'DELETE FROM appartments WHERE ID = :id';
		$req = $pdo->prepare($sql);
		//avoid script k1ddi3s if possible
		$req->bindParam(':id',  $id, PDO::PARAM_INT);
		//exec and go back to index
		$req->execute();
		header('Location: index.php');
	}
	//else, spit an error
} catch (\Throwable $th) {
		throw $th;
}
