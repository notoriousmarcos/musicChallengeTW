//
//  NetworkClient.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation
import Combine

public protocol NetworkClient {
    func execute(request: NetworkRequest) throws -> AnyPublisher<NetworkResponse, Error>
}

public enum HTTPContentType: String {
    case json   = "application/json"
    case any    = "*/*"
}

public class HTTPClient: NetworkClient {

    public func execute(request: NetworkRequest) throws -> AnyPublisher<NetworkResponse, Error> {
        guard let urlRequest = request.urlRequest() else {
            throw NetworkError.badRequest
        }

        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { result -> NetworkResponse in
               guard let httpResponse = result.response as? HTTPURLResponse else {
                   throw NetworkError.badResponse
               }

               guard (200...299).contains(httpResponse.statusCode) else {
                   let err = NetworkError.error(fromStatusCode: httpResponse.statusCode, data: result.data)
                   throw err
               }

               return try request.responseType.init(data: result.data, httpURLResponse: httpResponse)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
