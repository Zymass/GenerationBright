//
//  UploadImageRequest.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import Foundation

struct UploadImageRequest: Codable {
    var key: String
    var image: String
    var crop: String
}
