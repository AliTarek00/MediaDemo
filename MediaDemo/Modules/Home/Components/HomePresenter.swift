//
//  HomePresenter.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

protocol HomePresenterProtocol: class
{
    var view: HomeViewProtocol? { get set }

    func error(_ error: Error)
    
    func didReceiveNewEpisodes(_ newEpisodes: [Episode])
    func didReceiveChannels(_ channels: [Channel])
    func didReceiveCategories(_ categories: [Category])
}

class HomePresenter: HomePresenterProtocol
{
    // MARK:- Properties
    
    weak var view: HomeViewProtocol?
    
    private var newEpisodesDataSource: CollectionViewDataSource<EpisodeViewModel, EpisodeCollectionViewCell>!

    private var channelsDataSource: MultiSectionCollectionViewDataSource<ChannelViewModel, ChannelSectionHeaderViewModel, ChannelCollectionViewCell, ChannelSectionHeader>!
    
    private var categoriesDataSource: CollectionViewDataSource<CategoryViewModel, CategoryCollectionViewCell>!
    
    // MARK:- Methods
    
    func error(_ error: Error)
    {
        view?.display(message: error.localizedDescription)
    }
    
    func didReceiveNewEpisodes(_ newEpisodes: [Episode])
    {
        let newEpisodesViewModels = newEpisodes.compactMap
        { (newEpisode: Episode) -> EpisodeViewModel? in
            return newEpisode.toEpisodeViewModel()
        }
        
        newEpisodesDataSource = CollectionViewDataSource(models: newEpisodesViewModels)
        view?.displayNewEpisodes(from: newEpisodesDataSource)
    }
    
    func didReceiveChannels(_ channels: [Channel])
    {
        let channelsViewModels = channels.compactMap { (channel: Channel) -> [ChannelViewModel]? in
          
            if channel.isSeriesType
            {
                let series = channel.seriesSample.compactMap
                { (media: ChannelItem) -> ChannelViewModel? in
                    return media.toChannelViewModel(isSeries: true)
                }
                return series
            }
            else
            {
                let episodes = channel.episodesSample.compactMap
                { (media: ChannelItem) -> ChannelViewModel? in
                    return media.toChannelViewModel(isSeries: false)
                }
                
                return episodes
            }
        }
        
        let sections = channels.compactMap { (channel: Channel) -> ChannelSectionHeaderViewModel? in
            let channelViewModel = channel.toChannelSectionHeaderViewModel()
            return channelViewModel
        }
        
        channelsDataSource = MultiSectionCollectionViewDataSource(models: channelsViewModels,
                                                                  sections: sections)
        view?.displayEpisodes(from: channelsDataSource)
    }
    
    func didReceiveCategories(_ categories: [Category])
    {
        let categoriesViewModels = categories.compactMap
        { (category: Category) -> CategoryViewModel? in
            return category.toCategoryViewModel()
        }
        
        categoriesDataSource = CollectionViewDataSource(models: categoriesViewModels)
        view?.displayCategories(from: categoriesDataSource)
    }
}
