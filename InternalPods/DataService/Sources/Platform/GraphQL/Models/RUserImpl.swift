import RxCocoa
import RxSwift

internal final class RUserImpl: RServiceModelImpl {

    private let usernameRelay: BehaviorRelay<String>
    private let emailRelay: BehaviorRelay<String>

    required init(model: GQLServiceModel, modelCache: ModelCache) {
        let model = model as! GQLUser
        usernameRelay = BehaviorRelay(value: model.username)
        emailRelay = BehaviorRelay(value: model.email)
        super.init(model: model, modelCache: modelCache)
    }

    /// Update the model. Subclasses must call super.
    ///
    /// - Parameter model: The data with which to update the reactive properties.
    override func update(model: GQLServiceModel) {
        let model = model as! GQLUser
        super.update(model: model)
        usernameRelay.accept(model.username)
        emailRelay.accept(model.email)
    }
}

extension RUserImpl: RUser {

    var usernameObservable: Observable<String> {
        return usernameRelay.asObservable()
    }

    var emailObservable: Observable<String> {
        return emailRelay.asObservable()
    }
}
