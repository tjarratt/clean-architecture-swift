import UIKit
import XCTest
import Quick
import Nimble
import MinesOfMios

class FakeScriptObserver : ScriptObserver {
    var lastMessageReceived : String = ""

    func displayMessage(arg: String) {
        self.lastMessageReceived = arg
    }

    func lastMessage() -> String {
        return self.lastMessageReceived
    }
}


class ScriptSpec: QuickSpec {
    override func spec() {
        var script : Script!
        var observer : FakeScriptObserver!

        beforeEach {
            observer = FakeScriptObserver()
            script = Script(observer: observer, messages: ["one", "two", "three"])
        }

        context("when the script is started") {
            beforeEach {
                script.start()
            }

            it("should pass the first message to the observer") {
                expect(observer.lastMessage()).to(equal("one"))
            }

            context("when the observer acknowledges the message") {
                beforeEach {
                    script.acknowledge()
                }

                it("should pass the next message to the observer") {
                    expect(observer.lastMessage()).to(equal("two"))
                }

                context("when the observer acknowledges the next message") {
                    beforeEach {
                        script.acknowledge()
                    }

                    it("should pass the final message to the observer") {
                        expect(observer.lastMessage()).to(equal("three"))
                    }

                    context("when the observer acknowledges the final message") {
                        beforeEach {
                            script.acknowledge()
                            observer.lastMessageReceived = ""
                        }

                        it("should stop sending messages to the observer") {
                            expect(observer.lastMessage()).to(equal(""))
                        }
                    }
                }

            }
        }
    }
}
