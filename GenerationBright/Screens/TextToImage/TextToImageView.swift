//
//  MainView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import SwiftUI

struct TextToImageView: View {
    
    @State var isPositivePromtViewPresented: Bool = false
    @State var isNegativePromtViewPresented: Bool = false
    @State var isChooseModelPresented: Bool = false
    @State var isImagePresented: Bool = false
    var screenHeight = UIScreen.main.bounds.height
    let viewModel = TextToImageViewModel()

    var body: some View {
        ZStack {
            VStack {
                CreatedImageView(viewModel: viewModel)
                    .onTapGesture {
                        print("Image pressed")
                    }
                    .frame(
                        height: isPositivePromtViewPresented ||
                        isNegativePromtViewPresented ||
                        isChooseModelPresented ? 0 : 400
                    )

                Spacer()

                Button {
                    viewModel.events.send(.tapMainButton)
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .padding()
                            .frame(height: 80)
                            .foregroundStyle(LinearGradient(colors: [.indigo, .purple], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .shadow(color: .black, radius: 5, x: 4, y: 4)

                        Text("GENERATE")
                            .foregroundColor(.white)
                            .fontWeight(.black)
                            .font(.title)
                    }
                }

                Spacer()

                ZStack(alignment: .bottom) {
                    ChooseModelView()
                        .frame(height: isChooseModelPresented ? screenHeight * 0.7 : 260)
                        .onTapGesture {
                            withAnimation {
                                isChooseModelPresented.toggle()
                                isPositivePromtViewPresented = false
                                isNegativePromtViewPresented = false
                            }
                        }
                    NegativePromtView(viewModel: viewModel, didStartEditing: {
                        guard !isNegativePromtViewPresented else { return }
                        withAnimation {
                            isNegativePromtViewPresented.toggle()
                            isPositivePromtViewPresented = false
                            isChooseModelPresented = isNegativePromtViewPresented
                        }
                    }, isPresented: $isNegativePromtViewPresented)
                        .frame(
                            height: isNegativePromtViewPresented ? screenHeight * 0.7 : 190,
                            alignment: .bottom
                        )
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isNegativePromtViewPresented.toggle()
                                isPositivePromtViewPresented = false
                                isChooseModelPresented = isNegativePromtViewPresented
                            }
                        }
                    PositivePromtView(viewModel: viewModel, didStartEditing: {
                        guard !isPositivePromtViewPresented else { return }
                        withAnimation {
                            isPositivePromtViewPresented.toggle()
                            isNegativePromtViewPresented = false
                            isChooseModelPresented = isPositivePromtViewPresented
                        }
                    }, isPresented: $isPositivePromtViewPresented)
                    .frame(height: isPositivePromtViewPresented ? screenHeight * 0.7 : 60)
                        .onTapGesture {
                            withAnimation {
                                isPositivePromtViewPresented.toggle()
                                isNegativePromtViewPresented = false
                                isChooseModelPresented = isPositivePromtViewPresented
                            }
                        }
                }
                .padding(.bottom, -60)
            }
        }
    }
}
