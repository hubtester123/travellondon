//
//  ExplorerCellView.swift
//  travellondon
//
//  Created by Tony Cheung on 20/10/2022.
//

import SwiftUI

struct ExplorerCellView: View {
    
    var event:Event
    
    var eventImageWidth: CGFloat {
        UIScreen.main.bounds.width - 20.0
    }
    var eventImageHeight: CGFloat {
        eventImageWidth * 0.557
    }
    
    var body: some View {
            VStack {
                AsyncImage(
                    url: event.imageLink,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: eventImageWidth, height: eventImageHeight)
                            .clipped()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                HStack {
                    Text(event.name)
                        .foregroundColor(.white)
                        .padding(.leading, 10.0)
                        .padding(.bottom, 10.0)
                    Spacer()
                }

            }
            .background(.black)
            .cornerRadius(15)
    }
}

struct ExplorerCellView_Previews: PreviewProvider {
    
    static var event = ExploreListViewModel().events[0]

    
    static var previews: some View {
        
        ExplorerCellView(event: event)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
