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
    case getUniversityList(pageIndex: Int)
}

extension MyAppAPI: APIActionProtocol {

    var baseURL: String {
        switch self {
            case .getComic:
                return "https://xkcd.com/"
            default:
                return "https://madoor.site:2087/"
        }
    }
    
    var authHeader: [String : String]{
        let token = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJyZWFkOnVzZXIiXSwiZXhwIjozNjk5NDc4MzE0LCJqdGkiOiJiNDEyODI3NS04YjRlLTQ4MzYtYTIzNy0xOTJjNjAwYzU0M2QiLCJjbGllbnRfaWQiOiJtYWRvb3ItcmVhZCJ9.vKhUh7MZtLNRJEKDCccDyeQWzanoSdOpZPEfnVbnQYlTV_EN_r6Q4fTrzacKeP4S9or1d_se7rts4BLH5AHl-9kHqdidlpsx302nHad6lX0SbBubmIK7_UyLTnFM0tY1fvBhmiabLqMsooGnsq9hMnW39pcA6eLxpDHwTVdd7D_oERpUDFBdItTu3f65Q4VGBhIqvnpUHVB7QaBBBARPGSkt-pkaiOssNHm7iOPq-AVaxaVqRYMQZRQ_4rf01Hm-U41zR7OfrbvYZ7POTpFjsj-3ZbISG56BP6Y16nUApVX2W5XT8JGqzd5yS_ZctCgJb2FgSHz_CtDmk9rcHCBlpA"
        return ["Authorization":"\(token)"]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    
    var actionParameters: [String : Any] {
        let pageSize = 10
        switch self {
        case .getUniversityList( let page):
            return ["page": page, "size": pageSize]
        default:
            return [:]
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getComic:
            return .get
            
        case .getUniversityList:
            return .get
        
        }
    }
    
    var path: String {
        switch self {
        case .getComic(let comicID):
            return "\(comicID)/info.0.json"
        case .getUniversityList( _):
            return "api/universities/search/ranking"
        }
    }
    
}
