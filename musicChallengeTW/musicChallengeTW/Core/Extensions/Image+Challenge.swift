//
//  Image+Challenge.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 07/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import SwiftUI

extension Image {
    public static func imageFromData(_ data: Data?) -> Image {
        guard let data = data else {
            return Image(uiImage: UIImage())
        }
        return Image(uiImage: UIImage(data: data) ?? UIImage())
    }
}
