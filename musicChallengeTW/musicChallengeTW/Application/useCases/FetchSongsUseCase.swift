//
//  FetchSongsUseCase.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation
import Combine

public class FetchSongsUseCase {
    let networkClient: NetworkClient = HTTPClient()

    // MARK: - Initialization
    public init() {
    }

    // MARK: - Public methods
    @discardableResult public func execute(songs: [String], result: @escaping (Result<[Song], Error>) -> Void) throws -> AnyCancellable {
        let request = SongsRequest(songs: songs)
        return try networkClient.execute(request: request)
            .tryMap({ response -> [Song] in
                guard let response = response as? SongsResponse else {
                    throw NetworkError.badResponse
                }
                return response.songs
            }).sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error): result(.failure(error))
                }
            }, receiveValue: { songs in
                result(.success(songs))
            })
    }
}
