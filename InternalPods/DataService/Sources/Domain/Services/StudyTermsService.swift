import RxSwift

/// Service for querying study terms.
public protocol StudyTermsService {

    func studyTerms(byParentSetId setId: String) -> Observable<[RStudyTerm]>
}
