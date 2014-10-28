//
//  GameScene.swift
//  PointBlank
//
//  Created by Hesham Salman on 10/26/14.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import SpriteKit
import AVFoundation

var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(
        filename, withExtension: nil)
    if (url == nil) {
        println("Could not find file: \(filename)")
        return
    }
    
    var error: NSError? = nil
    backgroundMusicPlayer =
        AVAudioPlayer(contentsOfURL: url, error: &error)
    if backgroundMusicPlayer == nil {
        println("Could not create audio player: \(error!)")
        return
    }
    
    backgroundMusicPlayer.numberOfLoops = -1
    backgroundMusicPlayer.prepareToPlay()
    backgroundMusicPlayer.play()
}




struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Monster   : UInt32 = 0b1       
    static let Player    : UInt32 = 0b10
}



func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}




//    @TODO Give player jump ability
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let background = SKSpriteNode(imageNamed: "BG_Jungle_hor_rpt_1920x768")
    
    let player = SKSpriteNode(imageNamed: "RocketMouse_1024")
    let jumpHeight = CGFloat(0.8)
    let jumpSpeed = CGFloat(0.2)
    let fallSpeed = CGFloat(1)
    
    
    override func didMoveToView(view: SKView) {
        background.size = CGSize(width: background.size.width, height: size.height)
        background.position = CGPoint(x: 0, y: size.height/2)
        addChild(background)
        playBackgroundMusic("background-music-aac.caf")
        backgroundColor = SKColor.whiteColor()
        player.size = CGSize(width: player.size.width/10, height: player.size.height/10)
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.3)
        player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size)
        player.physicsBody?.dynamic = true
        player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.Monster
        player.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        
        addChild(player)
        physicsWorld.gravity = CGVectorMake(0,0)
        physicsWorld.contactDelegate = self
        
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addMonster),
                SKAction.waitForDuration(2.5)
                ])
            ))
    }
    
    
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(#min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
//    @TODO Set monster invisible until monster reaches certain Y point
    func addMonster() {
        
        // Create sprite
        let monster = SKSpriteNode(imageNamed: "ant_stand")
        
        monster.physicsBody = SKPhysicsBody(rectangleOfSize: monster.size)
        monster.physicsBody?.dynamic = true
        monster.physicsBody?.categoryBitMask = PhysicsCategory.Monster
        monster.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        monster.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        
        
        // Determine where to spawn the monster along the Y axis
        let actualY = size.height * 0.3
        
        // Position the monster slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        
        // Add the monster to the scene
        addChild(monster)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
//  @TODO: Change to MonsterDidCollideWithPlayer 
    func playerDidCollideWithMonster(player:SKSpriteNode, monster:SKSpriteNode) {
        println("Hit")
        player.removeFromParent()
    }
//  @TODO: Change physics contact points
    func didBeginContact(contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategory.Monster != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Player != 0)) {
                playerDidCollideWithMonster(firstBody.node as SKSpriteNode, monster: secondBody.node as SKSpriteNode)
        }
        
    }
    
    
    
    
    
//    @TODO Add collision points between player and monsters. Set that to be the lose condition.
//    Set jump command to occur on touch here
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        //runAction(SKAction.playSoundFileNamed("pew-pew-lei.caf", waitForCompletion: false))

        if (player.position.y == size.height * 0.3){
            jump();
        }
        
        // 1 - Choose one of the touches to work with
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        println(touch)
        
    }
    
    func jump(){
        let actionJump = SKAction.moveTo(CGPoint(x: player.position.x, y: size.height * jumpHeight), duration: NSTimeInterval(jumpSpeed))
        let actionGravity = SKAction.moveTo(CGPoint(x: player.position.x, y: size.height * 0.3), duration: NSTimeInterval(fallSpeed))
        
        player.runAction(actionJump, completion: {self.player.runAction(actionGravity)})
    }
    
    
}
