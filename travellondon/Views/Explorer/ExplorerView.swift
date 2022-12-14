//
//  ExplorerView.swift
//  travellondon
//
//  Created by Tony Cheung on 18/10/2022.
//

import SwiftUI

struct ExplorerView: View {
    
    @EnvironmentObject var navigationBarSetting: NavigationBarSetting
    
    @ObservedObject var exploreListViewModel: ExploreListViewModel
        
    @StateObject private var eventDetailViewModel = EventDetailViewModel()
    
    init(_ exploreListViewModel: ExploreListViewModel) {
        self.exploreListViewModel = exploreListViewModel
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(exploreListViewModel.events, id: \.self) { event in
                    
                    ZStack {
                        ExplorerCellView(event: event)
                        NavigationLink(destination: EventDetailView(eventDetailViewModel: eventDetailViewModel).navigationBarBackButtonHidden(true),
                                       isActive: $navigationBarSetting.showEventDetail) {
                            EmptyView()
                        }
                        .frame(width: 0)
                        .opacity(0)
                    }
                }.listRowBackground(Color.clear)
            } .listStyle(.inset)
              .background(appMainColor)
        }.navigationBarBackButtonHidden(true)
            .onAppear {
                exploreListViewModel.getEventList()
            }
    }
}

//struct ExplorerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExplorerView()
//    }
//}
