//
//  Episode.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

struct Episode: Codable
{
    let type: String?
    let title: String?
    let coverAsset: CoverAsset?
    let channel: Channel?

    enum CodingKeys: String, CodingKey
    {
        case type = "type"
        case title = "title"
        case coverAsset = "coverAsset"
        case channel = "channel"
    }

    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
        channel = try values.decodeIfPresent(Channel.self, forKey: .channel)
    }
}

struct EpisodeViewModel
{
    let title: String
    let channel: String
    let imageCoverURL: String
}

extension Episode
{
    func toEpisodeViewModel() -> EpisodeViewModel?
    {
        guard let title = self.title,
              let channel = self.channel?.title,
              let imageURL = self.coverAsset?.url else { return nil }
        
        return EpisodeViewModel(title: title, channel: channel, imageCoverURL: imageURL)
    }
}
