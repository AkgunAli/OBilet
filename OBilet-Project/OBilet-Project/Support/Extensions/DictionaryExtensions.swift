//
//  DictionaryExtensions.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 27.01.2022.
//

import Foundation
extension Dictionary {

    func toJsonStr(option: JSONSerialization.WritingOptions = []) -> String {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: option) else { return "" }
        let theJSONText = String(data: theJSONData, encoding: .utf8)
        return theJSONText ?? ""
    }

    func toJsonText(option: JSONSerialization.WritingOptions = []) throws -> String? {
        let theJSONData = try JSONSerialization.data(withJSONObject: self, options: option)
        return String(data: theJSONData, encoding: .utf8)
    }

}
