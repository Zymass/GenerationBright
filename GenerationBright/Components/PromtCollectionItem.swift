//
//  PromtCollectionItem.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 13.09.2023.
//

import SwiftUI
import Combine

struct PromtCollectionItem: View {

    var id: String
    var buttonAction: (String) -> Void

    var body: some View {
        HStack {
            Text(id)
                .foregroundColor(.white)
                .lineLimit(1)
                .font(.headline)
                .padding(.init(top: 12, leading: 20, bottom: 12, trailing: 50))
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(Color(hex: "#836D8D")))

            Button {
                buttonAction(id)
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .opacity(0.4)
            }
            .padding(.leading, -50)
        }
    }
}

extension PromtCollectionItem: Identifiable, Hashable {

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    public static func == (lhs: PromtCollectionItem, rhs: PromtCollectionItem) -> Bool {
        return lhs.id == rhs.id
    }
}

struct PromtCollectionItem_Previews: PreviewProvider {
    static var previews: some View {
        PromtCollectionItem(id: "12312312", buttonAction: {_ in })
    }
}
