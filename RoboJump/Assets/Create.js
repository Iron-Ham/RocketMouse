private static var buttonWidth = Screen.width - 16;
private static var middle = Screen.width / 2;
private static var buttonLeft = middle - buttonWidth/2;
private static var fieldHeight = 30;
private static var fieldPadding = 8;
private static var fieldPosition = 1;

static function pos(name){
	return fieldPosition + ((fieldHeight + fieldPadding) * name);
}

static function addField(lbl, text, y){
	return GUI.TextField(Rect(buttonLeft, y, buttonWidth, fieldHeight), text, 40);
}

static function addLabel(lbl, y){
	GUI.Label(Rect(buttonLeft, y, buttonWidth, fieldHeight), lbl);
}

static function addRadio(grid, selStrings, row, col, y){
	return GUI.SelectionGrid (Rect(buttonLeft, y, buttonWidth, fieldHeight*row), grid, selStrings, col);
}

static function addButton(lbl, scene, y){
	if (GUI.Button(Rect(buttonLeft, y, buttonWidth, fieldHeight), lbl)){
		Application.LoadLevel(scene);
	}
}