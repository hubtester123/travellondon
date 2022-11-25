//
//  ExploreListViewModel.swift
//  travellondon
//
//  Created by Tony Cheung on 20/10/2022.
//

import Foundation
import Combine

final class ExploreListViewModel: ObservableObject, EventService {

//    @Published var events: [Event] = try! loadFileTo(Event.self, from: "eventData.json") as! [Event]
    
    @Published var events: [Event] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    func getEventList() {
        self.getEventList()
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
                self.events = $0
            }
            .store(in: &cancellable)
    }
}

