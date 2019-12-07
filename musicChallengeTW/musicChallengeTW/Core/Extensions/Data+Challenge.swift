//
//  Data+Challenge.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation

extension Data {
    public var jsonString: String {
        let fallbackStr = String(data: self, encoding: .utf8) ?? ""

        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []) else {
            return fallbackStr
        }

        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]) else {
            return fallbackStr
        }
        return String(data: jsonData, encoding: .utf8) ?? fallbackStr
    }
}
