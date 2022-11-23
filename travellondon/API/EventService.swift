//
//  EventService.swift
//  travellondon
//
//  Created by Tony Cheung on 22/11/2022.
//

import Foundation
import Combine

protocol EventService {
    
    //func getEventList() -> AnyPublisher<[Event], NetworkError>
    func getEventDetail() -> AnyPublisher<EventDetail, NetworkError>
}

extension EventService {
    
//    func getEventList() -> AnyPublisher<[Event], NetworkError> {
//
//        guard let url = URL(string: "https://mocki.io/v1/426c7a48-3f12-42f9-9dcc-1fe382cf4f4a") else {
//            return Fail(error: NetworkError.decodeURLError)
//                .eraseToAnyPublisher()
//        }
//        return NetworkService
//            .request(request: URLRequest(url: url))
//            .eraseToAnyPublisher()
//    }
    
    func getEventDetail() -> AnyPublisher<EventDetail, NetworkError> {
        
        guard let url = URL(string: "https://mocki.io/v1/1656f3c0-aae0-4699-8a60-938572009946") else {
            return Fail(error: NetworkError.decodeURLError)
                .eraseToAnyPublisher()
        }
        
        return NetworkService
            .request(request: URLRequest(url: url))
            .eraseToAnyPublisher()
    }
}
