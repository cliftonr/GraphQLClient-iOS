import RxCocoa
import RxSwift

internal final class RStudySetImpl: RServiceModelImpl {

    private let titleRelay: BehaviorRelay<String>
    private let descriptionRelay: BehaviorRelay<String?>
    private let creatorRelay: BehaviorRelay<RUserImpl>
    private let creator: RUserImpl

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLStudySet
        titleRelay = BehaviorRelay(value: model.title)
        descriptionRelay = BehaviorRelay(value: model.description)
        creator = modelCache.updateModel(model.creator)
        creatorRelay = BehaviorRelay(value: creator)
        super.init(model: model, modelCache: modelCache)
    }

    override func update(model: GQLServiceModel) {
        let model = model as! GQLStudySet
        super.update(model: model)
        titleRelay.accept(model.title)
        descriptionRelay.accept(model.description)
        updateCreator(model.creator)
    }

    private func updateCreator(_ creator: GQLUser) {
        self.creator.update(model: creator)
        creatorRelay.accept(self.creator)
    }
}

extension RStudySetImpl: RStudySet {

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
