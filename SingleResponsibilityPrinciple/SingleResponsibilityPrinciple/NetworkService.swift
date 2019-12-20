//
//  NetworkService.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 20/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class NetworkService {
    
    // декодирую полученные данные в модель данных
    func dataFetcher(urlString: String) {
        request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Posts].self, from: data)
            print(response)
        }
    }
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
    
}
