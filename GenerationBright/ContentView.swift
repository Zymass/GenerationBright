//
//  ContentView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isPositivePromtViewPresented: Bool = false
    @State var isNegativePromtViewPresented: Bool = false
    @State var isChooseModelPresented: Bool = false
    @State var isImagePresented: Bool = false
    var screenHeight = UIScreen.main.bounds.height
    let viewModel = GenerationViewModel()

    var body: some View {
        ZStack() {
            VStack {
                MainCreateImageView()
                    .onTapGesture {
                        withAnimation {
                            print("Image pressed")
                        }
                    }
                ZStack(alignment: .bottom) {
                    ChooseModelView()
                        .frame(height: isChooseModelPresented ? 800 : screenHeight / 2)
                        .padding(.top, -50)
                        .onTapGesture {
                            withAnimation {
                                isChooseModelPresented.toggle()
                                isPositivePromtViewPresented = false
                                isNegativePromtViewPresented = false
                            }

                        }
                    NegativePromtView()
                        .frame(height: isNegativePromtViewPresented ? 800 : screenHeight / 2 - 70, alignment: .bottom)
                        .padding(.top, -50)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isNegativePromtViewPresented.toggle()
                                isPositivePromtViewPresented = false
                                isChooseModelPresented = isNegativePromtViewPresented
                            }
                        }
                    PositivePromtView(viewModel: viewModel)
                        .frame(height: isPositivePromtViewPresented ? 800 : screenHeight / 2 - 140)
                        .padding(.top, -50)
                        .onTapGesture {
                            withAnimation {
                                isPositivePromtViewPresented.toggle()
                                isNegativePromtViewPresented = false
                                isChooseModelPresented = isPositivePromtViewPresented
                            }
                        }
                }
                .padding(.bottom, -30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
