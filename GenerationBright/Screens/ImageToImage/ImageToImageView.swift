//
//  ImageToImageView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import SwiftUI
import PhotosUI

struct ImageToImageView: View {

    @StateObject var photosModel = ImageToImageViewModel()
    @State var isPositivePromtViewPresented: Bool = false
    let viewModel = TextToImageViewModel()
    var body: some View {
        VStack {
//            PhotosPicker(selection: $photosModel.selectedPhoto, matching: .any(of: [.images]),photoLibrary: .shared()) {
//                Image(systemName: "photo.fill")
//                    .font(.callout)
//            }

            PositivePromtView(viewModel: viewModel, didStartEditing: {
                print("123")
            }, isPresented: $isPositivePromtViewPresented)
        }
        .onAppear {
            isPositivePromtViewPresented = true
        }
    }
}

#Preview {
    ImageToImageView()
}
