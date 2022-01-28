//
//  TicketSearchVM.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import Foundation
class TicketSearchVM {
    let busApi = BusAPI()
    var fromWhereArray : [String] = [] {
        didSet{
            toWhereArray = fromWhereArray
        }
    }
    var toWhereArray : [String] = []
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
                        self?.fromWhereArray.append(item.name ?? "")
                    }
                completion()
            }, failed: { error in
                print("")
            })

        } catch {
            print(error.localizedDescription)
        }

    }
}
