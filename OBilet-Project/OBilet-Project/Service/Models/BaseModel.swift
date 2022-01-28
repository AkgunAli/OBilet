//
//  BaseModel.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation
import ObjectMapper

class BaseModel<S:Mappable>: Mappable{
    var status: String?
    var dataObject: S?
    var dataArray: [S]?
    var message: String?
    var userMessage: String?
    var apiRequestId: String?
    var controller: String?
    
    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        status <- map["status"]
        dataObject <- map["data"]
        dataArray <- map["data"]
        message <- map["message"]
        userMessage <- map["user-message"]
        apiRequestId <- map["api-request-id"]
        controller <- map["controller"]
    }
}
