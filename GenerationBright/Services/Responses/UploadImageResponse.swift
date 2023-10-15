//
//  UploadImageResponse.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import Foundation

struct UploadImageResponse: Decodable {
    let status: String
    let messege: String?
    let requestId: Int
    let link: String

    enum CodingKeys: String, CodingKey {
        case status
        case messege
        case requestId = "request_id"
        case link
    }
}
