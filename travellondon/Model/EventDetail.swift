//
//  EventDetail.swift
//  travellondon
//
//  Created by Tony Cheung on 31/10/2022.
//

import Foundation

struct EventDetail: Codable, Hashable{
    
    var name: String
    
    var image: [String]
//    var imageURLs: [URL?] {
//        image.map { imageString in
//            URL(string: imageString)
//        }
//    }
    
    private var date: String
    var openingDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd"
        
        guard let newDate = dateFormatter.date(from: date) else { return nil }
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: newDate)
    }
    
    var address: String
    var shortDescription: String
    var moreDescription: String
    
    var prices:[String:Double]?
    var buyTicketURL: String?
}
