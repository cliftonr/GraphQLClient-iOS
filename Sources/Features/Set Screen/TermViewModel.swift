import Components
import DataService
import RxSwift

struct TermViewModel {

    private let term: RStudyTerm

    init(term: RStudyTerm) {
        self.term = term
    }
}

extension TermViewModel: ViewModel {

    typealias Input = ViewModelInputNone

    struct Output {
        let wordText: Observable<String>
        let definitionText: Observable<String>
    }

    func connect(
        input inputClosure: () -> TermViewModel.Input,
        output outputClosure: (TermViewModel.Output) -> Void)
    {
        let wordText = term
            .wordObservable
            .skipNil()

        let definitionText = term
            .definitionObservable
            .skipNil()

        let output = Output(
            wordText: wordText,
            definitionText: definitionText)

        outputClosure(output)
    }
}
