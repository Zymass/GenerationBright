//
//  PositivePromtView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 11.09.2023.
//

import SwiftUI
import Combine

struct PositivePromtView: View {

    private let viewModel: GenerationViewModelProtocol
    private var cancellables = Set<AnyCancellable>()
    @State var positivePromts = [PromtCollectionItem]()
    @State private var tags: [Tag] = []

    init(viewModel: GenerationViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Rectangle()
            .foregroundColor(Color(hex: "#F4B592"))
            .cornerRadius(30)
            VStack {
                HStack {
                    Text("Positive Promt")
                    .foregroundColor(.white)
                    .frame(alignment: .topLeading)
                    .padding()
                    .font(.title)
                    .fontWeight(.black)

                    Spacer()

                    Image(systemName: "plus.diamond")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .opacity(0.6)
                }
                TagField(tags: $tags)
                .padding()
                Spacer()
            }
        }
        .onReceive(viewModel.positivePromts) { _ in
            withAnimation {
                positivePromts = viewModel.positivePromts.value
            }
        }
    }
}

struct PromtView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = GenerationViewModel()
        PositivePromtView(viewModel: viewModel)
    }
}
