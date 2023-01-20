import Foundation

class NetworkCore {
    
    let configuration: NetworkCoreConfiguration
    
    init(configuration: NetworkCoreConfiguration) {
        self.configuration = configuration
    }
    
    func request(for endpoint: NetworkCoreEndpoint) async -> NetworkCoreResponse {
        if endpoint.shouldMock, let mockResponse = endpoint.mockResponse {
            NetworkCoreLogger.log(endpoint, mockResponse, configuration.logType)
            return mockResponse
        }
        
        guard let request = endpoint.createRequest() else {
            let errorResponse = NetworkCoreResponse.internalError
            NetworkCoreLogger.log(endpoint, errorResponse, configuration.logType)
            return errorResponse
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: request as URLRequest)
            return await handleResponse(endpoint, data, response)
        }
        catch {
            let errorResponse = NetworkCoreResponse.internalError
            NetworkCoreLogger.log(endpoint, errorResponse, configuration.logType)
            return errorResponse
        }
    }
}

extension NetworkCore {
    func handleResponse(_ endpoint: NetworkCoreEndpoint, _ data: Data?, _ response: URLResponse) async -> NetworkCoreResponse {
        guard let httpResponse = response as? HTTPURLResponse else {
            let errorResponse = NetworkCoreResponse.internalError
            NetworkCoreLogger.log(endpoint, errorResponse, configuration.logType)
            return errorResponse
        }
        let response = NetworkCoreResponse(statusCode: httpResponse.statusCode,
                                           data: data ?? Data(),
                                           headers: httpResponse.allHeaderFields,
                                           handler: NetworkCoreHandler(statusCode: httpResponse.statusCode))
        NetworkCoreLogger.log(endpoint, response, configuration.logType)
        return response
    }
}
