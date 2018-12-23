import RxSwift

extension GraphQLService: StudyTermsService {

    func studyTerms(byParentSetId setId: Int) -> Observable<[RStudyTerm]> {
        return Observable.empty()
    }
}
