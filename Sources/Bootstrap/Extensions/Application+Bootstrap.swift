import Vapor
import Leaf

extension Application.Leaf {
    public func useBootstrapTags() {
        self.tags["bsAlert"] = AlertTag()
        self.tags["bsBadge"] = BadgeTag()
        self.tags["bsButton"] = ButtonTag()
        self.tags["bsInput"] = InputTag()
    }
}
