import RxSwift

extension GraphQLService: UsersService {

    func user(withUserId userId: String) -> Observable<RUser> {
        return Observable.empty()
    }
}
