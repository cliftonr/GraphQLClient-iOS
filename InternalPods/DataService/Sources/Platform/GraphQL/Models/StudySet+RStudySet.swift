import RxSwift
import RxCocoa

extension StudySetsByCreatorQuery.Data.StudySet.CreatorUser: GQLUser {

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }
}

extension StudySetsByCreatorQuery.Data.StudySet: GQLStudySet {

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }

    var creator: GQLUser {
        return creatorUser
    }

    var terms: [GQLStudyTerm]? {
        return nil
    }
}

extension StudySetDetailsQuery.Data.StudySet.CreatorUser: GQLUser {

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }
}

extension StudySetDetailsQuery.Data.StudySet: GQLStudySet {

    var terms: [GQLStudyTerm]? {
        return associatedTerms
    }

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }

    var creator: GQLUser {
        return creatorUser
    }
}

extension StudySetDetailsQuery.Data.StudySet.AssociatedTerm: GQLStudyTerm {

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }

    var parentSet: GQLStudySet {
        return containingSet
    }
}

extension StudySetDetailsQuery.Data.StudySet.AssociatedTerm.ContainingSet: GQLStudySet {

    var terms: [GQLStudyTerm]? {
        return nil
    }

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }

    var creator: GQLUser {
        return creatorUser
    }
}

extension StudySetDetailsQuery.Data.StudySet.AssociatedTerm.ContainingSet.CreatorUser: GQLUser {

    var id: String {
        return fragments.baseModelFields.id
    }

    var creationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.created)!)
    }

    var modificationDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(fragments.baseModelFields.changed)!)
    }

    var isDeleted: Bool {
        return fragments.baseModelFields.isDeleted
    }
}
