import RxSwift

extension GraphQLService: StudySetsService {

    func studySets(byCreatorId creatorId: Int) -> Observable<[RStudySet]> {
        return Observable.empty()
    }

    func studySet(withSetId setId: Int) -> Observable<RStudySet> {
        return Observable.empty()
    }
}
