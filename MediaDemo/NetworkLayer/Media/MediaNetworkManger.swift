//
//  MediaNetworkManger.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

struct MediaNetworkManagerInjectionMap
{
    static var mediaNetworkManager: MediaNetworkable = MediaNetworkManger()
}

protocol MediaNetworkManagerInjected{}

extension MediaNetworkManagerInjected
{
    var mediaNetworkManager: MediaNetworkable
    {
        get
        {
            return MediaNetworkManagerInjectionMap.mediaNetworkManager
        }
    }
}

class MediaNetworkManger: MediaNetworkable
{
    // MARK: Properties
    
    private let moyaServiceHelper: MoyaAPIHelper<MediaAPI>
    
    // MARK: Init
   
    init(type: ServiceType = .live)
    {
        moyaServiceHelper = MoyaAPIHelper(type: type)
    }
    
    // MARK: Method
    
    func getNewEpisodes(completion: @escaping (Result<BaseAPIResponse<NewEpisodesResponse>, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .getNewEpisodes, completion: completion)
    }
    
    func getChannels(completion: @escaping (Result<BaseAPIResponse<ChannelsResponse>, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .getChannels, completion: completion)
    }
    
    func getCategories(completion: @escaping (Result<BaseAPIResponse<CategoriesResponse>, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .getCategories, completion: completion)
    }
}
