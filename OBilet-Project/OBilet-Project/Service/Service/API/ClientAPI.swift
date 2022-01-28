//
//  ClientAPI.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation

class ClientAPI {
    
    func getSession(params: [String: Any]?,
                   succeed: @escaping (BaseModel<SessionData>) -> Void,
                   failed: @escaping (ErrorMessage) -> Void) {

        BaseAPI.shared.request(methotType: .post,
                               params: params,
                               urlPath: Endpoints.getSession,
                               succeed: succeed,
                               failed: failed)
    }
}
