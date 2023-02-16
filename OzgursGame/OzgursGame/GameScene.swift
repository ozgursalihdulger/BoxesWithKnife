//
//  GameScene.swift
//  OzgursGame
//
//  Created by Özgür Salih Dülger on 12.02.2023.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var knife = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    var box7 = SKSpriteNode()
    var box8 = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Knife = 1
        case Box = 2
    }
    
    
    override func didMove(to view: SKView) {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        
        knife = childNode(withName: "knife") as! SKSpriteNode
        
        let knifeTexture = SKTexture(imageNamed: "knife")
        
        knife.physicsBody = SKPhysicsBody(circleOfRadius: knifeTexture.size().height / 10)
        knife.physicsBody?.affectedByGravity = false
        knife.physicsBody?.isDynamic = true
        knife.physicsBody?.mass = 0.15
        originalPosition = knife.position
        
        knife.physicsBody?.contactTestBitMask = ColliderType.Knife.rawValue
        knife.physicsBody?.categoryBitMask = ColliderType.Knife.rawValue
        knife.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        
        //BOX
        
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 5, height: boxTexture.size().height / 5)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.1
        
        box1.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.1
        
        box2.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.1
        
        box3.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.1
        
        box4.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.1
        
        box5.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.1
        
        box6.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
        box7 = childNode(withName: "box7") as! SKSpriteNode
        box7.physicsBody = SKPhysicsBody(rectangleOf: size)
        box7.physicsBody?.isDynamic = true
        box7.physicsBody?.affectedByGravity = true
        box7.physicsBody?.allowsRotation = true
        box7.physicsBody?.mass = 0.1
        
        box7.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
        box8 = childNode(withName: "box8") as! SKSpriteNode
        box8.physicsBody = SKPhysicsBody(rectangleOf: size)
        box8.physicsBody?.isDynamic = true
        box8.physicsBody?.affectedByGravity = true
        box8.physicsBody?.allowsRotation = true
        box8.physicsBody?.mass = 0.1
        
        box8.physicsBody?.collisionBitMask = ColliderType.Knife.rawValue
        
        
            //score label
                scoreLabel.fontName = "Helvetica"
              scoreLabel.fontSize = 60
              scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: -150)
              scoreLabel.zPosition = 2
              self.addChild(scoreLabel)
        
        
        
        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Knife.rawValue || contact.bodyB.collisionBitMask == ColliderType.Knife.rawValue {
            
            score += 1
            scoreLabel.text = String(score)
            
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == knife {
                                knife.position = touchLocation
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
      
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == knife {
                                knife.position = touchLocation
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == knife {
                                
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                knife.physicsBody?.applyImpulse(impulse)
                                knife.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if let knifePhysics = knife.physicsBody {
            
            if knifePhysics.velocity.dx <= 0.1 && knifePhysics.velocity.dy <= 0.1 && knifePhysics.angularVelocity <= 0.1 && gameStarted == true {
                
                knife.physicsBody?.affectedByGravity = false
                knife.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                knife.physicsBody?.angularVelocity = 0
                knife.zPosition = 1
                knife.position = originalPosition!
                
                score = 0
                scoreLabel.text = String(score)
                
                gameStarted = false
                
            }
            
        }
        
    }
    
    
}
