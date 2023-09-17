//
//  Tag.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 17.09.2023.
//

import SwiftUI

struct Promt: Identifiable, Hashable {
    var id: UUID = .init()
    var value: String
    var isInitial: Bool = false
    var isFocused: Bool = false
}
