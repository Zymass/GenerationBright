//
//  ContentView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 11.09.2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        TabView {
            TextToImageView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            ImageToImageView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            CreateStickerView()
                .tabItem {
                    Label("Sticker", systemImage: "square.and.pencil")
                }
        }
        .onAppear () {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
