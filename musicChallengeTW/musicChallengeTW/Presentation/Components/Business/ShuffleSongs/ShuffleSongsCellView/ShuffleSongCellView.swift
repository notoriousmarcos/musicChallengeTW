//
//  ShuffleSongsCellView.swift
//  musicChallengeTW
//
//  Created by Marcos Vinicius da Cunha Brito on 07/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import SwiftUI

struct ShuffleSongCellView: View {
    @ObservedObject var viewModel: ShuffleSongCellViewModel

    func getImage() -> Image {
        if let imageData = viewModel.imageData {
            return Image.imageFromData(imageData)

        } else {
            return Image(uiImage: UIImage())
        }
    }

    var body: some View {
        HStack(alignment: .center) {
            Image.imageFromData(viewModel.imageData)
                .resizable()
                .frame(width: 60.0, height: 60.0)
                .cornerRadius(5)
                .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                .scaledToFit()
                .accessibilityElement()

            Spacer().frame(width: 12.0)

            VStack(alignment: .leading, spacing: 8) {
                Text("\(viewModel.song.trackName ?? "")")
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.trackName)
                Text("\(viewModel.song.artistName) (\(viewModel.song.primaryGenreName))")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.main)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white)
        .onAppear {
            self.viewModel.loadImage()
        }
    }
}

struct ShuffleSongCellView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleSongCellView(viewModel: ShuffleSongCellViewModel(song: Song(id: 1, primaryGenreName: "Genre", artistName: "ArtistName", wrapperType: .track, artistType: "ArtistType", trackExplicitness: "trackExplicitness", trackCensoredName: "sensored", collectionID: 1, trackName: "name", country: "Country", artworkUrl: "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fdecimais-mcs-esquerdista-de-direita.png?alt=media&token=ee330b39-ea99-4c6f-bb62-3229879b0ab4", releaseDate: "Date", artistID: 1, trackTimeMillis: 32131, collectionName: "Eita")))
    }
}
