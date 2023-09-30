//
//  MainCreateImageView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 12.09.2023.
//

import SwiftUI

struct MainCreateImageView: View {

    @ObservedObject var viewModel: GenerationViewModel

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: viewModel.textToImageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                    .padding()
                    .shadow(color: .black, radius: 20, x: 10, y: 10)
            } placeholder: {
                Image("image")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                    .padding()
                    .shadow(color: .black, radius: 20, x: 10, y: 10)
            }
        }
    }
}
