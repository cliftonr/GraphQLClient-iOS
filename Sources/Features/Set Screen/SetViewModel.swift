import Components
import DataService
import RxSwift
import RxCocoa

final class SetViewModel {

    private let setId: String
    private let setsService: StudySetsService

    init(setId: String, setsService: StudySetsService) {
        self.setId = setId
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

        let terms = set
            .asObservable()
            .flatMap { $0.terms }
            .skipNil()

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
