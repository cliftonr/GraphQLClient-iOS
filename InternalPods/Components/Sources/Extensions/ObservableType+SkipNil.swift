import RxSwift

extension ObservableType where E: OptionalType {

    /// Skip nil signals. Observable type effectively becomes non-optional.
    public func skipNil() -> Observable<E.WrappedType> {
        return flatMap { element -> Observable<E.WrappedType> in
            return element.asOptional.map(Observable.just) ?? .empty()
        }
    }
}
