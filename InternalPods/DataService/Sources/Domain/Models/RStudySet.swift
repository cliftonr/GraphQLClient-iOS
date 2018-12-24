import RxSwift

/// (R)eactive interface for a study set.
public protocol RStudySet: RServiceModel {

    var titleObservable: Observable<String> { get }
    var descriptionObservable: Observable<String?> { get }
    var creatorObservable: Observable<RUser> { get }
    var terms: Observable<[RStudyTerm]?> { get }
}
