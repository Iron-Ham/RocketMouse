using UnityEngine;
using System.Collections;

public class LoadSurvey : MonoBehaviour {

	public Texture2D icon;

	// Use this for initialization
	void Start () {
	
	}

	void OnGUI () {
		if (GUI.Button (new Rect (10,10, 100, 50), icon)) {
			print ("you clicked the icon");
		}

		if (GUI.Button (new Rect (10,70, 100, 20), "This is text")) {
			print ("you clicked the text button");
		}
	}
}
