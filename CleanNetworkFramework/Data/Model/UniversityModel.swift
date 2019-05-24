//
//  UniversityModel.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-23.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Alamofire

struct UniversityModel{
    private let apiClient: APIClientProtocol = APIClient()
    
    func getUniversityList(_ pageIndex: Int, _ completion: @escaping (Result<UniversityListResponse>) -> Void) {
        let request = MyAppAPI.getUniversityList(pageIndex: pageIndex)
        apiClient.request(RepositoryFactory<UniversityListResponse>(request: request), completion: completion)
    }
}
