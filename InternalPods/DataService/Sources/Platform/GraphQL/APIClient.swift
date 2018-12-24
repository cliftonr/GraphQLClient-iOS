import Apollo

public final class APIClient {

    internal let apollo: ApolloClient

    public init(url: URL = URL(string: "http://127.0.0.1:4000/graphql")!,
         configuration: URLSessionConfiguration = .default)
    {
        self.apollo = ApolloClient(
            networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
}
