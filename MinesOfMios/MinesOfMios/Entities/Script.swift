import Foundation

public class Script: NSObject {
    private var _messages : Array<String>

    public init(messages: Array<String>) {
        self._messages = messages
    }

    public func messages() -> Array<String> {
        return self._messages
    }
}
