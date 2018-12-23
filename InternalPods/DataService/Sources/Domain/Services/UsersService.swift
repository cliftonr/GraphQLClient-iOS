import RxSwift

/// Service for querying users.
public protocol UsersService {

    func user(withUserId userId: Int) -> Observable<RUser>
}
