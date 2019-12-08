//
//  ShuffleSongCellViewModel.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 07/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation
import Combine

public class ShuffleSongCellViewModel: ObservableObject {
    @Published var song: Song
    @Published var imageData: Data?

    func loadImage() {
        guard let url = URL(string: song.artworkUrl ?? "") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageData = data
            }
        }
        task.resume()
    }

    public init(song: Song) {
        self.song = song
    }
}
