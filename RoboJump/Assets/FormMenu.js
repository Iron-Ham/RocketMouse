import Create;

private var ageGridInt : int = 0;
private var ageStrings : String[] = ["Under 13", "13-17", "18-24", "25-35", "36-45", "46-59", "60+"];
private var genderGridInt: int = 0;
private var genderStrings: String[] = ["Male", "Female"];
private var adhdGridInt: int = 0;
private var adhdStrings: String[] = ["Yes", "No"];
private var isMedGridInt: int = 0;
private var medGridInt: int = 0;
private var medStrings: String[] = ["Ritalin", "Adderall or Adderall XR", "Dexedrine or Dextrostat", "Vyvanse", "Ritalin", "Concerta", "Other"];

function OnGUI(){;
	addLabel("What is your age?", pos(0)); 
	ageGridInt = addRadio(ageGridInt, ageStrings, 2, 4, pos(1));
	
	addLabel("What is your gender?", pos(3)); 
	genderGridInt = addRadio(genderGridInt, genderStrings, 1, 2, pos(4));
	
	addLabel("Have you been diagnosed with ADHD?", pos(5)); 
	adhdGridInt = addRadio(adhdGridInt, adhdStrings, 1, 2, pos(6));
	
	addLabel("If you answered yes to question 3, are you on medication?", pos(7)); 
	isMedGridInt = addRadio(isMedGridInt, adhdStrings, 1, 2, pos(8));
	
	addLabel("If you answered yes to question 4, which medication are you on?", pos(9));
	medGridInt = addRadio(medGridInt, medStrings, 2, 4, pos(10));
	
	addButton("Submit", "StartMenu", pos(12));
}