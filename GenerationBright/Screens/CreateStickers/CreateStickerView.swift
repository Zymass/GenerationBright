//
//  CreateStickerView.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 01.10.2023.
//

import SwiftUI
import TelegramStickersImport

struct CreateStickerView: View {
    var body: some View {
        Button("Make Sticker") {
            let stickerSet = StickerSet(software: "Test make sticker", type: .image)
            guard let yourStickerImage = UIImage(named: "sticker") else { return }
            if let stickerData = Sticker.StickerData(image: yourStickerImage) {
                try? stickerSet.addSticker(data: stickerData, emojis: ["😎"])
            }
            try? stickerSet.import()
        }
    }
}

#Preview {
    CreateStickerView()
}
