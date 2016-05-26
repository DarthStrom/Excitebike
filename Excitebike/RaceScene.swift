//
//  RaceScene.swift
//  Excitebike
//
//  Created by Jason Duffy on 5/25/16.
//  Copyright © 2016 Pairing Group. All rights reserved.
//

import SpriteKit

class RaceScene: SKScene {
    private var startTime: NSTimeInterval?

    var distanceFromStart = 0.0
    var foregroundOffset = 0.0
    var backgroundOffset = 0.0
    let distanceLabel: SKLabelNode

    override init(size: CGSize) {
        distanceLabel = SKLabelNode(fontNamed:"Marker Felt")

        super.init(size: size)

        distanceLabel.fontSize = 45
        distanceLabel.name = "Distance"
        distanceLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        distanceLabel.text = "\(distanceFromStart)"
        self.addChild(distanceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(currentTime: NSTimeInterval) {
        if startTime == nil {
            startTime = currentTime
        }
        if currentTime - startTime! > 3.0 {
            distanceFromStart = currentTime - startTime! - 3.0
            foregroundOffset = distanceFromStart * 2
            backgroundOffset = distanceFromStart / 2
        }

        distanceLabel.text = "\(distanceFromStart)"
    }
}
