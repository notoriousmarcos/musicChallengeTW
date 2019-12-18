//
//  FetchSongsUseCase.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation
import Combine

public protocol FetchSongsUseCaseProtocol {
    func execute(songs: [String], result: @escaping (Result<[Song], Error>) -> Void) throws -> AnyCancellable
}

public class FetchSongsUseCase: FetchSongsUseCaseProtocol {
    let networkClient: NetworkClient = HTTPClient(session: URLSession.shared)

    // MARK: - Initialization
    public init() {
    }

    // MARK: - Public methods
    public func execute(songs: [String], result: @escaping (Result<[Song], Error>) -> Void) throws -> AnyCancellable {
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
                result(.success(songs.filter { song -> Bool in
                    return song.wrapperType == .track
                }))
            })
    }
}
