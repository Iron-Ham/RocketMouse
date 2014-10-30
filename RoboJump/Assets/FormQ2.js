import Create;

private var genderGridInt: int = 0;
private var genderStrings: String[] = ["Male", "Female"];

function OnGUI(){
	addLabel("What is your gender?", pos(0)); 
	genderGridInt = addRadio(genderGridInt, genderStrings, 1, 2, pos(1));
	
	addButton("Next", "FormQ3", pos(3));
}