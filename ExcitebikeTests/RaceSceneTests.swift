//
//  RaceSceneTests.swift
//  Excitebike
//
//  Created by Jason Duffy on 5/25/16.
//  Copyright © 2016 Pairing Group. All rights reserved.
//

import Quick
import Nimble
import SpriteKit

@testable import Excitebike

class RaceSceneTests: QuickSpec {
    override func spec() {

        var subject: RaceScene!

        beforeEach {
            subject = RaceScene(size: CGSize(width: 1.0, height: 1.0))
        }

        describe("RaceScene") {

            beforeEach {
                subject.update(0.0)
            }

            it("starts from the beginning") {
                expect(subject.distanceFromStart).to(equal(0.0))
                expect(subject.foregroundOffset).to(equal(0.0))
                expect(subject.backgroundOffset).to(equal(0.0))
            }

            context("after three seconds") {

                beforeEach {
                    subject.update(3.0)
                }

                it("is still at the beginning") {
                    expect(subject.distanceFromStart).to(equal(0.0))
                    expect(subject.foregroundOffset).to(equal(0.0))
                    expect(subject.backgroundOffset).to(equal(0.0))
                }

                context("after the seven second update") {

                    beforeEach {
                        subject.update(7.0)
                    }

                    it("is four distance from the start") {
                        expect(subject.distanceFromStart).to(equal(4.0))
                        expect(subject.foregroundOffset).to(equal(8.0))
                        expect(subject.backgroundOffset).to(equal(2.0))
                    }
                }
            }
        }
    }
}