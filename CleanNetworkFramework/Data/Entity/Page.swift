//
//  Page.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-23.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Foundation

struct Page : Codable{
    let size: Int
    let totalElements: Int
    let totalPages: Int
    let number: Int
}
