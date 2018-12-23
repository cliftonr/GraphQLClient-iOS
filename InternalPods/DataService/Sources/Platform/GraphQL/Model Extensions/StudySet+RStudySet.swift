import RxSwift
import RxCocoa

//extension QLSet: RSet {
//
//    public var creatorObservable: Observable<RUser?> {
//        return rx.observe(RUser.self, #keyPath(QLSet.creator), retainSelf: false)
//    }
//
//    public var titleObservable: Observable<String?> {
//        return rx.observe(String.self, #keyPath(QLSet.title), retainSelf: false)
//    }
//
//    public var numberOfTermsObservable: Observable<Int?> {
//        return rx.observe(NSNumber.self, #keyPath(QLSet.numTerms), retainSelf: false)
//            .map { $0?.intValue }
//    }
//}
