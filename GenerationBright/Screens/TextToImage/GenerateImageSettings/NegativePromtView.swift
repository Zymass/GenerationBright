//
//  NegativePromtView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 12.09.2023.
//

import SwiftUI

struct NegativePromtView: View {

    // MARK: - Private Properties

    @ObservedObject private var viewModel: TextToImageViewModel
    @Binding private var isPresented: Bool
    @State private var promts: [Promt] = []
    private var didStartEditing: (() -> Void)?

    // MARK: - Init

    init(
        viewModel: TextToImageViewModel,
        didStartEditing: (() -> Void)? = nil,
        isPresented: Binding<Bool>
    ) {
        self.viewModel = viewModel
        self.didStartEditing = didStartEditing
        _isPresented = isPresented
    }

    // MARK: - Body
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "#BCA79C"))
                .cornerRadius(30)
            VStack {
                HStack {
                    Text("Negative Promt")
                    .foregroundColor(.white)
                    .frame(alignment: .topLeading)
                    .padding()
                    .font(.title)
                    .fontWeight(.black)

                    Spacer()

                    Image(systemName: "minus.diamond")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .opacity(0.6)
                }
                PromtField(promts: $viewModel.negativePromts, isPresented: $isPresented, didStartEditing: didStartEditing)
                .padding()
                .opacity(isPresented ? 1 : 0)
                Spacer()
            }
        }
    }
}
