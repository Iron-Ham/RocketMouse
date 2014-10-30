import System;

private static var buttonWidth: int = Screen.width - 16;
private static var middle: float = Screen.width / 2;
private static var buttonLeft: float = middle - buttonWidth/2;
private static var fieldHeight: int = 60;
private static var fieldPadding: int  = 8;
private static var fieldPosition: int = 1;

static function pos(name: int){
	return fieldPosition + ((fieldHeight + fieldPadding) * name);
}

static function addField(lbl, text, y){
	return GUI.TextField(Rect(buttonLeft, y, buttonWidth, fieldHeight), text, 40);
}

static function addLabel(lbl: String, y: int){
	GUI.Label(Rect(buttonLeft, y, buttonWidth, fieldHeight), lbl);
}

static function addRadio(grid: int, selStrings: String[], row: int, col: int, y: int){
	return GUI.SelectionGrid (Rect(buttonLeft, y, buttonWidth, fieldHeight*row), grid, selStrings, col);
}

static function addButton(lbl: String, scene: String, y: int){
	if (GUI.Button(Rect(buttonLeft, y, buttonWidth, fieldHeight), lbl)){
		Application.LoadLevel(scene);
	}
}

static function addQuit(lbl: String, y: int){
	if (GUI.Button(Rect(buttonLeft, y, buttonWidth, fieldHeight), lbl)) {
        Application.Quit();
    }
}