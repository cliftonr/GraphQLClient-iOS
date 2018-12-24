import Foundation

internal protocol GQLServiceModel {

    var id: String { get }
    var creationDate: Date { get }
    var modificationDate: Date { get }
    var isDeleted: Bool { get }
}
