import UIKit

extension UICollectionReusableView: ReuseIdentifiable {}

extension UICollectionView {
    
    /// Register a cell class for reuse in the collection view. For example:
    ///
    ///     collectionView.register(reusableCellClass: MyCellClass.self)
    ///
    /// - Parameter class: The cell class to register for reuse.
    public func register<T: UICollectionViewCell>(reusableCellClass _: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /// Register a supplementary view class for reuse in the collection view. For example:
    ///
    ///     collectionView.register(reusableSupplementaryViewClass: MyCellClass.self,
    ///         forKind: UICollectionElementKindSectionHeader)
    ///
    /// - Parameters:
    ///   - class:  The supplementary view class to register for reuse.
    ///   - kind:   The kind of supplementary view for which to register. Defined by the layout object.
    public func register<T: UICollectionReusableView>(reusableSupplementaryViewClass _: T.Type,
                                                      forKind kind: String)
    {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /// Dequeue a reusable cell of the specified class. For example:
    ///
    ///     let cell = collectionView.dequeueReusableCell(ofClass: MyCellClass.self, for: indexPath)
    ///
    /// - Note: The cell class must first be registered by calling `register(reusableCellClass:)`.
    ///
    /// - Parameters:
    ///   - class:      The cell class to dequeue for reuse.
    ///   - indexPath:  Index path where the cell shall be reused.
    /// - Returns: A reusable cell of the specified class.
    public func dequeueReusableCell<T: UICollectionViewCell>(ofClass _: T.Type,
                                                             for indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath) as? T else
        {
            fatalError("Couldn't dequeue reusable cell of class \(T.self)."
                + " Did you call register(reusableCellClass:)?")
        }
        
        return cell
    }
    
    /// Dequeue a reusable supplementary view of the specified class. For example:
    ///
    ///     let view = collectionView.dequeueReusableSupplementaryView(ofClass: MyViewClass.self,
    ///         kind: UICollectionElementKindSectionHeader for: indexPath)
    ///
    /// - Note: The view class must first be registered by calling
    ///         `register(reusableSupplementaryViewClass:forKind:)`.
    ///
    /// - Parameters:
    ///   - class:      The supplementary view class to dequeue for reuse.
    ///   - kind:       The kind of supplementary view to dequeue. Defined by the layout object.
    ///   - indexPath:  Index path where the view shall be reused.
    /// - Returns: A reusable supplementary view of the specified class and view-kind.
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofClass _: T.Type,
                                                                              kind: String,
                                                                              for indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: T.defaultReuseIdentifier,
                                                          for: indexPath) as? T else
        {
            fatalError("Couldn't dequeue supplementary view of class \(T.self), of kind \(kind)."
                + " Did you call register(reusableSupplementaryViewClass:forKind:)?")
        }
        
        return cell
    }
}
