using UnityEngine;
using System.Collections;

public class PlayerCollider : MonoBehaviour {

	public GameObject explosion;
	public GameObject ground;
	public GameObject groundLarge;

	public AudioSource playerStep;
	public AudioSource playerLand;
	public AudioSource gotCoin;

	private GameController gameController;

	private float lastStepTime = 0;

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
			float now = Time.time;
			if(now - lastStepTime > 0.25){
				Vector3 pos = col.transform.position;
				pos.y += 1;
				if(now - lastStepTime > 1){
					Instantiate(groundLarge, pos, new Quaternion(0, 270, 270, 3));
					playerLand.Play ();
				}
				pos.x -= 1;
				lastStepTime = now;
				Instantiate(ground, pos, Quaternion.identity);
				playerStep.Play ();
			}
		}else if(col.gameObject.tag == "Coin"){
			gotCoin.Play ();
			Destroy(col.gameObject);
			gameController.AddScore (1);
		}
	}

}
