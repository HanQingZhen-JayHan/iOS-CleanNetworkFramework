//
//  CustomError.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//
import Foundation

struct CustomError: LocalizedError {
    let value: String
    
    var localizedDescription: String {
        return value
    }
    
}
