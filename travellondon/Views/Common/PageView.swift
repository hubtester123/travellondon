//
//  PageView.swift
//  travellondon
//
//  Created by Tony Cheung on 1/11/2022.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State var currentPage:Int = 0

    var body: some View {
        PageViewController(pages: pages, currentPage: $currentPage)
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        let eventDetailViewModel = EventDetailViewModel()
//        PageView(pages: [Image(eventDetailViewModel.eventDetail.image[1])])
//            .onAppear(eventDetailViewModel.getEventDetail())
//    }
//}
