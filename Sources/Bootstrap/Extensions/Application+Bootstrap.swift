import Vapor
import Leaf

extension Application.Leaf {
    public func useBootstrapLeafTags() {
        self.tags["bsAlert"] = AlertTag()
    }
}
