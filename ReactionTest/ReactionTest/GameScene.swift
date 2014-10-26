//
//  GameScene.swift
//  ReactionTest
//
//  Created by Hesham Salman on 10/26/14.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import Foundation
import SpriteKit

let TickLengthLevelOne = NSTimeInterval(600)


class GameScene: SKScene{
    
    let gameLayer = SKNode()
    
    override func didMoveToView(view: SKView) {
        self.createSceneContents()
    }
    
    func createSceneContents() {
        //Create SKSpriteNodes here and general layout for the scene
    }
    
    
}