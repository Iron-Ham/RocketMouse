import Create;

private var ageGridInt : int = 0;
private var ageStrings : String[] = ["Under 13", "13-17", "18-24", "25-35", "36-45", "46-59", "60+"];

function OnGUI(){
	addLabel("What is your age?", pos(0)); 
	ageGridInt = addRadio(ageGridInt, ageStrings, 2, 4, pos(1));
	
	if (GUI.Button(Rect(Create.buttonLeft, pos(3), Create.buttonWidth, Create.fieldHeight), "Next")){
		PlayerPrefs.SetString("age", ageStrings[ageGridInt]);
		Application.LoadLevel("FormQ2");
	}
}