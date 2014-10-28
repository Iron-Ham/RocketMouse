using UnityEngine;
using System.Collections;

public static class Reaction{

	static ArrayList reactions = new ArrayList(); 
	
	static float start = -1;

	public static void addStart(){
		start = Time.time;
	}

	public static void addStop(){
		if(start != -1){
			var r = Time.time - start;
			reactions.Add(r);
			Debug.Log(r);
			start = -1;
		}
	}

}

