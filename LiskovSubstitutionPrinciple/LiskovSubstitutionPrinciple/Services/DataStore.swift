//
//  DataStore.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 20/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class DataStore {
    // Сохранение данных в кеш / бд
    func saveNameInCache(name: String) {
        print("Your name: \(name) is saved")
    }

    // получаю данные из кеша / бд
    func getNameFromCache() -> String {
        return "some name"
    }

}
