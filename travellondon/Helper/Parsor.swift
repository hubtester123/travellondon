//
//  Parsor.swift
//  travellondon
//
//  Created by Tony Cheung on 10/11/2022.
//

import Foundation

func parseJSONArrayToEventArray(data: Data) throws -> Any? {
    
    do {
        // make sure this JSON is in the format we expect
        if let JSONObjectList = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
            
            let result = JSONObjectList.map { JSONObject in
                Event(name: JSONObject["name"] as? String ?? "",
                      imageUrl: JSONObject["imageUrl"] as? String ?? "",
                      gifUrl: JSONObject["gifUrl"] as? String ?? "")
            }
            return result
        }
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
    
    return nil
}

func parseJSONToEventDetail(data: Data) throws -> Any? {
    
    do {
        if let JSONObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            
            let result = EventDetail(address: JSONObject["address"] as? String ?? "",
                                     briefDescription: JSONObject["briefDescription"] as? String ?? "",
                                     buyTicketURL: JSONObject["buyTicketURL"] as? String,
                                     date: JSONObject["date"] as? String ?? "",
                                     moreDescription: JSONObject["moreDescription"] as? String ?? "",
                                     name: JSONObject["name"] as? String ?? "",
                                     image: JSONObject["image"] as? [String] ?? [],
                                     prices: JSONObject["prices"] as? [String : Double])
            return result
        }
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
    
    return nil
}
