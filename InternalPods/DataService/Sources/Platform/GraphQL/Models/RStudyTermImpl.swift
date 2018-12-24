import RxCocoa
import RxSwift

internal class RStudyTermImpl: RServiceModelImpl {

    private let wordRelay: BehaviorRelay<String>
    private let definitionRelay: BehaviorRelay<String>
    private let parentSetRelay: BehaviorRelay<RStudySetImpl>

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLStudyTerm
        wordRelay = BehaviorRelay(value: model.word)
        definitionRelay = BehaviorRelay(value: model.definition)
        parentSetRelay = BehaviorRelay(value: modelCache.updateModel(model.parentSet))
        super.init(model: model, modelCache: modelCache)
    }

    override func update(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLStudyTerm
        super.update(model: model, modelCache: modelCache)
        wordRelay.accept(model.word)
        definitionRelay.accept(model.definition)
        parentSetRelay.accept(modelCache.updateModel(model.parentSet))
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
