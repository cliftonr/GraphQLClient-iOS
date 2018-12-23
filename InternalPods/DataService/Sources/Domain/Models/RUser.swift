import RxSwift

/// (R)eactive interface for a user.
public protocol RUser: RServiceModel {

    var usernameObservable: Observable<String?> { get }
    var userUpgradeTypeObservable: Observable<NSNumber?> { get }
    var profileImageUrlObservable: Observable<URL?> { get }
}
