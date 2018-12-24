import RxCocoa
import RxSwift

internal class RStudyTermImpl: RServiceModelImpl {

    private let wordRelay: BehaviorRelay<String>
    private let definitionRelay: BehaviorRelay<String>
    private let parentSetRelay: BehaviorRelay<RStudySet>
    private let parentSet: RStudySetImpl

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLStudyTerm
        wordRelay = BehaviorRelay(value: model.word)
        definitionRelay = BehaviorRelay(value: model.definition)
        parentSet = modelCache.updateModel(model.parentSet)
        parentSetRelay = BehaviorRelay(value: parentSet)
        super.init(model: model, modelCache: modelCache)
    }

    override func update(model: GQLServiceModel) {
        let model = model as! GQLStudyTerm
        super.update(model: model)
        wordRelay.accept(model.word)
        definitionRelay.accept(model.definition)
    }
}

extension RStudyTermImpl: RStudyTerm {

    var wordObservable: Observable<String> {
        return wordRelay.asObservable()
    }

    var definitionObservable: Observable<String> {
        return definitionRelay.asObservable()
    }

    var parentSetObservable: Observable<RStudySet> {
        return parentSetRelay.asObservable()
            .flatMap(Observable<RStudySet>.just)
    }
}
