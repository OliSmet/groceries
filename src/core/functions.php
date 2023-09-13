<?php 
function getDatas($servername, $username, $password, $dbname){
    $conn = new mysqli($servername, $username, $password, $dbname);
    $conn->set_charset("utf8mb4");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 
   
    // GET INGREDIENTS    
    $queryIngredients = "SELECT * FROM ingredients";
    $resultIngredients = $conn->query($queryIngredients);
    global $ingredientssArray;
    $ingredientssArray = array();
    
    if ($resultIngredients->num_rows > 0) {
        while ($row = $resultIngredients->fetch_assoc()) {
            $ingredientssArray[] = $row;
        }
    }

   
    // GET SHELVES
    $queryShelves = "SELECT * FROM shelves";
    $resultShelves = $conn->query($queryShelves);
    global $shelvesArray;
    $shelvesArray = array();
    global $filledShelvesArray;
    $filledShelvesArray = array();
    
    if ($resultShelves->num_rows > 0) {
        while ($row = $resultShelves->fetch_assoc()) {
            $shelvesArray[] = $row;
            $rowId = $row['id'];
            $matchingShelf = null;
            foreach ($ingredientssArray as $ingredient) {
                if ($ingredient['shelf_id'] === $rowId) {
                    $matchingShelf = $ingredient;
                    break;
                }
            }
            if ($matchingShelf !== null) {
                $filledShelvesArray[] = $row;
            }
        }
    }
    // GET MESURES
    $queryMesures = "SELECT * FROM mesures_type";
    $resultMesures = $conn->query($queryMesures);
    global $mesuresArray;
    $mesuresArray = array();
    
    if ($resultMesures->num_rows > 0) {
        while ($row = $resultMesures->fetch_assoc()) {
            $mesuresArray[] = $row;
        }
    }

    $conn -> close();
}
?>