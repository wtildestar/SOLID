//
//  DataFetcherService.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 21/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchPosts(completion: @escaping ([Posts]?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchLocalPosts(completion: @escaping ([Posts]?) -> Void) {
        let localUrlString = "postsAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
    
}
