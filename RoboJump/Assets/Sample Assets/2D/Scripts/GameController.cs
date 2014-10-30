using UnityEngine;
using System.Collections;

public class GameController : MonoBehaviour {

	public GUIText scoreText;
	public GUIText healthText;
	public GUIText distanceText;
	private int score;
	private int health;
	private int distance;
	private PlayerPrefs prefs;

	void Start(){
		score = 0;
		health = 3;
		distance = 0;
		UpdateScore ();
		UpdateHealth ();
		UpdateDistance ();
	}
	
	public void AddScore (int newScoreValue){
		score += newScoreValue;
		UpdateScore ();
	}

	public void AddDamage(){
		health -= 1;
		if (health <= 0){
			PlayerPrefs.SetInt ("score", score);
			PlayerPrefs.SetInt ("distance", distance);
			Application.LoadLevel ("EndGame");
		}
		UpdateHealth ();
	}

	public void SetDistance(float newDistanceValue){
		distance = (int) newDistanceValue;
		UpdateDistance ();
	}
	
	void UpdateScore (){
		scoreText.text = "Score: " + score;
	}

	void UpdateHealth(){
		healthText.text = "Health: " + (health * 100 / 3) + "%";
	}

	void UpdateDistance(){
		distanceText.text = "Distance: " + distance;
	}
}
