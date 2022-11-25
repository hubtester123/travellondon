//
//  EventDetailViewModel.swift
//  travellondon
//
//  Created by Tony Cheung on 31/10/2022.
//

import Foundation
import Combine
import SwiftUI

class EventDetailViewModel: ObservableObject, EventService {
    
//    @Published var eventDetail: EventDetail = try! loadFileTo(EventDetail.self, from:"eventDetailData.json") as! EventDetail
    
    @Published var eventDetail: EventDetail? = nil

    private var cancellable = Set<AnyCancellable>()
    
    func getEventDetail() {
        
        self.getEventDetail()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }) {
                print("load event")
                self.eventDetail = $0
            }
            .store(in: &cancellable)

    }
}
