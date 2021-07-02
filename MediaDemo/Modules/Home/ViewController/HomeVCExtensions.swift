//
//  HomeVCExtensions.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Toast_Swift

// MARK:- HomeViewDelegate

extension HomeViewController: HomeViewProtocol
{
    func display(message: String)
    {
        self.view.makeToast(message)
    }
    
    func displayNewEpisodes(from dataSource: CollectionViewDataSource<EpisodeViewModel, EpisodeCollectionViewCell>)
    {
        newEpisodesCollectionView.dataSource = dataSource
        refreshNewEpisodesCollectionView()
    }
    
    func displayChannels(from dataSource: MultiSectionCollectionViewDataSource<ChannelViewModel, ChannelSectionHeaderViewModel, ChannelCollectionViewCell, ChannelSectionHeader>)
    {
        channelsCollectionView.dataSource = dataSource
        refreshChannelsCollectionView()
    }
    
    func displayCategories(from dataSource: CollectionViewDataSource<CategoryViewModel, CategoryCollectionViewCell>)
    {
        categoriesCollectionView.dataSource = dataSource
        refreshCategoriesCollectionView()
    }
}

// MARK:- UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK:- UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == newEpisodesCollectionView
        {
            let size = CGSize(width: EpisodeCellSize.width, height: EpisodeCellSize.height)
            return size
        }
        
        if collectionView == channelsCollectionView
        {
            let size = interactor?.getSizeof(ChannelAt: indexPath) ?? CGSize(width: 0.0, height: 0.0)
            return size
        }
        
        if collectionView == categoriesCollectionView
        {
            let width = (categoriesCollectionView.frame.width - (collectionViewLayoutProperties.hSpaceBetweenCells + 10))
                / 2.0

            return CGSize(width: width, height: 65.0)
        }
        
        return CGSize(width: 0.0, height: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return collectionViewLayoutProperties.vSpaceBetweenCells
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == categoriesCollectionView
        {
            return 10.0
        }
        return collectionViewLayoutProperties.hSpaceBetweenCells

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if collectionView == categoriesCollectionView
        {
            return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        }
        return UIEdgeInsets(top: collectionViewLayoutProperties.sectionTopSpace, left: collectionViewLayoutProperties.sectionLeftSpace,
                            bottom: collectionViewLayoutProperties.sectionBottomSpace, right: collectionViewLayoutProperties.sectionRightSpace)
    }
    
}
