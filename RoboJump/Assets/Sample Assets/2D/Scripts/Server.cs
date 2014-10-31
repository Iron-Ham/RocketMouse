using UnityEngine;
using System.Collections;

public class Server : MonoBehaviour {

	private string baseUrl = "http://cps-hccdev.cps.cmich.edu/"; 

	void Start () {}
	
	public WWW GET(string url){
		WWW www = new WWW (baseUrl + url);
		return www;
	}
	
	public WWW POST(string url, string key, string value){
		WWWForm form = new WWWForm();
		form.AddField(key, value);
		WWW www = new WWW(baseUrl + url, form);;
		return www;
	}    
}
