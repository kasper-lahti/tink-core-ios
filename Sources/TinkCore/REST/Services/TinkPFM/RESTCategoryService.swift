import Foundation

public final class RESTCategoryService: CategoryService {
    private let client: Client

    init(client: Client) {
        self.client = client
    }

    public init(tink: Tink) {
        self.client = tink.client
    }

    @discardableResult
    public func categories(
        completion: @escaping (Result<CategoryTree, Error>) -> Void
    ) -> Cancellable? {
        let request = RESTResourceRequest<[RESTCategory]>(path: "/api/v1/categories", method: .get, contentType: .json) { result in
            completion(result.map(CategoryTree.init))
        }
        //FIXME: urlComponents.queryItems = [URLQueryItem(name: "locale", value: locale?.identifier)]
        return client.performRequest(request)
    }
}
