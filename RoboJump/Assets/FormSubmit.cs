using UnityEngine;
using System.Collections;

public class FormSubmit : MonoBehaviour {

	private Server server;

	void Start () {
		PlayerPrefs.SetInt ("first", 1);
		server = GameObject.Find("Server").GetComponentInChildren<Server>();
		StartCoroutine(finish());
	}

	IEnumerator finish(){
		WWW www = server.GET("getuser.php");
		yield return www;
		PlayerPrefs.SetString("userid", www.text);
		Application.LoadLevel("StartMenu");
	}
}
