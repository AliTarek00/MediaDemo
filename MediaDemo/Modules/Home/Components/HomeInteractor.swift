//
//  HomeInteractor.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

protocol HomeInteractorProtocol: class
{
    var presenter: HomePresenterProtocol? { get set }
    
    func fetchNewEpisodes()
    func fetchChannels()
    func fetchCategories()
}

class HomeInteractor: HomeInteractorProtocol, MediaNetworkManagerInjected
{
    // MARK:- Properties
    
    var presenter: HomePresenterProtocol?
    
    var newEpisodes: [Episode] = []
    var channels: [Channel] = []
    var categories: [Category] = []
    
    // MARK:- Methods
    
    func fetchNewEpisodes()
    {
        mediaNetworkManager.getNewEpisodes { [weak self] (result) in
            switch result
            {
            case let .success(response):
                let data = Array(response.data?.episodes?.prefix(6) ?? [])
                self?.newEpisodes = data
                self?.presenter?.didReceiveNewEpisodes(data)
            case let .failure(error):
                self?.presenter?.error(error)
            }
        }
    }
    
    func fetchChannels()
    {
        mediaNetworkManager.getChannels { [weak self] (result) in
            switch result
            {
            case let .success(response):
                let data = response.data?.channels ?? []
                self?.channels = data
                self?.presenter?.didReceiveChannels(data)
            case let .failure(error):
                self?.presenter?.error(error)
            }
        }
    }
    
    func fetchCategories()
    {
        mediaNetworkManager.getCategories { [weak self] (result) in
            switch result
            {
            case let .success(response):
                self?.validateCategories(response)
            case let .failure(error):
                self?.presenter?.error(error)
            }
        }
    }
    
    private func validateNewEpisodes(_ response: BaseAPIResponse<NewEpisodesResponse>)
    {
        guard let episodes = response.data?.episodes, !episodes.isEmpty else
        {
            presenter?.error(HomeAPIError.emptyNewEpisodes)
            return
        }
        self.newEpisodes = episodes
        presenter?.didReceiveNewEpisodes(episodes)
    }
    
    private func validateChannels(_ response: BaseAPIResponse<ChannelsResponse>)
    {
        guard let channels = response.data?.channels, !channels.isEmpty else
        {
            presenter?.error(HomeAPIError.emptyChannels)
            return
        }
        self.channels = channels
        presenter?.didReceiveChannels(channels)
    }
    
    private func validateCategories(_ response: BaseAPIResponse<CategoriesResponse>)
    {
        guard let categories = response.data?.categories, !categories.isEmpty else
        {
            presenter?.error(HomeAPIError.emptyCategories)
            return
        }
        self.categories = categories
        presenter?.didReceiveCategories(categories)
    }
}
