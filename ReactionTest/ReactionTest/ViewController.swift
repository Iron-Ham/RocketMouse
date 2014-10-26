//
//  ViewController.swift
//  ReactionTest
//
//  Created by Hesham Salman on 10/26/14.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import UIKit
import SpriteKit


class ViewController: UIViewController {
    
    var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

