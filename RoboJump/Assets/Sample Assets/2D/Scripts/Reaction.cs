using UnityEngine;
using System.Collections;

public static class Reaction{

	static ArrayList reactions = new ArrayList(); 
	static float start = -1;

	public static void addStart(){
		start = Time.time;
	}

	public static int addStop(){
		float r = 0;
		if(start != -1){
			r = Time.time - start;
			reactions.Add(r);
			start = -1;
			return (int) (10 * (1 - r > 0 ? 1 - r : 0));
		}
		return 0;
	}

	public static string getJson(){
		string builder = "{\"uuid\":\"" + PlayerPrefs.GetString("uuid") +  "\",\"times\":[";
		if (reactions.Count > 0){
			builder += "\"" + reactions[0].ToString() + "\"";
		}
		for (int i = 1; i < reactions.Count; i++){
			builder += ",\"" + reactions[i].ToString() + "\"";
		}
		builder += "]}";
		return builder;
	}

}

