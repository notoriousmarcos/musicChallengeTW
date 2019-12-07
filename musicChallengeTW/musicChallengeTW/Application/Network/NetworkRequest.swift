//
//  NetworkRequest.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

public let BASEURL = "https://us-central1-tw-exercicio-mobile.cloudfunctions.net"

public protocol NetworkRequest {
    var body: Data? { get }
    var headers: [String: String]? { get }
    var endpoint: NetworkEndpoint { get }
    var method: HTTPMethod { get }
    var pathExtension: String? { get }
    var queryItems: [URLQueryItem]? { get }
    var requiresActiveSession: Bool { get }
    var responseType: NetworkResponse.Type { get }
}

extension NetworkRequest {

    public var description: String {
        var desc = "\(type(of: self))<\(method.rawValue):\(endpoint.rawValue)/\(pathExtension ?? "")>"

        if let body = body {
            desc.append(contentsOf: "\n\(body.jsonString)")
        }
        return desc
    }

    public func urlRequest() -> URLRequest? {
        let urlString = "\(BASEURL)\(endpoint.rawValue)"

        guard var components = URLComponents(string: urlString) else {
            return nil
        }
        components.queryItems = queryItems

        guard var url = components.url else {
            return nil
        }

        if let pathExtension = pathExtension {
            url.appendPathComponent(pathExtension)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = body
        urlRequest.httpMethod = method.rawValue

        if let headers = headers {

            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        return urlRequest
    }
}
