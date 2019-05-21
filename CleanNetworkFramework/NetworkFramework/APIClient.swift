//
//  APIClient.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//
import Alamofire

protocol APIClientProtocol {
    func request<T>(_ resource: Resouce<T>, completion: @escaping (Result<T>) -> Void)
}

struct APIClient: APIClientProtocol {
    func request<T>(_ resource: Resouce<T>, completion: @escaping (Result<T>) -> Void) {
        Alamofire
            .request(resource.request)
            .responseData { (dataResponse) in
        
                completion(dataResponse.result.flatMap2(resource.parse))
                
                // =====================================================log
                #if DEBUG
                print("<--\(dataResponse.response?.statusCode ?? -1)")
                if let data = dataResponse.result.value,
                    let utf8Text = String(data: data, encoding: .utf8) {
                    print("<--Response: \(utf8Text)")
                }
                #endif
                // =====================================================log
        }
    }
}
