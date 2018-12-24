import Foundation

internal protocol GQLStudyTerm: GQLServiceModel {

    var word: String { get }
    var definition: String { get }
    var parentSet: GQLStudySet { get }
}

