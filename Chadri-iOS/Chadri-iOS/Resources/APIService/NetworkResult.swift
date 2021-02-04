//
//  NetworkResult.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/04.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
