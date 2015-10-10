import UIKit

public protocol ScriptObserver {
    func displayMessage(_: String)
}

public protocol PlayScriptUseCase {
    func start()
    func acknowledge()
}

public class ScriptUseCase : PlayScriptUseCase {

    public var observer : ScriptObserver
    private var script : Script
    private var index : Int = 0

    public init(observer: ScriptObserver, script: Script) {
        self.script = script
        self.observer = observer
    }

    public func start() {
        self.observer.displayMessage(self.script.messages()[self.index])
    }

    public func acknowledge() {
        self.index++

        if (self.index < self.script.messages().count) {
            self.observer.displayMessage(self.script.messages()[self.index])
        }
    }
}
