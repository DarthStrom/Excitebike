//
//  GameViewController.swift
//  Excitebike
//
//  Created by Jason Duffy on 4/13/16.
//  Copyright (c) 2016 Pairing Group. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let skView = self.view as! SKView

        skView.showsFPS = true
        skView.showsNodeCount = true

        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFit

        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
