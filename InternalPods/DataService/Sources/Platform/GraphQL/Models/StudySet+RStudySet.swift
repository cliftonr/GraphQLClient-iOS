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

    var creator: GQLUser {
        return creatorUser
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

    var creator: GQLUser {
        return creatorUser
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
}

extension StudySetDetailsQuery.Data.StudySet.Term: GQLStudyTerm {

    var parentSet: GQLStudySet {
        return containingSet
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
}

extension StudySetDetailsQuery.Data.StudySet.Term.ContainingSet: GQLStudySet {

    var creator: GQLUser {
        return creatorUser
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
}

extension StudySetDetailsQuery.Data.StudySet.Term.ContainingSet.CreatorUser: GQLUser {

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
