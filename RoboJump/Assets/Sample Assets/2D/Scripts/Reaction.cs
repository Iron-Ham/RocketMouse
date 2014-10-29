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
			reactions.Add(r);;
			Debug.Log(r);
			start = -1;
		}
		return (int) (10 * (1 - r));
	}

}

