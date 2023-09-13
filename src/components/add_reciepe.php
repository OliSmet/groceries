
<div class="form_container">
    <h2>Ajouter une recette</h2>
    <form id="add_ingredient_form">
        <div class="input_container">
            <h3>Nom:</h3>
            <input type="text" id="recipe_name_input" name="recipe_name">
        </div>
        <div class="input_container">
            <h3>Ingrédient: </h3>
            <div class="accordeon">
                <?php foreach ($filledShelvesArray as $shelf) { ?>
                       <div class="accorderon_el">
                            <h4><?= $shelf["name"] ?></h4>
                            <div class="ingredient_list">
                                <?php foreach ($ingredientssArray as $ingredient) {
                                    if($ingredient["shelf_id"] === $shelf["id"]) { ?>
                                        <div class="ingredient_row">
                                            <input type="checkbox" id="checkbox_ingredient_<?= $ingredient["id"] ?>" class="checkbox_ingredient" name="ingredient_selection" value="<?= $ingredient["id"] ?>">
                                            <label for="checkbox_ingredient_<?= $ingredient["id"] ?>" class="ingredient_name"><?= $ingredient["name"] ?></label>
                                            <div id="ingredient_mesure_<?= $ingredient["id"] ?>" class="ingredient_mesure">
                                                <?php foreach ($mesuresArray as $mesure) { 
                                                    if($mesure["id"] === $ingredient["mesure_id"]) { ?>
                                                        <input id="ingredient_mesure_input_<?= $ingredient["id"] ?>" name="ingredient_mesure" type="number">
                                                        <label class="mesure"><?= $mesure["label"] ?></div>
                                                    <?php }
                                                } ?>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                       </div>
                <?php } ?>
            </div>
        </div>
        <button class="cta submit" onclick="submitRecipe()">valider</button>
    </form>
</div>
