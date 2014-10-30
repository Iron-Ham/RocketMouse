import Create;
;
private var adhdStrings: String[] = ["Yes", "No"];
private var isMedGridInt: int = 0;

function OnGUI(){
	addLabel("If you answered yes to question 3, are you on medication?", pos(0));
	isMedGridInt = addRadio(isMedGridInt, adhdStrings, 1, 2, pos(1));
	
	addButton("Next", "FormSubmit", pos(3));
}