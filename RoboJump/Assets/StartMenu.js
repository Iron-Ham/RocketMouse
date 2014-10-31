import Create;

public var title: GUIText;

function Start(){
	Debug.Log(PlayerPrefs.GetInt("first"));
	var first = PlayerPrefs.GetInt("first");
	if(first == 0){
		Application.LoadLevel("FormQ1");
	}
	title.text = "RoboJumpr";
}

function OnGUI(){

	addButton("Play", "Scene1", pos(3));
	addQuit("Quit", pos(4));

}