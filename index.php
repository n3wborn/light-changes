<?php require_once "header.php"; ?>
<?php require_once "dbconnect.php"; ?>

	<main id="main-container" class="fcol">


		<table class="table table-primary">
			<thead>
        <tr>
	        <th>ID</th>
	        <th>Last Change</th>
	        <th>Floor</th>
	        <th>Location</th>
	        <th>Power</th>
					<th>Brand</th>
					<th><button class="btn btn-primary" id="add-btn"><a href="add.php" id="add-link">Add</a></button></th>
					<th></th>
				</tr>
			</thead>

			<tbody>


<?php

//sql request
$sql = 	'SELECT appartments.ID AS "id",
 appartments.changement AS "Date",
 appartments.etage AS "Floor",
 appartments.position AS "Location",
 ampoules.puissance AS "Power",
 ampoules.marque AS "Brand"
 FROM ampoules
 INNER JOIN appartments
 ORDER BY `Date` ASC';

//prepare request
$req = $pdo->prepare($sql);

//execute
$req->execute();

//fetch results
$results = $req->fetchAll(PDO::FETCH_ASSOC);

//Change date format
$intlDateFormater = new IntlDateFormatter('fr_FR', IntlDateFormatter::SHORT, IntlDateFormatter::NONE);

//loop over results
foreach($results as $row){
	echo '<tr>';
	echo '<td>' .$row['id']. '</td>';
	echo '<td>' .$intlDateFormater->format(strtotime($row['Date'])). '</td>';
	echo '<td>' .$row['Floor']. '</td>';
	echo '<td>' .$row['Location']. '</td>';
	echo '<td>' .$row['Power']. '</td>';
	echo '<td>' .$row['Brand']. '</td>';
	echo '<td><a href="edit.php?id=' .$row['id']. '"><span class="fa fa-edit fa-lg"></span></a></td>';
	echo '<td><a href="delete.php?id=' .$row['id']. '"><span class="fa fa-trash fa-lg"></span></a></td>';
	echo '</tr>';
}

?>

			</tbody>
		</table>


	</main>
</body>
</html>