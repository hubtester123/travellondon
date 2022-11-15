//
//  EventDetailViewModel.swift
//  travellondon
//
//  Created by Tony Cheung on 31/10/2022.
//

import Foundation

final class EventDetailViewModel: ObservableObject {

    @Published var eventDetail: EventDetail = try! loadFileToJSON("eventDetailData.json", type: EventDetail.self) as! EventDetail
}
