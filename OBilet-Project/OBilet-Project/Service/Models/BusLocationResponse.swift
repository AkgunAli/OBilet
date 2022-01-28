//
//  BusLocationResponse.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation
import ObjectMapper

class BusLocationResponse: Mappable {

    var id: Int?
    var parentId: Int?
    var type: String?
    var name: String?
    var geoLocation:GeoLocation?
    var zoom: Int?
    var tzCode: String?
    var weatherCode: String?
    var rank: Int?
    var referenceCode : Int?
    var keywords: String?

    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        id <- map["id"]
        parentId <- map["parent-id"]
        type <- map["type"]
        name <- map["name"]
        geoLocation <- map["geo-location"]
        zoom <- map["zoom"]
        tzCode <- map["tz-code"]
        weatherCode <- map["weather-code"]
        rank <- map["rank"]
        referenceCode <- map["reference-code"]
        keywords <- map["keywords"]

    }
}


class GeoLocation: Mappable {

    var latitude: Int?
    var longitude: Int?
    var zoom: Int?

    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        zoom <- map["zoom"]
    }
}
