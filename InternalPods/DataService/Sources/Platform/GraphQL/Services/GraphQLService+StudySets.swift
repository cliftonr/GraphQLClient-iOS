import RxSwift

final class GraphQLStudySetsService: GraphQLService, StudySetsService {

    func studySets(byCreatorId creatorId: String) -> Single<[RStudySet]> {
        return Single.create { [weak self] observer in
            let fetch = self?.apolloClient.fetch(query: StudySetsByCreatorQuery(creatorId: creatorId))
            { result, error in
                guard let strongSelf = self,
                    let data = result?.data else
                {
                    return
                }

                let models: [RStudySetImpl]? = strongSelf.modelCache.updateModels(data.studySets)
                observer(.success(models ?? []))
            }

            return Disposables.create {
                fetch?.cancel()
            }
        }
    }

    func studySet(withSetId setId: String) -> Single<RStudySet> {
        return Single.create { [weak self] observer in
            let fetch = self?.apolloClient.fetch(query: StudySetDetailsQuery(setId: setId))
            { result, error in
                guard let strongSelf = self, let data = result?.data,
                    let studySet = data.studySet else
                {
                    return
                }

                let model: RStudySetImpl = strongSelf.modelCache.updateModel(studySet)
                observer(.success(model))
            }

            return Disposables.create {
                fetch?.cancel()
            }
        }
    }
}
