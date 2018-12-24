import RxSwift

/// Service for querying users.
public protocol UsersService {

    func user(withUserId userId: String) -> Observable<RUser>
}
