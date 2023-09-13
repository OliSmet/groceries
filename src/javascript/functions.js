
function submitIngredient() {
    event.preventDefault();
    var ingredientName = document.getElementById("ingredient_name_input").value;
    var shelfId = document.getElementById("shelf_input").value;
    var mesureID = document.getElementById("mesure_type_input").value;
    $.ajax({
        type: "POST",
        url: "src/core/post_ingredients.php",
        data: {
            ingredientName: ingredientName,
            shelfId: shelfId,
            mesureID: mesureID
        },
        success: function (response) {
            console.log(response);
        },
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

function submitRecipe() {
    event.preventDefault();
    var recipeName = document.getElementById("recipe_name_input").value;
    var checkboxes = document.querySelectorAll('input[name="ingredient_selection"]:checked');
    var selectedIngredients = [];
    var ingredientQuantity = [];
    for (var i = 0; i < checkboxes.length; i++) {
        var ingredientID = checkboxes[i].value;
        var quantity = document.getElementById("ingredient_mesure_input_" + ingredientID).value;
        selectedIngredients[i] = ingredientID;
        ingredientQuantity[i] = quantity;
    }
    console.log(JSON.stringify(ingredientQuantity));
    $.ajax({
        type: "POST",
        url: "src/core/post_recipe.php",
        data: { 
            recipeName: recipeName,
            selectedIngredients: JSON.stringify(selectedIngredients), 
            ingredientQuantity: JSON.stringify(ingredientQuantity), 
        }, 
        success: function () {
            console.log("success");
        },
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}