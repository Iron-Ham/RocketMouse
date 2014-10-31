import Create;

public var finalScore: GUIText;
public var bestScore: GUIText;
private var best: int;
private var calculated: int;
private var distance: int = 0;
private var score: int = 0;

function Start(){
	calculated = 0;
	best = 0;
	UpdateScore();
}

function OnGUI(){
	distance = PlayerPrefs.GetInt("distance");
	score = PlayerPrefs.GetInt("score");
	best = PlayerPrefs.GetInt("best");
	calculated = distance * score;
	if(calculated > best){
		best = calculated;
		PlayerPrefs.SetInt("best", best);
	}
	UpdateScore();
	
	addButton("Play", "Scene1", pos(3));
	addQuit("Quit", pos(4));
	addClear("Clear Data", pos(6));
}

function UpdateScore(){
	finalScore.text = "Score: " + distance + " * " + score + " = " + calculated;
	bestScore.text = "Personal Best: " + best;
}