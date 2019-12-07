//
//  NetworkError.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

public protocol TitledError: LocalizedError {
    var errorTitle: String { get }
}

public enum NetworkError: TitledError {
    case badRequest
    case badResponse
    case forbidden
    case internalServerError
    case internetNotReachable
    case methodNotAllowed
    case serverError(statusCode: Int, errorCodes: [String], messages: [String])
    case requestTimeout
    case resourceNotFound
    case unauthorized
    case unknown

    public var errorTitle: String {
        return "alerts.error.title".localized
    }

    public var errorDescription: String? {
        switch self {
        case .internetNotReachable: return "network.error.noNetworkConnection".localized
        case .unauthorized, .resourceNotFound: return "network.error.loginAuthentication".localized
        default: return "network.error.timeout".localized
        }
    }
}

extension NetworkError {

    public static func error(fromStatusCode statusCode: Int, data: Data?) -> NetworkError {

        // Determine error from status code
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .resourceNotFound
        case 405: return .methodNotAllowed
        case 408: return .requestTimeout
        case 500: return .internalServerError
        default:  return .serverError(statusCode: statusCode, errorCodes: [], messages: [])
        }
    }
}
