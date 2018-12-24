import Foundation

internal protocol GQLUser: GQLServiceModel {

    var username: String { get }
    var email: String { get }
}
