//
//  UniversityListResponse.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-23.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Foundation

struct UniversityListResponse: Codable {
    let _embedded:[String:[School]]
    let page:Page?
    
    func getDataList() -> [School] {
        
        for key in _embedded.keys {
            return _embedded[key] ?? Array<School>()
        }
        return Array<School>()
    }
    
    func getTotalSize() -> Int {
        return page?.totalElements ?? 0
    }
}
