//
//  RepositoryFactory.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-11.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Alamofire

class RepositoryFactory<T: Codable>: Resouce<T> {
    init(request: APIActionProtocol) {
        super.init(request: request){
            (response) -> Result<T> in
            if let data = response as? Data,
                let res = try? JSONDecoder().decode(T.self, from: data){
                return Result.success(res)
            }else{
                return Result.failure(CustomError(value: "Invalid response"))
            }
            
        }
    }
    
}
