//
//  BusAPI.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation

class BusAPI {
    
    func getBusLocations(params: [String: Any]?,
                   succeed: @escaping (BaseModel<BusLocationResponse>) -> Void,
                   failed: @escaping (ErrorMessage) -> Void) {

        BaseAPI.shared.request(methotType: .post,
                               params: params,
                               urlPath: Endpoints.getBusLocations,
                               succeed: succeed,
                               failed: failed)
    }
}


//
//{
//    "data":null,
//    "device-session":
//    {"session-id": "PqtdftjloK3Kpka97+ILDzMa6D9740nggLiTzXiLlzA=",
//    "device-id":"PqtdftjloK3Kpka97+ILDzMa6D9740nggLiTzXiLlzA="
//    }, "date":"2016-03-11T11:33:00",
//    "language":"tr-TR"
//}
