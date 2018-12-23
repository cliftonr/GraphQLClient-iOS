import RxSwift

/// Service for querying study sets.
public protocol StudySetsService {

    func studySets(byCreatorId creatorId: Int) -> Observable<[RStudySet]>
    func studySet(withSetId setId: Int) -> Observable<RStudySet>
}
