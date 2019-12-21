//
//  PostsModel.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 21/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

struct Posts: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
