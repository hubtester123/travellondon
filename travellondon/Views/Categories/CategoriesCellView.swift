//
//  CategoriesCellView.swift
//  travellondon
//
//  Created by Tony Cheung on 22/10/2022.
//

import SwiftUI

struct CategoriesCellView: View {
    var body: some View {
        VStack {
            HStack {
                Image("nearme")
                    .cornerRadius(5)
            }
            
            HStack {
                VStack {
                     Image("offers")
                        .cornerRadius(5)
                    
                     Image("mustsee")
                        .cornerRadius(5)
                }
                
                VStack {
                     Image("priceless")
                        .cornerRadius(5)
                    
                     Image("free")
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct CategoriesCellView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCellView()
    }
}
