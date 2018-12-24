import RxSwift

/// Service for querying study sets.
public protocol StudySetsService {

    func studySets(byCreatorId creatorId: String) -> Single<[RStudySet]>
    func studySet(withSetId setId: String) -> Single<RStudySet>
}
