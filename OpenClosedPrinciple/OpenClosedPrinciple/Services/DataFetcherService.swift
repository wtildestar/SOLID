//
//  DataFetcherService.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 21/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchPosts(completion: @escaping ([Posts]?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
}
