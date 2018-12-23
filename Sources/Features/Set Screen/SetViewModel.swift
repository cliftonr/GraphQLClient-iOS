import Components
import DataService
import RxSwift
import RxCocoa

final class SetViewModel {

    private let setId: Int
    private let termsService: StudyTermsService
    private let setsService: StudySetsService

    init(setId: Int,
         termsService: StudyTermsService,
         setsService: StudySetsService)
    {
        self.setId = setId
        self.termsService = termsService
        self.setsService = setsService
    }
}

extension SetViewModel: Components.ViewModel {

    typealias Input = ViewModelInputNone

    struct Output {

        let title: Observable<String>
        let termCount: Observable<String>
        let terms: Observable<[RStudyTerm]>
        let userName: Observable<String>
    }

    func connect(
        input inputClosure: () -> SetViewModel.Input,
        output outputClosure: (SetViewModel.Output) -> Void)
    {
        let _ = inputClosure()

        let set = setsService.studySet(withSetId: setId)

        let creator = set
            .flatMap { $0.creatorObservable }
            .skipNil()

        let userName = creator
            .flatMap { $0.usernameObservable }
            .skipNil()

        let terms = termsService.studyTerms(byParentSetId: setId)

        let termCount = set
            .flatMap { $0.numberOfTermsObservable }
            .skipNil()
            .map { return "\($0) cards" }

        let title = set
            .flatMap { $0.titleObservable }
            .skipNil()

        let output = Output(
            title: title,
            termCount: termCount,
            terms: terms,
            userName: userName)

        outputClosure(output)
    }
}
