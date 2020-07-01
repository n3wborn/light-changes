<?php require_once "header.php"; ?>
<?php require_once "dbconnect.php"; ?>
<?php session_start(); ?>

<main id="main-container" class="fcol">

<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
  </div>

</div>

	<table class="table table-primary">
		<thead>
			<tr>
				<th>ID</th>
				<th>Last Change</th>
				<th>Floor</th>
				<th>Location</th>
				<th>Power</th>
				<th>Brand</th>
				<th><button type="submit" class="btn btn-primary" id="add-btn"><a href="add.php" class="btn-link">Add</a></button></th>
				<th></th>
			</tr>
		</thead>

		<tbody>

<?php

$sql = 'SELECT ID, last_change, floor, location, light_power, light_brand FROM appartments ORDER BY last_change ASC';
//prepare request
$req = $pdo->prepare($sql);

//execute
$req->execute();

//fetch results
$results = $req->fetchAll(PDO::FETCH_ASSOC);

//Change date format
$intlDateFormater = new IntlDateFormatter('fr_FR', IntlDateFormatter::SHORT, IntlDateFormatter::NONE);

//loop over results
if (count($results) !== 0) {
	foreach($results as $row){
		echo '<tr>';
		echo '<td>' .$row['ID']. '</td>';
		echo '<td>' .$intlDateFormater->format(strtotime($row['last_change'])). '</td>';
		echo '<td>' .$row['floor']. '</td>';
		echo '<td>' .$row['location']. '</td>';
		echo '<td>' .$row['light_power']. '</td>';
		echo '<td>' .$row['light_brand']. '</td>';
		echo '<td><a href="edit.php?id=' .$row['ID']. '"><span class="fa fa-edit fa-lg"></span></a></td>';
		echo '<td><a class="dellinks" href="delete.php?id=' .$row['ID']. '"><span class="fa fa-trash fa-lg"></span></a></td>';
		echo '</tr>';
	}
} else {
	echo 'No result';
}
?>

				</tbody>
			</table>

		</main>
		<script src="scripts.js"></script>
	</body>
</html>