<?php
include("../../config.php");

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La connexion à la base de données a échoué : " . $conn->connect_error);
}

$ingredientName = $_POST['ingredientName'];
$shelfId = $_POST['shelfId'];
$mesureID = $_POST['mesureID'];

$sql = "INSERT INTO ingredients (name, shelf_id, mesure_id) VALUES ('$ingredientName', '$shelfId', '$mesureID')";

if ($conn->query($sql) === TRUE) {
        $lastInsertedId = $conn->insert_id;
    
        $response = array('id' => $lastInsertedId);
        
        header('Content-Type: application/json');
        echo json_encode($response);
} else {
    echo "Erreur lors de l'insertion des données : " . $conn->error;
}

$conn->close();
?>
