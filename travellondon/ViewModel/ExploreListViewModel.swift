//
//  ExploreListViewModel.swift
//  travellondon
//
//  Created by Tony Cheung on 20/10/2022.
//

import Foundation

final class ExploreListViewModel: ObservableObject {
    
    @Published var events: [Event] = try! loadFileToJSON("eventData.json", type: [Event].self) as! [Event]
}

