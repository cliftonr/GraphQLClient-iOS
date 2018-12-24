import RxSwift

/// (R)eactive interface for a study term.
public protocol RStudyTerm: RServiceModel {

    var wordObservable: Observable<String> { get }
    var definitionObservable: Observable<String> { get }
    var parentSetObservable: Observable<RStudySet> { get }
}
