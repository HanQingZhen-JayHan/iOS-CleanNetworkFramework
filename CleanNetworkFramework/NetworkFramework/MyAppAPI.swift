//
//  MyAppAPI.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//
import Alamofire

//singeleton
enum MyAppAPI {
    case getComic(comicID: Int)
}

extension MyAppAPI: APIActionProtocol {
    
    var baseURL: String {
        return "https://xkcd.com/"
    }
    
    var authHeader: [String : String]{
        return ["Authorization":"Bear "]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    
    var actionParameters: [String : Any] {
        return [:]
    }
    
    var method: HTTPMethod {
        switch self {
        case .getComic:
            return .get
        
        }
    }
    
    var path: String {
        switch self {
        case .getComic(let comicID):
            return "\(comicID)/info.0.json"
        }
    }
    
}
