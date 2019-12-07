//
//  SongsRequest.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

public struct SongsRequest: NetworkRequest {
    public let body: Data? = nil
    public let endpoint: NetworkEndpoint = .songs
    public let method: HTTPMethod = .get
    public let pathExtension: String? = nil
    public let requiresActiveSession = true
    public let responseType: NetworkResponse.Type = SongsResponse.self

    public var headers: [String: String]? {
        return ["Accept": HTTPContentType.json.rawValue,
                "Content-Type": HTTPContentType.json.rawValue]
    }

    public var queryItems: [URLQueryItem]? {
        var items: [URLQueryItem] = []

        items.append(URLQueryItem(name: "id", value: self.songs.joined(separator: ",")))
        return items
    }

    public let songs: [String]

    // MARK: - Initialization

    public init(songs: [String]) {
        self.songs = songs
    }
}
