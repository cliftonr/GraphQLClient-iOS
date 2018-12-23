import Apollo

/// Factory for all GraphQL-backed services.
public struct GraphQLServiceFactory: ServiceFactory {

    private let apolloClient: ApolloClient

    public init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }

    public func createStudySetsService() -> StudySetsService {
        return GraphQLService(apolloClient: apolloClient)
    }

    public func createStudyTermsService() -> StudyTermsService {
        return GraphQLService(apolloClient: apolloClient)
    }

    public func createUsersService() -> UsersService {
        return GraphQLService(apolloClient: apolloClient)
    }
}
