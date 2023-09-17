//
//  ShareButton.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 12.09.2023.
//

import SwiftUI

struct ShareButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 55, height: 45)
                .cornerRadius(22)
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
