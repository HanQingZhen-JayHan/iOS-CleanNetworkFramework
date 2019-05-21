//
//  AlamofireResult.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Alamofire

extension Alamofire.Result {
    public func flatMap2<T>(_ transform: (Value) throws -> Result<T>) -> Result<T>{
        switch self {
        case .success(let value):
            do{
                return try transform(value)
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
