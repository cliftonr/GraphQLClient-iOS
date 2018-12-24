import Apollo
import RxSwift
import CoreData

internal class GraphQLService {

    internal let apolloClient: ApolloClient
    internal let modelCache = ModelCache()

    /// Initialize a GraphQL service with an Apollo client.
    ///
    /// - Parameter apolloClient: The client which handles all GraphQL related queries, mutations and caching.
    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }
}
