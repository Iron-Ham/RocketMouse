//
//  GameScene.swift
//  CrocJumpr
//
//  Created by Hesham Salman on 26/10/2014.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import SpriteKit
import AVFoundation


private var crocodile: SKSpriteNode!
private var prize: SKSpriteNode!


class GameScene: SKScene {
    
    

    override func didMoveToView(view: SKView) {
        
        setUpPhysics()
        setUpScenery()
        setUpPlayer()
        setUpCrocodile()
        
        setUpAudio()
    }
    
    //MARK: Level setup
    
    private func setUpPhysics() {
        

    }
    
    private func setUpScenery() {
        let background = SKSpriteNode(imageNamed: BackgroundImage)
        background.anchorPoint = CGPointMake(0, 1)
        background.position = CGPointMake(0, size.height)
        background.zPosition = Layer.Background
        background.size = CGSize(width: self.view!.bounds.size.width, height:self.view!.bounds.size.height)
        addChild(background)
        
        let water = SKSpriteNode(imageNamed: WaterImage)
        water.anchorPoint = CGPointMake(0, 0)
        water.position = CGPointMake(0, size.height - background.size.height)
        water.zPosition = Layer.Foreground
        water.size = CGSize(width: self.view!.bounds.size.width, height: self.view!.bounds.size.height * 0.2139)
        
        addChild(water)

    }
    
    private func setUpPlayer() {
        

    }
    
    
    //MARK: Croc methods
    
    private func setUpCrocodile() {
        crocodile = SKSpriteNode(imageNamed: CrocMouthClosedImage)
        crocodile.position = CGPointMake(size.width * 0.75, size.height * 0.312)
        crocodile.zPosition = Layer.Crocodile
        
        crocodile.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: CrocMaskImage), size: crocodile.size)
        crocodile.physicsBody?.categoryBitMask = Category.Crocodile
        crocodile.physicsBody?.collisionBitMask = 0
        crocodile.physicsBody?.contactTestBitMask = Category.Player
        crocodile.physicsBody?.dynamic = false
        
        addChild(crocodile)
        
        animateCrocodile()
    }
    
    private func animateCrocodile() {
        let frames = [
            SKTexture(imageNamed: CrocMouthClosedImage),
            SKTexture(imageNamed: CrocMouthOpenImage),
        ]
        
        let duration = 2.0 + drand48() * 2.0
        
        let move = SKAction.animateWithTextures(frames, timePerFrame:0.25)
        let wait = SKAction.waitForDuration(duration)
        let rest = SKAction.setTexture(frames[0])
        let sequence = SKAction.sequence([wait, move, wait, rest])
        
        crocodile.runAction(SKAction.repeatActionForever(sequence))

    }
    
    private func runNomNomAnimationWithDelay(delay: NSTimeInterval) {

        
    }
    
    //MARK: Touch handling
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {

        
    }
    
    //MARK: Game logic
    
    override func update(currentTime: CFTimeInterval) {
        

    }
    
    func didBeginContact(contact: SKPhysicsContact!) {


    }

    
    private func switchToNewGameWithTransition(transition: SKTransition) {
        
        
    }
    
    //MARK: Audio
    
    private func setUpAudio() {
        
        
    }
}
