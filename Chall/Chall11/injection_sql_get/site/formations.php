<!DOCTYPE html>

<html>

<head>

    <title>
    	IPI formation
    </title>

    <meta charset="UTF-8">


</head>
<body>

<h1>Formations ipi</h1>

<table><th>
	<td><a href="index.php">Accueil</a></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td><a href="presentation.php">Présentation ipi</a></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td><a href="formations.php">Rechercher une formation</a></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td><a href="contact.php">Contact</a></td>
</th></table>
<br />
<form action='formations.php' method='GET'>
Rechercher une formation de niveau : 
<select name="search">
  <option value="BAC+0">BAC</option>
  <option value="BAC+2">BAC+2</option>
  <option value="BAC+3">BAC+3</option>
  <option value="BAC+5">BAC+5</option>
</select>
<input type="submit" value="Search">
</form>
<br /><br />
<?php
// Afficher les messages d'erreurs
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

	if(isset($_GET['search'])){
		
		// Attendre 0 à 2 secondes	
		$sleep_num = rand(0,827903)%3;
		sleep($sleep_num);

		// Renvoyer erreur 404 si user agent contient sqlmap
		$user_agent = $_SERVER['HTTP_USER_AGENT'];
		if(strpos($user_agent, 'sqlmap') !== false){
			sleep(5);
			http_response_code(404);
			die();
		}

		// Connection base de donnée
		$connected = mysqli_connect('localhost','ipi_user','pTYx-2GZiMjgwZj@wMTAy_zYwMGJb','ipiget');
		if (!$connected) {
    			die("Connection failed: " . mysqli_connect_error());
		}
		
		// Requête sql
		$str_get = $_GET['search'] ;
		$result = mysqli_query($connected,"SELECT titre, url FROM formations WHERE niveau = '".$str_get."' LIMIT 2 ;");

		// Affichage des résultats
		if(mysqli_num_rows($result) > 0){
			while($row = mysqli_fetch_assoc($result)){
				echo '<div><table style="border: 1px solid red;"><th><br/>';
				echo '<td><strong>'.$row['titre'].'</strong></td>';
				echo '<td><a href="'.$row['url'].'">Lien de la formation</a></td>';
				echo '</th></table></div>' ;
			}
		}
		// Fermeture de la connexion sql
		mysqli_close($connected);
	}

?>
</body>
</html>
