import RxSwift

extension GraphQLService: UsersService {

    func user(withUserId userId: Int) -> Observable<RUser> {
        return Observable.empty()
    }
}
