import RxSwift

/// (R)eactive interface for a study term.
public protocol RStudyTerm: RServiceModel {

    var setObservable: Observable<RStudySet?> { get }
    var wordObservable: Observable<String?> { get }
    var definitionObservable: Observable<String?> { get }
    var rankObservable: Observable<Int?> { get }
}
