//
//  Songs.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

public struct Song: Codable, Identifiable {
    public let id: Int

    public let primaryGenreName: String
    public let artistName: String
    public let wrapperType: WrapperType
    public let artistType: String?
    public let trackExplicitness: String?
    public let trackCensoredName: String?
    public let collectionID: Int?
    public let trackName: String?
    public let country: String?
    public let artworkUrl: String?
    public let releaseDate: String?
    public let artistID, trackTimeMillis: Int?
    public let collectionName: String?

    enum CodingKeys: String, CodingKey {
        case primaryGenreName, artistName, id, wrapperType, artistType, trackExplicitness, trackCensoredName
        case collectionID
        case trackName, country
        case artworkUrl
        case releaseDate
        case artistID
        case trackTimeMillis, collectionName
    }
}

public enum WrapperType: String, Codable {
    case artist = "artist"
    case track = "track"
}

public typealias Songs = [Song]
