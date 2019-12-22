//
//  LocalDataFetcher.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 22/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Could't find \(urlString) in main bundle.")
            response(nil)
            return
        }
        
        let data = try? Data(contentsOf: file)
        
        let decoded = self.decodeJSON(type: T.self, from: data)
        response(decoded)
    }
}
