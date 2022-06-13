//
//  Network.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 08/06/22.
//

import Foundation
import Alamofire

class Network {
    private let timeStamp = UInt64(floor(Date().timeIntervalSince1970 * 1000))
  
    var characterDataArray: [Character] = []
    func getApiKey() -> String {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {return "" }
        return apiKey
    }
    func getHashParam() -> String {
        let apiKey = getApiKey()
        guard let privateKey = Bundle.main.infoDictionary?["PRIVATE_KEY"] as? String else {return ""}
        let hashString = String(timeStamp) + privateKey + apiKey
        return hashString.MD5
    }
    func fetchData(completion: @escaping (CharacterDataContainer?)->()) {
        let params: [String: String] = ["apikey": getApiKey(), "ts": String(timeStamp), "hash": getHashParam()]
        AF.request(Constants.baseUrl, method: .get, parameters: params)
            .responseDecodable(of: CharacterDataWrapper.self, decoder: CustomDecoder()) { (response) in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let characterData):
                   let charactersData = characterData.data
                    
                    print(charactersData.count)
                    completion(charactersData)
                    
                }
            }
    }
    
  
  
}
