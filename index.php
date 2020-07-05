<?php require_once "header.php"; ?>
<?php require_once "functions.php"; ?>

<?php

//check if admin
//redirect if true
if (connected()) {
	header('Location: dashboard.php');
}

//let's speak with database
$pdo = dbconnect();

//if datas are submitted
if(count($_POST) > 0) {
	//we take user inputs
	$user = htmlentities($_POST['user']);
	$password = htmlentities($_POST['password']);

	//feed my request
	$sql = 'SELECT * FROM users WHERE users.login = :user';
	//prepare my request
	$req = $pdo->prepare($sql);
	//and bind parameters so we take care of sqli's
	$req->bindParam(':user', $user, PDO::PARAM_STR);
	// exec !
	$req->execute();
	//fetch results
	$res = $req -> fetch();

	// user & password ok ?
	if ($user === $res["login"]) {
		if (check_pwd($password, $res["passwd"])) {
			// if ok -> start/resume session
			if (!connected()) {
				$_SESSION["admin"] = 1;
				//redirect
				header('Location: dashboard.php');
			}
		} else {
			//if bad passwd
			echo "Bad login or password";
		}
	} else {
		echo "Bad login or password";
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
				<input type="text" name="user" class="form-input" value="" required>

				<label for="password">Password : </label>
				<input type="password" name="password" class="form-input" value="" required>

				<div class="container submit-container">
					<button id="login-btn" type="submit" class="btn btn-primary">Login</button>
				</div>

			</form>

		</div>
	</main>

</body>
</html>
<!-- Page Structure -->