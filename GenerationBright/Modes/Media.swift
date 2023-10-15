//
//  Media.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import SwiftUI

struct MediaFile: Identifiable {
    var id: String = UUID().uuidString
    var image: Image
    var data: Data
}
