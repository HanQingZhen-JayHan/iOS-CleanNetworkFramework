//
//  ComicRepository.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import Alamofire

struct ComicModel {
    private let apiClient: APIClientProtocol = APIClient()
    
    func getRandoComic(_ completion: @escaping (Result<Comic>) -> Void) {
        let randomNumber = Int.random(in: 1...1000)
        let request = MyAppAPI.getComic(comicID: randomNumber)
        apiClient.request(RepositoryFactory<Comic>(request: request), completion: completion)
    }
}
