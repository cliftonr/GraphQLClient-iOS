/// Conforming classes provide an identifier for reuse.
public protocol ReuseIdentifiable: class {

    /// An identifier for reusable instances of the conforming class.
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifiable {

    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
