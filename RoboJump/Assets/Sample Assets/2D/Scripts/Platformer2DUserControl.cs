﻿using UnityEngine;

[RequireComponent(typeof(PlatformerCharacter2D))]
public class Platformer2DUserControl : MonoBehaviour {
	private PlatformerCharacter2D character;
    private bool jump;


	void Awake(){
		character = GetComponent<PlatformerCharacter2D>();
	}

    void Update () {
        // Read the jump input in Update so button presses aren't missed.
		#if CROSS_PLATFORM_INPUT
		        if (CrossPlatformInput.GetButtonDown("Jump")) jump = true;
		#else
				if (Input.GetButtonDown("Jump")) jump = true;
		#endif
		if (Input.touchCount == 1) {
			if(Input.GetTouch(0).phase == TouchPhase.Ended){
				jump = true;
			}
		}

    }

	void FixedUpdate(){
		// Read the inputs.
		bool crouch = Input.GetKey(KeyCode.LeftControl);
		#if CROSS_PLATFORM_INPUT
		float h = 1.3f;//CrossPlatformInput.GetAxis("Horizontal");
		#else
			float h = 1.3f;//;Input.GetAxis("Horizontal");
		#endif

		// Pass all parameters to the character control script.
		character.Move( h, crouch , jump );

        // Reset the jump input once it has been used.
	    jump = false;
	}
}
