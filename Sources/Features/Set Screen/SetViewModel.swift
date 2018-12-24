import Components
import DataService
import RxSwift
import RxCocoa

final class SetViewModel {

    private let setId: String
    private let termsService: StudyTermsService
    private let setsService: StudySetsService

    init(setId: String,
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
            .subscribeOn(MainScheduler.instance)
            .debug()

        let creator = set
            .asObservable()
            .flatMap { $0.creatorObservable }
            .debug("creator", trimOutput: false)

        let userName = creator
            .flatMap { $0.usernameObservable }
            .debug("username", trimOutput: false)

        let terms = termsService.studyTerms(byParentSetId: setId)

        let termCount = terms
            .map { return "\($0.count) cards" }

        let title = set
            .asObservable()
            .flatMap { $0.titleObservable }

        let output = Output(
            title: title,
            termCount: termCount,
            terms: terms,
            userName: userName)

        outputClosure(output)
    }
}
