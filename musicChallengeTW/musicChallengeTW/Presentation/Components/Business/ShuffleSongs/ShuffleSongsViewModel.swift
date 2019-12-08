//
//  ShuffleSongsViewModel.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 07/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import Foundation
import Combine

public class ShuffleSongsViewModel: ObservableObject {

    @Published var songs: Songs = [Song]()
    @Published var isLoading: Bool = true
    @Published var showAlert: Bool = false
    @Published var error: Error?

    func shuffle() {
        self.songs = self.songs.shuffled()
    }

    func load() {
        self.isLoading = true
        do {
            try FetchSongsUseCase().execute(songs: ["909253", "1171421960", "358714030", "1419227", "264111789"], result: { result in
                switch result {
                case .success(let songs):
                    self.songs = songs
                    self.isLoading = false
                case .failure(let error):
                    self.showAlert = true
                    self.error = error
                }
                self.isLoading = false
            })
        } catch {
            self.showAlert = true
            self.error = error
            self.isLoading = false
        }
    }
}
