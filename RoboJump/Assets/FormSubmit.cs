using UnityEngine;
using System.Collections;

public class FormSubmit : MonoBehaviour {

	// Use this for initialization
	void Start () {
		PlayerPrefs.SetInt ("first", 1);
		Application.LoadLevel ("StartMenu");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
