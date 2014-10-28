using UnityEngine;
using System.Collections;

public class ObjectDetect : MonoBehaviour {

	public GameObject player;
	public float distance = 10;

	bool triggered = false;

	void Update () {
		if (!triggered) {
			if (this.transform.position.x - player.transform.position.x < distance) {
				Reaction.addStart();
				triggered = true;
			}
		}
	}
}
