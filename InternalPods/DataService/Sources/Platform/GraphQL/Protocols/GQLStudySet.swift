import Foundation

internal protocol GQLStudySet: GQLServiceModel {

    var title: String { get }
    var description: String? { get }
    var creator: GQLUser { get }
    var terms: [GQLStudyTerm]? { get }
}
