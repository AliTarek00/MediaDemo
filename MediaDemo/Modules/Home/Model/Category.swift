//
//  Episode.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

struct Category: Codable
{
    let name: String?
    
    enum CodingKeys: String, CodingKey
    {
        case name = "name"
    }

    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

struct CategoryViewModel
{
    let name: String
}

extension Category
{
    func toCategoryViewModel() -> CategoryViewModel?
    {
        guard let name = self.name else { return nil }
        return CategoryViewModel(name: name)
    }
}
