//
//  HomeInteractor.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import UIKit

protocol HomeInteractorProtocol: class
{
    var presenter: HomePresenterProtocol? { get set }
    
    func fetchNewEpisodes()
    func fetchChannels()
    func fetchCategories()
    
    func getSizeof(ChannelAt index: IndexPath)-> CGSize
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
                self?.validateNewEpisodes(response)
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
                self?.validateChannels(response)
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
        
    func getSizeof(ChannelAt index: IndexPath)-> CGSize
    {
        let channel = channels[index.section]
        if channel.isSeriesType
        {
            if let series = channel.series?[index.row].toChannelViewModel()
            {
                return getSizeOfSeries(series)
            }
        }
        else
        {
            if let course = channel.latestMedia?[index.row].toChannelViewModel()
            {
                return getSizeOfCourse(course)
            }
        }
        
        return CGSize(width: CourseCellSize.width, height: CourseCellSize.height)
    }
    
    // MARK:- Private Methods
    
    private func validateNewEpisodes(_ response: BaseAPIResponse<NewEpisodesResponse>)
    {
        guard let episodes = response.data?.episodes, !episodes.isEmpty else
        {
            presenter?.error(HomeAPIError.emptyNewEpisodes)
            return
        }
        self.newEpisodes = Array(episodes[...5])
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
    
    private func getSizeOfSeries(_ series: ChannelViewModel)-> CGSize
    {
        let seriesTitleHeight = series.title.height(withConstrainedWidth: CGFloat(SeriesCellSize.width), font: UIFont.systemFont(ofSize: 20))
        
        let height = CGFloat(SeriesCellSize.height) + seriesTitleHeight
        return CGSize(width: CGFloat(SeriesCellSize.width), height: height)
    }
    
    private func getSizeOfCourse(_ course: ChannelViewModel)-> CGSize
    {
        let courseTitleHeight = course.title.height(withConstrainedWidth: CGFloat(CourseCellSize.width), font: UIFont.systemFont(ofSize: 20))
        
        let height = CGFloat(CourseCellSize.height) + courseTitleHeight
        return CGSize(width: CGFloat(CourseCellSize.width), height: height)
    }
}
