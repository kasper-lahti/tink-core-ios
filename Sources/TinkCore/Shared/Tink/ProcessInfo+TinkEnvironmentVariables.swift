import Foundation

extension ProcessInfo {
    var tinkClientID: String? {
        return environment["TINK_CLIENT_ID"]
    }

    var tinkRedirectURI: URL? {
        return environment["TINK_REDIRECT_URI"].flatMap(URL.init(string:))
    }

    var tinkEnvironment: Environment? {
        guard let restEndpoint = environment["TINK_CUSTOM_REST_ENDPOINT"].flatMap(URL.init(string:)) else { return nil }
        return Environment.custom(restURL: restEndpoint)
    }

    var tinkRestCertificateURL: URL? {
        return environment["TINK_REST_CERTIFICATE_URL"].flatMap(URL.init(string:))
    }

    var tinkMarket: Market? {
        return environment["TINK_MARKET_CODE"].flatMap(Market.init(code:))
    }
}
