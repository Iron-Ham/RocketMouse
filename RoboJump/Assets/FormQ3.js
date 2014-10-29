import Create;

private var adhdGridInt: int = 0;
private var adhdStrings: String[] = ["Yes", "No"];

function OnGUI(){;
	addLabel("Have you been diagnosed with ADHD?", pos(0)); 
	adhdGridInt = addRadio(adhdGridInt, adhdStrings, 1, 2, pos(1));
	
	addButton("Next", "FormQ4", pos(3));
}