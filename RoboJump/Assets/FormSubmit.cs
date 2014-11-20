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
		WWW www = server.GET("getuser");
		yield return www;
		PlayerPrefs.SetString("uuid", www.text);
		string output = string.Format("\"uuid\":\"{0}\", \"is_diagnosed\":\"{1}\", \"is_medicated\":\"{2}\", \"gender\":\"{3}\", \"age\":\"{4}\"", 
		                              get("uuid"), get("is_diagnosed"), get("is_medicated"), get("gender"), get("age"));
		output = "{" + output + "}";
		www = server.POST("survey", "json", output);
		yield return www;
		Debug.Log (www.text);
		Application.LoadLevel("StartMenu");
	}

	string get(string id){
		return PlayerPrefs.GetString (id);
	}
}
