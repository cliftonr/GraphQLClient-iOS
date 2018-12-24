import RxCocoa
import RxSwift

internal class RServiceModelImpl: CachableType {

    private let idRelay: BehaviorRelay<String>
    private let creationDateRelay: BehaviorRelay<Date>
    private let modificationDateRelay: BehaviorRelay<Date>
    private let isDeletedRelay: BehaviorRelay<Bool>

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        idRelay = BehaviorRelay(value: model.id)
        creationDateRelay = BehaviorRelay(value: model.creationDate)
        modificationDateRelay = BehaviorRelay(value: model.modificationDate)
        isDeletedRelay = BehaviorRelay(value: model.isDeleted)
    }

    /// Update the model. Subclasses must call super.
    ///
    /// - Parameters:
    ///   - model: The data with which to update the reactive properties.
    ///   - modelCache: The in-memory cache where models are stored.
    open func update(model: GQLServiceModel, modelCache: ModelCache) {
        idRelay.accept(model.id)
        creationDateRelay.accept(model.creationDate)
        modificationDateRelay.accept(model.modificationDate)
        isDeletedRelay.accept(model.isDeleted)
    }
}

extension RServiceModelImpl: RServiceModel {

    var id: Observable<String> {
        return idRelay.asObservable()
    }

    var creationDate: Observable<Date> {
        return creationDateRelay.asObservable()
    }

    var modificationDate: Observable<Date> {
        return modificationDateRelay.asObservable()
    }

    var isDeleted: Observable<Bool> {
        return isDeletedRelay.asObservable()
    }
}
