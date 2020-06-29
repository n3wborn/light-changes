<?php require_once "dbconnect.php" ?>
<?php require_once "header.php" ?>

<?php

/*

name="date" -> appartments.last_change
name="floor" -> 	appartments.floor
name="puissance"	-> light_power
name="marque"  -> light_brand

*/

$date = '';
$location = '';
$floor = '';
$power = '';
$brand = '';

//print_r($_POST);
foreach ($_POST as $key => $value) {
	var_dump($value);
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
			<input type="date" name="date" class="form-input" required>

			<label for="location">Location</label>
			<select id="location" class="form-input" name="location" required>
				<option value="" selected>Choose Location</option>
				<option value="gauche">left</option>
				<option value="droite">right</option>
				<option value="fond">back</option>
			</select>

			<label for="floor">Floor</label>
			<input type="text" name="floor" class="form-input" required>

			<label for="power">Power</label>
			<input type="text" name="power" class="form-input" required>

			<label for="brand">Brand</label>
			<input type="text" name="brand" class="form-input" required>

			<div class="container submit-container">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
<!-- Page Structure -->
