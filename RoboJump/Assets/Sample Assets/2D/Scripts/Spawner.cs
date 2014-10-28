using UnityEngine;
using System.Collections;

public class Spawner : MonoBehaviour {

	Vector3 spawnPosition;
	
	public float intervalMin;
	public float intervalMax;
	public float xMin;
	public float xMax;
	public float yMin;
	public float yMax;
	public float zMin;
	public float zMax;
	public GameObject obj;

	void Start () {
		spawnPosition = transform.position;
		InvokeRepeating ("Spawn", 0, Random.Range (intervalMin, intervalMax));
	}

	void Spawn(){
		spawnPosition.x = spawnPosition.x + Random.Range (xMin, xMax);
		spawnPosition.y = Random.Range (yMin, yMax);
		spawnPosition.z = Random.Range (zMin, zMax);
		Instantiate (obj, spawnPosition, Quaternion.identity);
	}
}
