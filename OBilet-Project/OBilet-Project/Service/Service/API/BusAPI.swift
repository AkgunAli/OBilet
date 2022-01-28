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
    func getBusJourneys(params: [String: Any]?,
                   succeed: @escaping (BaseModel<BusJourneysResponse>) -> Void,
                   failed: @escaping (ErrorMessage) -> Void) {

        BaseAPI.shared.request(methotType: .post,
                               params: params,
                               urlPath: Endpoints.getBusJourneys,
                               succeed: succeed,
                               failed: failed)
    }
}
