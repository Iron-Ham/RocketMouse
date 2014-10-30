using UnityEngine;
using System.Collections;

public class ObjectDetect : MonoBehaviour {

	public GameObject player;
	public float detectDistance = 10;
	public AudioSource armSound;
	public float armDistance = 5;

	bool triggered = false;
	bool armed = false;

	void Update () {
		var distance = Mathf.Abs (this.transform.position.x - player.transform.position.x);
		if (!triggered) {
			if (distance < detectDistance) {
				Reaction.addStart();
				triggered = true;
			}
		}
		if (distance < armDistance) {
			if(!armed){
				armed = true;
				armSound.Play ();
			}
			transform.Rotate (Vector3.up, 200 * Time.deltaTime);
		}
	}
}
