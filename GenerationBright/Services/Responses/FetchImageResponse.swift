//
//  FetchImageResponse.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import Foundation

struct FetchImageResponse: Decodable {
    let status: String
    let id: Int
    let output: [String]
    let message: String?
}
