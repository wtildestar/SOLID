//
//  DataFetcherService.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 21/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping(T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
//    init(networking: Networking = NetworkService()) {
//        self.networking = networking
//    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping(T?) -> Void) {
        print(T.self)
        networking.request(urlString: urlString) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
}
