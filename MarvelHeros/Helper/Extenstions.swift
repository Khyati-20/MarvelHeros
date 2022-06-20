//
//  Extenstions.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 08/06/22.
//

import Foundation
import CryptoKit
import UIKit


extension String {
    var MD5: String {
            let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map {String(format: "%02x", $0)}.joined()
        }
}

extension UIImageView {
    func loadFromURL(url: String?)  {
        if let path = url {
            let imgUrl = URL(string: path)
            if let imgData = try? Data(contentsOf: imgUrl!) {
                self.image = UIImage(data: imgData)
            }
        
        }
    }
}
