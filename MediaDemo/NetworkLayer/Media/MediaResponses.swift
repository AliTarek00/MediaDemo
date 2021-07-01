//
//  MediaResponses.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

struct CategoriesResponse: Codable
{
    let categories: [Category]?
}

struct ChannelsResponse: Codable
{
    let channels: [Channel]?
}

struct NewEpisodesResponse: Codable
{
    let episodes: [Episode]?
    
    enum CodingKeys: String, CodingKey
    {
        case episodes = "media"
    }

    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        episodes = try values.decodeIfPresent([Episode].self, forKey: .episodes)
    }
}
