import RxCocoa
import RxSwift

internal class RServiceModelImpl: CachableType {

    fileprivate let idRelay: BehaviorRelay<String>
    fileprivate let creationDateRelay: BehaviorRelay<Date>
    fileprivate let modificationDateRelay: BehaviorRelay<Date>
    fileprivate let isDeletedRelay: BehaviorRelay<Bool>

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        idRelay = BehaviorRelay(value: model.id)
        creationDateRelay = BehaviorRelay(value: model.creationDate)
        modificationDateRelay = BehaviorRelay(value: model.modificationDate)
        isDeletedRelay = BehaviorRelay(value: model.isDeleted)
    }

    /// Update the model. Subclasses must call super.
    ///
    /// - Parameter model: The data with which to update the reactive properties.
    open func update(model: GQLServiceModel) {
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
