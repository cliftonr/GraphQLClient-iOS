import RxSwift

/// Base protocol for models that are acquired from a service.
public protocol RServiceModel {

    /// ID of the object, known by the server.
    var id: Observable<String> { get }

    /// Date the object was created on the server.
    var creationDate: Observable<Date> { get }

    /// Date the object was modified on the server.
    var modificationDate: Observable<Date> { get }

    /// Whether the object is "soft"-deleted.
    var isDeleted: Observable<Bool> { get }
}
