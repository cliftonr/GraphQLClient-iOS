import RxCocoa
import RxSwift

internal final class RStudySetImpl: RServiceModelImpl {

    private let titleRelay: BehaviorRelay<String>
    private let descriptionRelay: BehaviorRelay<String?>
    private let creatorRelay: BehaviorRelay<RUserImpl>
    private let studyTermsRelay: BehaviorRelay<[RStudyTermImpl]?>

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLStudySet
        titleRelay = BehaviorRelay(value: model.title)
        descriptionRelay = BehaviorRelay(value: model.description)
        creatorRelay = BehaviorRelay(value: modelCache.updateModel(model.creator))
        studyTermsRelay = BehaviorRelay(value: modelCache.updateModels(model.terms))
        super.init(model: model, modelCache: modelCache)
    }

    override func update(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLStudySet
        super.update(model: model, modelCache: modelCache)
        titleRelay.accept(model.title)
        descriptionRelay.accept(model.description)
        creatorRelay.accept(modelCache.updateModel(model.creator))
        studyTermsRelay.accept(modelCache.updateModels(model.terms))
    }
}

extension RStudySetImpl: RStudySet {

    var terms: Observable<[RStudyTerm]?> {
        return studyTermsRelay.asObservable()
            .flatMap(Observable<[RStudyTerm]?>.just)
    }

    var titleObservable: Observable<String> {
        return titleRelay.asObservable()
    }

    var descriptionObservable: Observable<String?> {
        return descriptionRelay.asObservable()
    }

    var creatorObservable: Observable<RUser> {
        return creatorRelay.asObservable()
            .flatMap(Observable<RUser>.just)
    }
}
