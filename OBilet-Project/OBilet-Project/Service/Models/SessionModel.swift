//
//  SessionModel.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 27.01.2022.
//

import Foundation
import ObjectMapper

class SessionData: Mappable , Codable {

    var sessionId: String?
    var deviceId: String?
    
    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        sessionId <- map["session-id"]
        deviceId <- map["device-id"]
    }
}
