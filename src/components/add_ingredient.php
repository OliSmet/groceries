
<div class="form_container">
    <h2>Ajouter un ingrédient</h2>
    <form id="add_ingredient_form">
        <div class="input_container">
            <label id="ingredient_name_label" for="ingredient_name_input">
                Nom&nbsp;:
            </label>
            <input id="ingredient_name_input" type="text">
        </div>
        <div class="input_container">
            <label id="mesure_type_label" for="mesure_type_input">
                Mesure&nbsp;:
            </label>
            <select id="mesure_type_input" name="mesure" class="dropDown" autocomplete="new-password">
                <option value="" disabled selected hidden>
                    Sélectionner un type de mesure
                </option>
                <?php foreach ($mesuresArray as $mesure) { ?>
                    <option value="<?= $mesure["id"] ?>">
                        <?= $mesure["name"] ?> (<?= $mesure["label"] ?>)
                    </option>
                <?php } ?>
            </select>
        </div>
        <div class="input_container">
            <label id="shelf_label" for="shelf_input">
                Rayon&nbsp;:
            </label>
            <select id="shelf_input" name="shelf" class="dropDown" autocomplete="new-password">
                <option value="" disabled selected hidden>
                    Sélectionner un rayon
                </option>
                <?php foreach ($shelvesArray as $shelf) { ?>
                    <option value="<?= $shelf["id"] ?>">
                        <?= $shelf["name"] ?>
                    </option>
                <?php } ?>
            </select>
        </div>
        <button class="cta submit" onclick="submitIngredient()">Ajouter</button>
    </form>
</div>
