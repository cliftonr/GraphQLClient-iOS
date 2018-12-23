/// A conforming type shall produce services for interacting with the web API.
public protocol ServiceFactory {

    func createStudySetsService() -> StudySetsService
    func createStudyTermsService() -> StudyTermsService
    func createUsersService() -> UsersService
}
