//
//  ExcitebikeTests.swift
//  ExcitebikeTests
//
//  Created by Jason Duffy on 4/13/16.
//  Copyright © 2016 Pairing Group. All rights reserved.
//

import Quick
import Nimble
import SpriteKit

@testable import Excitebike

class MenuSceneTests: QuickSpec {
    
    override func spec() {

        var subject: MenuScene!

        beforeEach {
            subject = MenuScene(size: CGSize(width: 100, height: 200))
        }

        describe("didMoveToView") {

            it("makes a label") {

                subject.didMoveToView(SKView())

                let label = subject.childNodeWithName("Title") as? SKLabelNode
                expect(label?.fontName).to(equal("Marker Felt"))
                expect(label?.text).to(equal("Excite Bike!"))
                expect(label?.fontSize).to(equal(45))
                expect(label?.position).to(equal(CGPoint(x: CGRectGetMidX(subject.frame), y: CGRectGetMidY(subject.frame))))
            }
        }

        describe("touchesBegan") {

            it("starts the game") {
                let mockView = MockView()
                mockView.presentScene(subject)

                subject.touchesBegan([], withEvent: nil)

                expect(subject.view).to(beIdenticalTo(mockView))
                let newScene = mockView.mocker.getParametersFor("presentScene")?[0] as? RaceScene
                expect(newScene).notTo(beNil())
                expect(newScene?.size).to(equal(subject.view?.frame.size))
            }
        }
    }

    private class MockView: SKView {
        var mocker = Mocker()

        override func presentScene(scene: SKScene, transition: SKTransition) {
            mocker.recordInvocation("presentScene", paramList: [scene, transition])
        }
    }
}
