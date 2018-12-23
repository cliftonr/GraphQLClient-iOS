import RxSwift

/// (R)eactive interface for a study set.
public protocol RStudySet: RServiceModel {

    var creatorObservable: Observable<RUser?> { get }
    var titleObservable: Observable<String?> { get }
    var numberOfTermsObservable: Observable<Int?> { get }
}
