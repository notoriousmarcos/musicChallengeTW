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
    @ObservedObject var viewModel: ShuffleSongsViewModel = ShuffleSongsViewModel()

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
            .navigationBarTitle(Text("Shuffle Songs"))
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
                return Alert(title: Text("Important message"), message: Text(error.localizedDescription), dismissButton: .default(Text("Got it!")))
            }
            return Alert(title: Text("Important message"), message: Text("geneticError"), dismissButton: .default(Text("Got it!")))
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
