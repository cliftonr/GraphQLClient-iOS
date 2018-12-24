import Apollo
import RxSwift
import CoreData

protocol CachableType {

    static var cacheKey: String { get }
}

extension CachableType {

    static var cacheKey: String {
        return String(describing: self)
    }
}

final class ModelCache {

    private typealias ClassType = String
    private typealias IdType = String

    private var modelsByClass = [ClassType: [IdType: RServiceModelImpl]]()

    func updateModel<ModelType: RServiceModelImpl>(_ model: GQLServiceModel) -> ModelType {
        let key = ModelType.cacheKey
        var modelsById = modelsByClass[key] ?? [IdType: ModelType]()
        let model: ModelType = {
            if let existingModel = modelsById[model.id] {
                existingModel.update(model: model)
                return existingModel as! ModelType
            } else {
                let newModel = ModelType(model: model, modelCache: self)
                modelsById[model.id] = newModel
                return newModel
            }
        }()
        modelsByClass[key] = modelsById
        return model
    }

    func updateModels<ModelType: RServiceModelImpl>(_ models: [GQLServiceModel]) -> [ModelType] {
        return models.map(self.updateModel)
    }
}
