//
//  Base.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

struct BaseAPIResponse<Data: Codable>: Codable
{
    let data: Data?
}

enum ServiceType
{
    case live
    case test
}
