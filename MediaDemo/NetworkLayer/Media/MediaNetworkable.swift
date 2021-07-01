//
//  MediaNetworkable.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

protocol MediaNetworkable: class
{
    // MARK: POST Request

    func getNewEpisodes(completion: @escaping (Result<BaseAPIResponse<NewEpisodesResponse>, Error>) -> Void)
    func getChannels(completion: @escaping (Result<BaseAPIResponse<ChannelsResponse>, Error>) -> Void)
    func getCategories(completion: @escaping (Result<BaseAPIResponse<CategoriesResponse>, Error>) -> Void)
}
