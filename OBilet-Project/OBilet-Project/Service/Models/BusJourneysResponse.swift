//
//  BusJourneysResponse.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation
import ObjectMapper

struct BusJourneysResponse : Mappable {
    var id : Int?
    var partnerId : Int?
    var partnerName : String?
    var routeId : Int?
    var busType : String?
    var busTypeName : String?
    var totalSeats : Int?
    var availableSeats : Int?
    var journey : Journey?
    var features : [String]?
    var originLocation : String?
    var destinationLocation : String?
    var isActive : Bool?
    var originLocationId : Int?
    var destinationLocationId : Int?
    var isPromoted : Bool?
    var cancellationOffset : Int?
    var hasBusShuttle : Bool?
    var disableSalesWithoutGovId : Bool?
    var displayOffset : String?
    var partnerRating : Double?
    var hasDynamicPricing : Bool?
    var disableSalesWithoutHesCode : Bool?
    var disableSingleSeatSelection : Bool?
    var changeOffset : Int?
    var rank : Int?
    var displayCouponCodeInput : Bool?
    var disableSalesWithoutDateOfBirth : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        partnerId <- map["partner-id"]
        partnerName <- map["partner-name"]
        routeId <- map["route-id"]
        busType <- map["bus-type"]
        busTypeName <- map["bus-type-name"]
        totalSeats <- map["total-seats"]
        availableSeats <- map["available-seats"]
        journey <- map["journey"]
        features <- map["features"]
        originLocation <- map["origin-location"]
        destinationLocation <- map["destination-location"]
        isActive <- map["is-active"]
        originLocationId <- map["origin-location-id"]
        destinationLocationId <- map["destination-location-id"]
        isPromoted <- map["is-promoted"]
        cancellationOffset <- map["cancellation-offset"]
        hasBusShuttle <- map["has-bus-shuttle"]
        disableSalesWithoutGovId <- map["disable-sales-without-gov-id"]
        displayOffset <- map["display-offset"]
        partnerRating <- map["partner-rating"]
        hasDynamicPricing <- map["has-dynamic-pricing"]
        disableSalesWithoutHesCode <- map["disable-sales-without-hes-code"]
        disableSingleSeatSelection <- map["disable-single-seat-selection"]
        changeOffset <- map["change-offset"]
        rank <- map["rank"]
        displayCouponCodeInput <- map["display-coupon-code-input"]
        disableSalesWithoutDateOfBirth <- map["disable-sales-without-date-of-birth"]
    }

}

struct Journey : Mappable {
    var kind : String?
    var code : String?
    var stops : [Stops]?
    var origin : String?
    var destination : String?
    var departure : String?
    var arrival : String?
    var currency : String?
    var duration : String?
    var originalPrice : Double?
    var internetPrice : Double?
    var providerInternetPrice : Double?
    var booking : String?
    var busName : String?
    var policy : Policy?
    var features : [String]?
    var description : String?
    var available : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        kind <- map["kind"]
        code <- map["code"]
        stops <- map["stops"]
        origin <- map["origin"]
        destination <- map["destination"]
        departure <- map["departure"]
        arrival <- map["arrival"]
        currency <- map["currency"]
        duration <- map["duration"]
        originalPrice <- map["original-price"]
        internetPrice <- map["internet-price"]
        providerInternetPrice <- map["provider-internet-price"]
        booking <- map["booking"]
        busName <- map["bus-name"]
        policy <- map["policy"]
        features <- map["features"]
        description <- map["description"]
        available <- map["available"]
    }

}


struct Stops : Mappable {
    var name : String?
    var station : String?
    var time : String?
    var isOrigin : Bool?
    var isDestination : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        name <- map["name"]
        station <- map["station"]
        time <- map["time"]
        isOrigin <- map["is-origin"]
        isDestination <- map["is-destination"]
    }

}

struct Policy : Mappable {
    var maxSeats : String?
    var maxSingle : String?
    var maxSingleMales : String?
    var maxSingleFemales : Int?
    var mixedGenders : Bool?
    var govId : Bool?
    var lht : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        maxSeats <- map["max-seats"]
        maxSingle <- map["max-single"]
        maxSingleMales <- map["max-single-males"]
        maxSingleFemales <- map["max-single-females"]
        mixedGenders <- map["mixed-genders"]
        govId <- map["gov-id"]
        lht <- map["lht"]
    }

}
