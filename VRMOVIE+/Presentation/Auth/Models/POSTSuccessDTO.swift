//
//  POSTSuccessDTO.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 24.02.2025.
//

import Foundation

struct POSTSuccessDTO: Codable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

extension POSTSuccessDTO {
    func mapToDomain() -> POSTSuccessProtocol {
        .init(success: success,
              statusCode: statusCode,
              statusMessage: statusMessage)
    }
}
