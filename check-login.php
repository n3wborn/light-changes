<?php require_once "header.php"; ?>
<?php require_once "functions.php"; ?>

<?php

//let's speak with database
$pdo = dbconnect();

//if datas are submitted
if(count($_POST) > 0) {
	//we take user inputs
	$user = htmlentities($_POST['user']);
	$password = htmlentities($_POST['password']);

	//feed my request
	$sql = 'SELECT users.passwd FROM users WHERE users.login = :user';
	//prepare my request
	$req = $pdo->prepare($sql);
	//and bind parameters so we take care of sqli's
	$req->bindParam(':user', $user, PDO::PARAM_STR);
	// exec !
	$req->execute();

	//fetch results
	$hash = $req -> fetch();

	//goodboy badboy challenge
	if (!check_pwd($password, $hash["passwd"])) {
		//if badboy
		echo "GET OUT !";
	} else {
		echo "MOT DE PASSE OK";
		//keep tracking with $_SESSION
		//header('Location: index.php');
	}
}

// If already connected
//redirect to index.php

?>


<!-- Page Structure -->

	<main id="main-container" class="fcol">

		<div id="login-container">
			<h2>Login Panel</h2>
			<p>Please login</p>

			<!-- login form -->
			<form action="" method="post" class="fcol">

				<label for="user">Login : </label>
				<input type="user" name="user" class="form-input" value="" required>

				<label for="password">Password : </label>
				<input type="password" name="password" class="form-input" value="" required>

				<div class="container submit-container">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>

			</form>

		</div>
	</main>
	<script src="scripts.js"></script>
</body>
</html>
<!-- Page Structure -->