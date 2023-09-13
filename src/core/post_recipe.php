<?php
include("../../config.php");

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La connexion à la base de données a échoué : " . $conn->connect_error);
}

$recipeName = $_POST['recipeName'];

$sql = "INSERT INTO recipe (name) VALUES ('$recipeName')";

if ($conn->query($sql) === TRUE) {
        $lastInsertedId = $conn->insert_id;
        $ingredients = json_decode($_POST['selectedIngredients']);
        $quantity = json_decode($_POST['ingredientQuantity']);
        $i = 0;
        foreach ($ingredients as $ingredient) {
            $ingredients_id = $ingredient;
            $quantity = $quantity[$i];
            $sql = "INSERT INTO `ingredients_relations` (`ingredients_id`, `recipe_id`, `quantity`) VALUES ('$ingredients_id', '$lastInsertedId', '$quantity')";
            $conn->query($sql);
            $i++;
        }

        header('Content-Type: application/json');
        echo json_encode($response);
} else {
    echo "Erreur lors de l'insertion des données : " . $conn->error;
}

$conn->close();
?>
