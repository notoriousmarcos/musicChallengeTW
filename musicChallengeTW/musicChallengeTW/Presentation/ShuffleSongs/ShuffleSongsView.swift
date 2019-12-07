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
            List {
                ForEach(viewModel.songs) { _ in
                    Text("Vaai")
                }
            }
            .navigationBarTitle(Text("Shuffle Songs"))
            .navigationBarItems(trailing: Button(action: {
                    self.viewModel.shuffle()
                }, label: {
                    Image("shuffle")
                })
            )
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
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
