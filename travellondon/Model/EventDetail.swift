//
//  EventDetail.swift
//  travellondon
//
//  Created by Tony Cheung on 9/11/2022.
//

import Foundation

struct EventDetail: Codable, Hashable{
    
    
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
}
