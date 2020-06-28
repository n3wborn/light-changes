<?php require_once "dbconnect.php" ?>
<?php require_once "header.php" ?>

	<main id="main-container" class="container fcol">
		<div id="form-container">
		<h2>Add panel</h2>
		<p>Fill this form to submit new values</p>
			<form action="" method="post" class="fcol">
				<label for="date">Date</label>
				<input type="date" name="date" class="form-input" required>

        <label for="position">Location</label>
				<select id="position" class="form-input" name="position" required>
        	<option value="" selected>Choose Location</option>
					<option value="gauche">left</option>
					<option value="droite">right</option>
					<option value="fond">back</option>
				</select>
				<label for="etage">Floor</label>
				<select id="etage" class="form-input" name="etage" required>
					<option value="0" selected>0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>
				<label for="puissance">Power</label>
				<select id="puissance" class="form-input" name="puissance" required>
					<option value="15" selected>15W</option>
					<option value="20">20W</option>
					<option value="25">25W</option>
				</select>
				<label for="marque">Brand</label>
				<select id="marque" class="form-input" name="marque" required>
					<option value="Philips" selected>Philips</option>
					<option value="Sylvania">Sylvania</option>
					<option value="Osram">Osram</option>
					<option value="GE-Lighting">GE-Lighting</option>
				</select>

		</form>
	</div>