//
//  Resource.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Alamofire

open class Resouce<T> {
    
    let request: APIActionProtocol
    let parse: (Any) -> Result<T>
    
    init(request: APIActionProtocol, parse: @escaping (Any) -> Result<T>) {
        self.request = request
        self.parse = parse
    }
}


