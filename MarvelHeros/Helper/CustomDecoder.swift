//
//  CustomDecoder.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 09/06/22.
//

import Foundation
class CustomDecoder: JSONDecoder {
    let dateFormatter = DateFormatter()

    override init() {
        super.init()
        dateDecodingStrategy = .iso8601
    }
}
