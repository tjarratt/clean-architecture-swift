import UIKit

public protocol ScriptObserver {
    func displayMessage(String)
}

public protocol ScriptCoordinator {
    func start()
    func acknowledge()
}

public class Script : ScriptCoordinator {

    public var observer : ScriptObserver
    private var messages : Array<String>
    private var index : Int = 0

    public init(observer: ScriptObserver, messages: Array<String>) {
        self.messages = messages
        self.observer = observer
    }

    public func start() {
        self.observer.displayMessage(self.messages[self.index])
    }

    public func acknowledge() {
        self.index++

        if (self.index < self.messages.count) {
            self.observer.displayMessage(self.messages[self.index])
        }
    }
}
