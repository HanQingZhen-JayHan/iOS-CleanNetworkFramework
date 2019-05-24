//
//  BaseResponse.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-23.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Foundation

struct BaseResponse<T> where T: Codable{
    let _embedded:[String:[T]]
    let page: Page?
    
    func getDataList() -> [T] {
    
        for key in _embedded.keys {
            return _embedded[key] ?? Array<T>()
        }
        return Array<T>()
    }
    
    func getTotalSize() -> Int {
        return page?.totalElements ?? 0
    }
}

