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
$id = htmlentities($_GET['id']);
$ID = intval($id);

//init POST vars
$date = '';
$location = '';
$floor = '';
$power = '';
$brand = '';

//if submissions
if( count($_POST) > 0) {
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
				<button id="edit-btn" type="submit" class="btn btn-primary">Edit</button>
			</div>
		</form>
	</div>

<!-- Page Structure -->