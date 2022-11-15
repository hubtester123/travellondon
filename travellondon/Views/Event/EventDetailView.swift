//
//  EventDetailView.swift
//  travellondon
//
//  Created by Tony Cheung on 22/10/2022.
//

import SwiftUI
import Combine

struct EventDetailView: View {
    
    @EnvironmentObject var navigationBarSetting: NavigationBarSetting
    
    private var eventDetailViewModel = EventDetailViewModel()
    
    var body: some View {
        
        GeometryReader { proxy in
            
            ScrollView {
                
                VStack(spacing: 0) {
                    
                    
                    if let imageArray = eventDetailViewModel.eventDetail.image {
                        PageView(pages:imageArray.map({ imageString in
                            Image(imageString)
                                .resizable()
                                .scaledToFit()
                        })).frame(width:proxy.size.width,
                                  height:proxy.size.width * 466.0 / 823.0)
                        .accessibilityIdentifier("eventDetailmageView")
                    }
     
                    EventInformationView(eventDetailViewModel: eventDetailViewModel)
                        .padding(.bottom, 20)
                    
                    EventPriceView(eventDetailViewModel: eventDetailViewModel)
                    
                    Button {
                        
                        guard let buyTicketURL = eventDetailViewModel.eventDetail.buyTicketURL else { return }
                        
                        if let url = URL(string: buyTicketURL) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        HStack {
                            Text("Buy Tickets")
                                .foregroundColor(.white)
                                .frame(width: 160,  height: 34)
                                .background(Color(red: 0.795, green: 0.018, blue: 0.085))
                        }.cornerRadius(20.0)
                            .padding([.top,.bottom], 10)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Get Directions")
                                .foregroundColor(.white)
                                .frame(width: 160,  height: 34)
                                .background(Color(red: 0.119, green: 0.504, blue: 0.0))
                        }.cornerRadius(20.0)
                        .padding([.top,.bottom],10)
                    }


                }.background(.black)
            }.background(.black)
        }.onAppear {
            navigationBarSetting.customBarTitle = eventDetailViewModel.eventDetail.name ?? ""
            navigationBarSetting.navigationBarMode = .eventDetail
        }.onDisappear {
            navigationBarSetting.showEventDetail = false
            navigationBarSetting.navigationBarMode = .defaultValue
        }
    }
    
    struct EventInformationView: View {
        
        var eventDetailViewModel:EventDetailViewModel
        
        //Show more Button
        @State private var isReadMore: Bool = false
        private var buttonString:String { isReadMore ? "Show less": "Show more" }
        private var showMoreButtonRotation:Double { isReadMore ? 0: 180 }
        
        var body: some View {
            
            VStack(spacing: 0) {
                
                HStack() {
                    Text(eventDetailViewModel.eventDetail.name ?? "")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .frame(alignment: .leading)
                        .padding([.leading, .top] , 10.0)
                        .accessibilityIdentifier("eventInfomationNameView")
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 10.0)
                        .foregroundColor(.gray)
                }
                
                if let openingDate = eventDetailViewModel.eventDetail.openingDate {
                    informationView(imageString: "calendar",
                                    information: "Until " + openingDate)
                    .padding(.top, 16.0)
                    .padding(.bottom, 4.0)
                    .accessibilityIdentifier("eventInfomationDateView")
                }
                
                Divider()
                    .frame(height: 2.0)
                    .overlay(Color(red: 0.233, green: 0.237, blue: 0.242))
                    .padding([.leading, .trailing], 6.0)
                
                informationView(imageString: "location.circle",
                                information: "Discover Nearby")
                    .padding([.top, .bottom], 8.0)
                    .accessibilityIdentifier("eventInfomationDiscoverNearbyView")


                informationView(imageString: "globe.americas.fill",
                                information:  eventDetailViewModel.eventDetail.address ?? "")
                    .padding([.top, .bottom], 8.0)
                    .accessibilityIdentifier("eventInfomationAddressView")


                informationView(imageString: "globe.americas.fill",
                                information: "Add to ltinerary")
                    .padding([.top, .bottom], 8.0)
                    .accessibilityIdentifier("eventInfomationAddToLtineraryView")


                Divider()
                    .frame(height: 2.0)
                    .overlay(Color(red: 0.233, green: 0.237, blue: 0.242))
                    .padding([.leading, .trailing], 6.0)

                VStack {

                    let displayDescription = isReadMore ? (eventDetailViewModel.eventDetail.briefDescription ?? "") +
                                                          (eventDetailViewModel.eventDetail.moreDescription ?? "") :
                                                          (eventDetailViewModel.eventDetail.briefDescription ?? "")
                    Text(displayDescription)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                        .padding([.leading, .trailing], 10)
                        .accessibilityIdentifier("eventInfomationDescriptionView")
                    Spacer()
                }.frame(height: isReadMore ? nil : 100.0)
                    .transition(isReadMore ? .move(edge: .top) : .move(edge: .bottom))


                HStack {

                    Spacer()

                    Button {
                        withAnimation {
                            isReadMore.toggle()
                        }
                    } label: {
                        Text(buttonString)
                            .foregroundColor(.red)
                            .font(.subheadline)

                        if isReadMore {
                            Triangle()
                                .fill(.red)
                                .frame(width: 10  , height: 10)
                        } else {
                            ReversedTriangle()
                                .fill(.red)
                                .frame(width: 10  , height: 10)
                        }



                    }.padding(.trailing, 10)
                     .accessibilityIdentifier("eventInfomationShowMoreButton")
                }
            }
        }
        
        private func informationView(imageString: String, information:String?) -> some View {
            
            return  HStack {
                        HStack {
                            Image(systemName: imageString)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                    
                            if let information = information {
                                Text(information)
                                    .foregroundColor(.red)
                            }
                        }
                
                        Spacer()
                    }.padding(.leading, 10.0)
        }
    }
    
    struct EventPriceView: View {
        
        var eventDetailViewModel:EventDetailViewModel
        
        var body: some View {
            
            ZStack {
                
                Color(red: 0.113, green: 0.108, blue: 0.119)

                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Prices")
                            .foregroundColor(.white)
                            .padding([.leading,.top], 10.0)
                        Spacer()
                    }
                    
                    Divider()
                        .frame(height: 2.0)
                        .overlay(Color(red: 0.538, green: 0.538, blue: 0.534))
                        .padding([.top, .bottom, .leading, .trailing],10.0)
                    if let pricesDictionary = eventDetailViewModel.eventDetail.prices {
                        let keys = pricesDictionary.map { $0.key }
                        ForEach(keys, id:\.self) { key in
                            priceView(ticketName: key, price: pricesDictionary[key])
                                .accessibilityIdentifier("eventPrice" + key.firstCapitalized + "View")
                        }
                    }

                    
                    
                    Spacer()
                }
            }.cornerRadius(5.0)
                .padding([.leading, .trailing], 10.0)
        }
        
        private func priceView(ticketName:String, price:Double?) -> some View {

            return  HStack {
                        let displayTicketName = ticketName.firstCapitalized
                        Text("\(displayTicketName) Ticket")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        if let price {
                            if let displayPrice = String(format: "%.2f", price) {
                                Text("From £\(displayPrice)")
                                    .foregroundColor(.white)
                            }
                        }
                    }
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
