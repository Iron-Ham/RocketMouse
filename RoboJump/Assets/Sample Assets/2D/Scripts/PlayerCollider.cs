using UnityEngine;
using System.Collections;

public class PlayerCollider : MonoBehaviour {

	public GameObject explosion;
	public GameObject ground;

	public AudioSource playerStep;

	private GameController gameController;

	void Start(){
		GameObject gameControllerObject = GameObject.FindWithTag ("GameController");
		if (gameControllerObject != null){
			gameController = gameControllerObject.GetComponent <GameController>();
		}
		if (gameController == null){
			Debug.Log ("Cannot find 'GameController' script");
		}
	}

	void OnCollisionEnter2D(Collision2D col){
		if(col.gameObject.tag == "Enemy"){
			Reaction.addStop();
			Instantiate(explosion, col.transform.position, Quaternion.identity);
			Destroy(col.gameObject);
			gameController.AddDamage();
		}else if(col.gameObject.tag == "Ground"){
			Vector3 pos = col.transform.position;
			pos.y += 2;
			pos.x -= 1;
			Instantiate(ground, pos, Quaternion.identity);
			playerStep.Play ();
		}
	}

}
