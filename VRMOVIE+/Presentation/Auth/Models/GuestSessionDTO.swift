//
//  GuestSessionDTO.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 24.02.2025.
//

import Foundation

struct GuestSessionDTO: Codable {
    let success: Bool
    let guestSessionID, expiresAt: String

    enum CodingKeys: String, CodingKey {
        case success
        case guestSessionID = "guest_session_id"
        case expiresAt = "expires_at"
    }
}

extension GuestSessionDTO {
    func mapToDomain() -> GuestSessionProtocol {
        .init(success: success,
              guestSessionID: guestSessionID,
              expiresAt: expiresAt)
        
    }
    
}
