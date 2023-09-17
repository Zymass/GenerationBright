//
//  PositivePromtView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 11.09.2023.
//

import SwiftUI
import Combine

struct PositivePromtView: View {

    @ObservedObject private var viewModel: GenerationViewModel
    private var cancellables = Set<AnyCancellable>()
    private var didStartEditing: (() -> Void)?
    @Binding private var isPresented: Bool
    @State private var promts: [Promt] = []

    init(
        viewModel: GenerationViewModel,
        didStartEditing: (() -> Void)? = nil,
        isPresented: Binding<Bool>
    ) {
        self.viewModel = viewModel
        self.didStartEditing = didStartEditing
        _isPresented = isPresented
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
                PromtField(promts: $viewModel.positivePromts, isPresented: $isPresented, didStartEditing: didStartEditing)
                .padding()
                Spacer()
            }
        }
    }
}
