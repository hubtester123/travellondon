//
//  EventDetail.swift
//  travellondon
//
//  Created by Tony Cheung on 9/11/2022.
//

import Foundation

struct EventDetail: Codable, Hashable, ParseProtocol{
    
    var address: String
    var briefDescription: String
    var buyTicketURL: String?
    private var date: String
    var openingDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd"
        
        guard let newDate = dateFormatter.date(from: date) else { return nil }
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: newDate)
    }
    var moreDescription: String
    var name: String

    var image: [String]
//    var imageURLs: [URL?] {
//        image.map { imageString in
//            URL(string: imageString)
//        }
//    }
    
    
    var prices:[String:Double]?
    
    init(address: String, briefDescription: String, buyTicketURL: String? = nil, date: String, moreDescription: String, name: String, image: [String], prices: [String : Double]? = nil) {
        self.address = address
        self.briefDescription = briefDescription
        self.buyTicketURL = buyTicketURL
        self.date = date
        self.moreDescription = moreDescription
        self.name = name
        self.image = image
        self.prices = prices
    }
    
    init(_ jsonObject: [String : Any]) {
        self.address = jsonObject["address"] as? String ?? ""
        self.briefDescription = jsonObject["briefDescription"] as? String ?? ""
        self.buyTicketURL =  jsonObject["buyTicketURL"] as? String
        self.date = jsonObject["date"] as? String ?? ""
        self.moreDescription = jsonObject["moreDescription"] as? String ?? ""
        self.name = jsonObject["name"] as? String ?? ""
        self.image = jsonObject["image"] as? [String] ?? []
        self.prices = jsonObject["prices"] as? [String : Double]
    }
}
