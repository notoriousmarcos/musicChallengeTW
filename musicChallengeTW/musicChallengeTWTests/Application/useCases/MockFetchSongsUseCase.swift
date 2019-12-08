//
//  MockFetchSongsUseCase.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 08/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Combine
@testable import musicChallengeTW

class MockFetchSongsUseCase: FetchSongsUseCaseProtocol {
    @Published var songs: Songs = [Song(id: 1, primaryGenreName: "Genre", artistName: "ArtistName", wrapperType: .track, artistType: "ArtistType", trackExplicitness: "trackExplicitness", trackCensoredName: "sensored", collectionID: 1, trackName: "name", country: "Country", artworkUrl: "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fdecimais-mcs-esquerdista-de-direita.png?alt=media&token=ee330b39-ea99-4c6f-bb62-3229879b0ab4", releaseDate: "Date", artistID: 1, trackTimeMillis: 32131, collectionName: "Eita")]
    public var isSucces: Bool = false
    public var isThrow: Bool = false

    func execute(songs: [String], result: @escaping (Result<[Song], Error>) -> Void) throws -> AnyCancellable {
        if isThrow {
            throw NetworkError.badRequest
        }
        return $songs.sink { songs in
            if self.isSucces {
                result(.success(songs))
            } else {
                result(.failure(NetworkError.badResponse))
            }
        }
    }
}
