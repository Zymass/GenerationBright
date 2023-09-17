//
//  ChooseModelView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 12.09.2023.
//

import SwiftUI

struct ChooseModelView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "#836D8D"))
                .cornerRadius(30)
            VStack {
                HStack {
                    Text("Choose Model")
                    .foregroundColor(.white)
                    .frame(alignment: .topLeading)
                    .padding()
                    .font(.title)
                    .fontWeight(.black)

                    Spacer()

                    Image(systemName: "diamond.lefthalf.filled")
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

struct ChooseModelView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseModelView()
    }
}
