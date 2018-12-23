import Apollo

final class APIClient {

    private let apollo: ApolloClient

    init(url: URL = URL(string: "http://localhost:4000/graphql")!, configuration: URLSessionConfiguration) {
        self.apollo = ApolloClient(
            networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
}
