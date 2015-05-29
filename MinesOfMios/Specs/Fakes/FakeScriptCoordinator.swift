import MinesOfMios

public class FakeScriptWalkingUseCase : ScriptWalkingUseCase {
    public var started : Bool = false
    public var acknowledgedCount : Int = 0

    public func start() {
        self.started = true
    }

    public func acknowledge() {
        self.acknowledgedCount++
    }
}
