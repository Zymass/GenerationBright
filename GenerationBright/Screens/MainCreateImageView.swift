//
//  MainCreateImageView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 12.09.2023.
//

import SwiftUI

struct MainCreateImageView: View {
    var body: some View {
        ZStack {
            Image("image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(
                    width: .infinity,
                    height: UIScreen.main.bounds.height / 2,
                    alignment: .top
                )
        }
    }
}

struct MainCreateImageView_Previews: PreviewProvider {
    static var previews: some View {
        MainCreateImageView()
    }
}
