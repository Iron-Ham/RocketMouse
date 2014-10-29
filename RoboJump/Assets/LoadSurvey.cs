using UnityEngine;
using System.Collections;

public class LoadSurvey : MonoBehaviour {

	public Texture2D icon;

	// Use this for initialization
	void Start () {
	
	}

	void OnGUI () {
		GUI.Label(new Rect(10, 10, 200, 40), "Have you ever been diagnosed with ADHD?");

		if (GUI.Button (new Rect (10,70, 100, 20), "Yes")) {
			print ("you clicked the yes button");
			Application.LoadLevel("Scene1");
		}

		if (GUI.Button (new Rect (110,70, 100, 20), "No")) {
			print ("you clicked the no button");
		}

	}
}
