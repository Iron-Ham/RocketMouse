import Create;

private var adhdGridInt: int = 0;
private var adhdStrings: String[] = ["Yes", "No"];

function OnGUI(){
	addLabel("Have you been diagnosed with ADHD?", pos(0)); 
	adhdGridInt = addRadio(adhdGridInt, adhdStrings, 1, 2, pos(1));
	
	if (GUI.Button(Rect(Create.buttonLeft, pos(3), Create.buttonWidth, Create.fieldHeight), "Next")){
		PlayerPrefs.SetString("is_diagnosed", adhdStrings[adhdGridInt]);
		Application.LoadLevel("FormQ4");
	}
}