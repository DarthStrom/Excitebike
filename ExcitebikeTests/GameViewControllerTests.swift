//
//  GameViewControllerTests.swift
//  Excitebike
//
//  Created by Jason Duffy on 4/27/16.
//  Copyright © 2016 Pairing Group. All rights reserved.
//

import Quick
import Nimble
import SpriteKit

@testable import Excitebike

class GameViewControllerTests: QuickSpec {

    override func spec() {

        describe("GameViewController") {

            var subject: GameViewController!

            beforeEach {
                subject = UIStoryboard.init(name: "Main", bundle: NSBundle(identifier: "com.pairinggroup.Excitebike.development")).instantiateViewControllerWithIdentifier("TitleViewController") as? GameViewController
            }

            describe("viewDidLoad") {

                it("shows the title screen") {
                    let mockView = MockView()
                    subject.view = mockView

                    subject.viewDidLoad()

                    expect(subject.view).to(beIdenticalTo(mockView))
                    expect(mockView.mocker.getInvocationCountFor("presentScene")).to(equal(1))
                    let scene = mockView.mocker.getParametersFor("presentScene")?[0] as? MenuScene
                    expect(scene?.size).to(equal(mockView.bounds.size))
                    expect(scene?.scaleMode).to(equal(SKSceneScaleMode.AspectFit))
                }
            }

            describe("shouldAutorotate") {

                it("is true") {
                    expect(subject.shouldAutorotate()).to(beTrue())
                }
            }

            describe("supportedInterfaceOrientations") {

                it("supports all but upside down if device is a phone") {
                    expect(subject.supportedInterfaceOrientations()).to(equal(UIInterfaceOrientationMask.AllButUpsideDown))
                }
            }

            describe("prefersStatusBarHidden") {

                it("is true") {
                    expect(subject.prefersStatusBarHidden()).to(beTrue())
                }
            }
        }
    }

    private class MockView: SKView {
        var mocker = Mocker()

        override func presentScene(scene: SKScene?) {
            mocker.recordInvocation("presentScene", paramList: [scene!])
        }
    }
}