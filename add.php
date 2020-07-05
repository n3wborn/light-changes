<?php require_once "header.php" ?>
<?php require_once "functions.php" ?>

<?php

//check if admin
//redirect to index.php if not
if (!connected()) {
	header('Location: index.php');
}

//receive PDO connection from functions.php
$pdo = dbconnect();

//vars init
$date = '';
$location = '';
$floor = '';
$power = '';
$brand = '';

//if submissions
if( count($_POST) > 0) {
	//if each args is ok
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
		$sql = "INSERT INTO appartments(last_change, location, floor, light_power, light_brand) VALUES(:last_change, :location, :floor, :power, :brand)";

		//prepare my request
		$req = $pdo->prepare($sql);

		//and bind parameters so we take care of sqli's
		$req->bindValue(':last_change', strftime("%Y-%m-%d" ,strtotime($date)), PDO::PARAM_STR);
		$req->bindParam(':location', $location, PDO::PARAM_STR);
		$req->bindParam(':floor', $floor, PDO::PARAM_STR);
		$req->bindParam(':power', $power, PDO::PARAM_STR);
		$req->bindParam(':brand', $brand, PDO::PARAM_STR);

		// exec !
		$req->execute();
		header('Location: index.php');
	}
}
?>

<!-- Page Structure -->
<main id="main-container" class="container fcol">
	<div id="form-container">
		<h2>Add panel</h2>
		<p>Fill this form to submit new values</p>
		<!-- Main form -->
		<form action="" method="post" class="fcol">
			<label for="date">Date</label>
			<input type="date" name="date" class="form-input" value="<?=$date ;?>" required>

			<label for="location">Location</label>
			<select id="location" class="form-input" name="location" value="<?=$location ;?>" required>
				<option value="" selected>Choose Location</option>
				<option value="gauche">left</option>
				<option value="droite">right</option>
				<option value="fond">back</option>
			</select>

			<label for="floor">Floor</label>
			<input type="text" name="floor" class="form-input" value="<?=$floor ;?>" required>

			<label for="power">Power</label>
			<input type="text" name="power" class="form-input" value="<?=$power ;?>" required>

			<label for="brand">Brand</label>
			<input type="text" name="brand" class="form-input" value="<?=$brand ;?>" required>

			<div class="container submit-container">
				<button id="add-submit-btn" type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
	<script src="scripts.js"></script>
<!-- Page Structure -->

