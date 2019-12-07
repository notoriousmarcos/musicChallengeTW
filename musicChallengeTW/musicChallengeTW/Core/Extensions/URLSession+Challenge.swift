//
//  URLSession+Challenge.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with url: URLRequest, result: @escaping (Result<(HTTPURLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
        if let error = error {
            return result(.failure(error))
        }

        guard let httpResponse = response as? HTTPURLResponse, let data = data else {
            return result(.failure(NetworkError.badResponse))
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let err = NetworkError.error(fromStatusCode: httpResponse.statusCode, data: data)
            return result(.failure(err))
        }

        result(.success((httpResponse, data)))
    }
}
}
