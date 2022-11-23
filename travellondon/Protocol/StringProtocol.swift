//
//  StringProtocol.swift
//  travellondon
//
//  Created by Tony Cheung on 2/11/2022.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
