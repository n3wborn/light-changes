<?php require_once "header.php" ?>
<?php require_once "functions.php" ?>

<?php

//check if admin
//redirect to index.php if not
if (!connected()) {
	header('Location: index.php');
}

// I need to keep these vars
$pdo = dbconnect();

//init POST vars
$date = '';
$location = '';
$floor = '';
$power = '';
$brand = '';


if (!isset($_GET['id'])) {
	$id = '';
} else {
	$id = htmlentities($_GET['id']);
	$ID = intval($id);
}

//if submissions
if (count($_POST) > 0) {
	//and args is ok
	if (
		set_date($_POST['date']) &&
		set_string($_POST['location']) &&
		set_intstring($_POST['floor']) &&
		set_string($_POST['power']) &&
		set_string($_POST['brand']))
		{

		//bind args and values
		$date = $_POST['date'];
		$location = $_POST['location'];
		$floor = $_POST['floor'];
		$power = $_POST['power'];
		$brand = $_POST['brand'];

		//feed my request
		$sql = "UPDATE appartments set last_change = :last_change , location = :location, floor = :floor, light_power = :power, light_brand = :brand WHERE id=:ID";

		//prepare my request
		$req = $pdo->prepare($sql);

		//and bind parameters so we take care of sqli's
		$req->bindValue(':last_change', strftime("%Y-%m-%d" ,strtotime($date)), PDO::PARAM_STR);
		$req->bindParam(':location', $location, PDO::PARAM_STR);
		$req->bindParam(':floor', $floor, PDO::PARAM_STR);
		$req->bindParam(':power', $power, PDO::PARAM_STR);
		$req->bindParam(':brand', $brand, PDO::PARAM_STR);
		$req->bindParam(':ID', $ID, PDO::PARAM_INT);

		// exec !
		$req->execute();
		header('Location: index.php');
	}
}
?>


<!-- Page Structure -->
<main id="main-container" class="container fcol">
	<div id="form-container">
		<h2>Edit panel</h2>
		<p>Fill this form to submit new values</p>

		<form action="" method="post" class="fcol">

			<input type="date" name="date" class="form-input" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} value="<?=$date ;?>" required>

			<select id="location" class="form-input" name="location" value="<?=$location ;?>" required>
				<option value="" selected>Choose Location</option>
				<option value="gauche">left</option>
				<option value="droite">right</option>
				<option value="fond">back</option>
			</select>

			<input type="text" placeholder="Floor" name="floor" class="form-input" value="<?=$floor ;?>" required>
			<input type="text" placeholder="Power" name="power" class="form-input" value="<?=$power ;?>" required>
			<input type="text" placeholder="Brand" name="brand" class="form-input" value="<?=$brand ;?>" required>

			<div class="container submit-container">
				<button id="edit-btn" type="submit" class="btn btn-primary">Edit</button>
			</div>
		</form>
	</div>

<!-- Page Structure -->