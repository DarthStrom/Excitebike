//
//  GameScene.swift
//  Excitebike
//
//  Created by Jason Duffy on 4/13/16.
//  Copyright (c) 2016 Pairing Group. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Marker Felt")
        myLabel.text = "Excite Bike!"
        myLabel.fontSize = 45
        myLabel.name = "Title"
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view?.presentScene(SKScene(), transition: SKTransition.flipVerticalWithDuration(0.5))
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
