import UIKit

extension UITableViewCell: ReuseIdentifiable {}

extension UITableView {
    
    /// Register a cell class for reuse in the table view. For example:
    ///
    ///     tableView.register(reusableCellClass: MyCellClass.self)
    ///
    /// - Parameter class: The cell class to register for reuse.
    public func register<T: UITableViewCell>(reusableCellClass _: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /// Dequeue a reusable cell of the specified class. For example:
    ///
    ///     let cell = tableView.dequeueReusableCell(ofClass: MyCellClass.self, for: indexPath)
    ///
    /// - Note: The cell class must first be registered by calling `register(reusableCellClass:)`.
    ///
    /// - Parameters:
    ///   - class:      The cell class to dequeue for reuse.
    ///   - indexPath:  Index path where the cell shall be reused.
    /// - Returns: A reusable cell of the specified type.
    public func dequeueReusableCell<T: UITableViewCell>(ofClass _: T.Type,
                                                        for indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath) as? T else
        {
            fatalError("Couldn't dequeue reusable cell of class \(T.self)."
                + " Did you call register(reusableCellClass:)?")
        }
        
        return cell
    }
}
