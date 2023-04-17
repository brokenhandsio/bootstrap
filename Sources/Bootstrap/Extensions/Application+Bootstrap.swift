import Vapor
import Leaf

extension Application.Leaf {
    public func useBootstrapTags() {
        self.tags["bsAlert"] = AlertTag()
        self.tags["bsBadge"] = BadgeTag()
    }
}
