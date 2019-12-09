//
//  ShuffleSongsView.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 05/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import SwiftUI
import Combine

struct ShuffleSongsView: View {
    @ObservedObject var viewModel: ShuffleSongsViewModel = ShuffleSongsViewModel(useCase: FetchSongsUseCase())

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: $viewModel.isLoading, style: .large)
                } else {
                    List {
                        ForEach(viewModel.songs) { song in
                            ShuffleSongCellView(viewModel: ShuffleSongCellViewModel(song: song))
                        }
                        .listRowBackground(Color.white)
                    }
                }
            }
            .navigationBarTitle(Text("shuffle.songs.navbar.title".localized))
            .navigationBarItems(trailing: Button(action: {
                    self.viewModel.shuffle()
                }, label: {
                    Image("shuffle")
                        .foregroundColor(Color.main)
                })
            )

        }
        .alert(isPresented: $viewModel.showAlert) {
            if let error = viewModel.error {
                return Alert(title: Text("alert.default.title".localized), message: Text(error.localizedDescription), dismissButton: .default(Text("alert.default.confirm.message".localized)))
            }
            return Alert(title: Text("alert.default.title".localized), message: Text("alert.default.message".localized), dismissButton: .default(Text("alert.default.confirm.message".localized)))
        }
        .onAppear {
            self.viewModel.load()
        }
    }
}

struct ShuffleSongsView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleSongsView()
    }
}
