//
//  APIAction.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//
import Alamofire

protocol APIActionProtocol:URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var actionParameters: [String: Any] { get }
    var baseURL: String { get }
    var authHeader: [String: String] { get }
    var encoding: ParameterEncoding { get }
    
}

extension APIActionProtocol {
    func asURLRequest() throws -> URLRequest {
        let originalRequest  = try URLRequest(
            url: baseURL.appending(path),
            method: method,
            headers: authHeader)
        
        let encodedRequest  = try encoding.encode(originalRequest, with: actionParameters)
        
        // =====================================================log
        #if DEBUG
            print("-->URL:       \(baseURL)\(path)")
            print("-->Method:    \(method)")
            print("-->Header:    \(authHeader)")
            print("-->Parameter: \(actionParameters)")
        #endif
        // =====================================================log
        
        return encodedRequest
    }
}
