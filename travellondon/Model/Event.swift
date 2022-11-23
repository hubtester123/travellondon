//
//  Event.swift
//  travellondon
//
//  Created by Tony Cheung on 20/10/2022.
//

import Foundation

struct Event: Codable, Hashable, ParseProtocol{

        
    var name: String
    
    private var imageUrl: String
    var imageLink: URL? {
        URL(string: imageUrl) ?? nil
    }
    
    private var gifUrl: String
    var gifLink: URL? {
        URL(string: gifUrl) ?? nil
    }
        
    init(name: String, imageUrl: String, gifUrl: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.gifUrl = gifUrl
    }
    
    init(_ jsonObject: [String : Any]) {
        self.name = jsonObject["name"] as? String ?? ""
        self.imageUrl = jsonObject["imageUrl"] as? String ?? ""
        self.gifUrl = jsonObject["gifUrl"] as? String ?? ""
    }
}
