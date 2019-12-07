//
//  SongsResponse.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

public class SongsResponse: NetworkResponse {
    public let httpURLResponse: HTTPURLResponse
    public let songs: [Song]

    public required init(data: Data?, httpURLResponse: HTTPURLResponse) throws {
        self.httpURLResponse = httpURLResponse

        guard let data = data else {
            throw NetworkError.badResponse
        }

        do {
            let data = try JSONDecoder().decode(ServerSuccessResponse.self, from: data)
            songs = data.results

        } catch {
            throw NetworkError.badResponse
        }
    }
}

private struct ServerSuccessResponse: Codable {
    let resultCount: Int
    let results: [Song]
}
