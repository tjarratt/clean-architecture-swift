import UIKit
import XCTest
import Quick
import Nimble
import MinesOfMios

public class FakeScriptCoordinator : ScriptCoordinator {
    public var started : Bool = false
    public var acknowledgedCount : Int = 0

    public func start() {
        self.started = true
    }

    public func acknowledge() {
        self.acknowledgedCount++
    }
}

class RootViewControllerSpec: QuickSpec {
    override func spec() {
        fdescribe("a spec") {
            var subject : RootViewController!
            var scriptCoordinator : FakeScriptCoordinator!

            beforeEach {
                scriptCoordinator = FakeScriptCoordinator()

                var storyboard = UIStoryboard(name: "Main", bundle: nil)
                subject = storyboard.instantiateInitialViewController() as! RootViewController
                subject.scriptCoordinator = scriptCoordinator

                expect(subject.view).toNot(beNil())
            }

            it("should change its background color") {
                let backgroundColor = subject.view.backgroundColor
                var whiteComponent : CGFloat = -1
                var alphaComponent : CGFloat = -1

                backgroundColor!.getWhite(&whiteComponent, alpha: &alphaComponent)
                expect(whiteComponent).to(beCloseTo(0, within:0.05))
                expect(alphaComponent).to(equal(1))
            }

            it("should start displaying messages from the script") {
                expect(scriptCoordinator.started).to(beTrue())
            }

            describe("displaying messages from the script") {
                beforeEach {
                    subject.displayMessage("hello world")
                }

                it("should use its label to present the messages") {
                    expect(subject.label.text).to(equal("hello world"))
                }
            }

            describe("when its button is tapped") {
                beforeEach {
                    subject.userDidTapButton(UIButton())
                }

                it("should acknowledge the last message from the script coordinator") {
                    expect(scriptCoordinator.acknowledgedCount).to(equal(1))
                }
            }
        }
    }
}