//
//  NetworkService.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 20/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}


//protocol Networking {
//    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
//}

class NetworkService: Networking {
    
//     построение запроса данных по URL
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) ->
        URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
    
}
