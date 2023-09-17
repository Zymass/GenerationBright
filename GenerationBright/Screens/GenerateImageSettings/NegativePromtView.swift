//
//  NegativePromtView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 12.09.2023.
//

import SwiftUI

struct NegativePromtView: View {
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
                Spacer()
            }
        }
    }
}

struct NegativePromtView_Previews: PreviewProvider {
    static var previews: some View {
        NegativePromtView()
    }
}
