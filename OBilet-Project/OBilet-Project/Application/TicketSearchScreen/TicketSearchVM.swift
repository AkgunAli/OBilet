//
//  TicketSearchVM.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation

struct BusDataModel {
    var parentId : Int
    var  name : String
}
class TicketSearchVM {
    let busApi = BusAPI()
    var fromWhereArray : [BusDataModel] = [] {
        didSet{
            toWhereArray = fromWhereArray
        }
    }
    var passengerAddArray : [String] = ["1","2","3","4"]
    var toWhereArray : [BusDataModel] = []
    var busJourneysResponse : [BusJourneysResponse]?
    init() {
    }
    
    func getBusLocations(completion: @escaping () -> ()){
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        let userDefaults = UserDefaults.standard
        do {
            let sessionData = try userDefaults.getObjectt(forKey: "sessionData", castTo: SessionData.self)
            busApi.getBusLocations(params: ["data":"",
                                          "device-session":
                                            ["session-id": sessionData.sessionId,
                                          "device-id": sessionData.deviceId],
                                          "date":dateString,
                                          "language":"tr-TR"
            ], succeed: { [weak self] response in
                guard let data = response.dataArray , data.count > 0 else { return }
                    for item in data {
                        self?.fromWhereArray.append(BusDataModel(parentId: item.parentId ?? 0, name: item.name ?? ""))
                    }
                completion()
            }, failed: { error in
                print("")
            })

        } catch {
            print(error.localizedDescription)
        }

    }
    func getBusJourneys(originId:Int , destinationId : Int , departureDate : String , completion: @escaping () -> ()){
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        let userDefaults = UserDefaults.standard
        do {
            let sessionData = try userDefaults.getObjectt(forKey: "sessionData", castTo: SessionData.self)
            busApi.getBusJourneys(params: ["data":[ "origin-id": originId,
                                                     "destination-id": destinationId,
                                                     "departure-date": departureDate ],
                                          "device-session":
                                            ["session-id": sessionData.sessionId,
                                          "device-id": sessionData.deviceId],
                                          "date":dateString,
                                          "language":"tr-TR"
            ], succeed: { [weak self] response in
                guard let data = response.dataArray , data.count > 0 else { return }
                self?.busJourneysResponse = response.dataArray
                completion()
            }, failed: { error in
                print("")
            })

        } catch {
            print(error.localizedDescription)
        }

    }
}
