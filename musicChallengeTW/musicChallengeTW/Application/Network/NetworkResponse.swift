//
//  NetworkResponse.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

public protocol NetworkResponse {
    var httpURLResponse: HTTPURLResponse { get }
    init(data: Data?, httpURLResponse: HTTPURLResponse) throws
}
