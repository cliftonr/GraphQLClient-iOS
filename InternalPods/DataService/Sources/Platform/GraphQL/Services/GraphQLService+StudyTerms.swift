import RxSwift

extension GraphQLService: StudyTermsService {

    func studyTerms(byParentSetId setId: String) -> Observable<[RStudyTerm]> {
        return Observable.empty()
    }
}
